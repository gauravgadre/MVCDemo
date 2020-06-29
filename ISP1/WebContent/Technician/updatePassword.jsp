<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="Technician.*" %>
<%@page import="java.sql.ResultSet" %>
         
<!DOCTYPE html>

<html lang="en">

<head>
      <jsp:include page="head.jsp" />     
</head>
<% 
					response.setHeader("Cache-Control","no-cache");
					response.setHeader("Cache-Control","no-store");
					
					if(session.getAttribute("temail")==null)
					response.sendRedirect("../login.jsp");
					%>
<body class="animsition">
    <div class="page-wrapper">
     
		<jsp:include page="headerMobile.jsp" /> 
      
 		<jsp:include page="sideNav.jsp" /> 
        <!-- PAGE CONTAINER-->
        <div class="page-container">
          
			<jsp:include page="topNav.jsp" /> 
            <!-- MAIN CONTENT-->
            
            <div class="main-content">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="overview-wrap">
                                    <h2 class="title-1">Set Password</h2>
                                </div>
                            </div>
                        </div>
                    	 <div class="row" style="padding-top:1%;padding-bottom:1%;">
                            <div class="col-lg-12">
                                <div class="au-card recent-report">
                                    <div class="au-card-inner" >
                                       <div class="row">
                                    <div class="col-md-3"></div>
                                    <div class="col-md-6">
                                      <div class="login-form">
                            <form action="updatePassword" method="post">
                                <div class="form-group">
                                    <label>Current Password</label>
                                    <input class="au-input au-input--full" onblur="check()" type="password" name="currentpass" required>
                                    <span id="error"></span>
                                </div>
                                <div class="form-group">
                                    <label>New Password</label>
                                    <input class="au-input au-input--full" type="password" name="newpass" required>
                                </div>
                                <div class="form-group">
                                    <label>Retype Password</label>
                                    <input class="au-input au-input--full" onblur="checkPass()" type="password" name="retypepass" required>
                                    <span id="error2"></span>
                                </div>
                                <div>                                
                                <button class="au-btn au-btn--block au-btn--green m-b-20" type="submit">set</button>
                                </div>
                            
                            </form>
                        </div>    
                                    </div>
                                    <div class="col-md-3"></div>
                                    </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                       
                    <jsp:include page="footer.jsp" /> 
                    </div>
                </div>
            </div>
            <!-- END MAIN CONTENT-->
            <!-- END PAGE CONTAINER-->
        </div>

    </div>
<%
String temail=(String)session.getAttribute("uemail");
ResultSet rs=TechDao.get("Select tpass from technician where temail='"+temail+"'");
String tpass="";
if(rs.next()){
	tpass=rs.getString("tpass");
}
%>
<jsp:include page="script.jsp" />
		<script type="text/javascript">
function check(){
	var npass = document.getElementsByName("currentpass")[0].value;	
	if(npass!=="" ){
		if(npass!=<%=tpass%>){
			document.getElementById("error").textContent="Incorrect Password";
			return false;
		}else{
			document.getElementById("error").textContent="";
			return true;
		}
	}else{
		alert("Empty");
	}
	
}

function checkPass(){
	var npass = document.getElementsByName("newpass")[0].value;
	var cpass = document.getElementsByName("retypepass")[0].value;
	if(npass!=="" && cpass!==""){
		if(npass!=cpass){
			document.getElementById("error2").textContent="Password Not Match";
			return false;
		}else{
			document.getElementById("error2").textContent="";
			return true;
		}
	}else{
		alert("Empty");
	}
	
}
</script>
</body>

</html>
<!-- end document-->
