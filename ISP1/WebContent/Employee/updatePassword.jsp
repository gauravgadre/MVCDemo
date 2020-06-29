<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="emp.DbConn" %>
<%@page import="java.sql.ResultSet" %>
         
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<jsp:include page="link.jsp" />
</head>
	<body>
		<% 			response.setHeader("Cache-Control","no-cache");
					response.setHeader("Cache-Control","no-store");
					if(session.getAttribute("uemail")==null)
					response.sendRedirect("../login.jsp");
	%>
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
	                                    <h2 class="title-1" style="color:#000;">Set Password</h2>
	                                </div>
	                            </div>
	                        </div>
	                       
	                        <div class="row" style="text-align:center">
	                        
	                            <div class="col-lg-12" >
	                               <div class="au-card recent-report">
	                                <div class="au-card-inner">
	                                   <div class="row">
	                                   <div class="col-md-3"></div>
	                                   
								<div class="col-md-6">
	                            
	                               <!--Card content-->
    <div class="card-body px-lg-5 pt-0">

        <!-- Form -->
        <form class="text-center" action="updatePassword" method="post" style="color: #757575;">
		<%
		String email=(String)session.getAttribute("uemail");
		ResultSet rs=DbConn.get("Select password from emp where email='"+email+"'");
		String password="";
		if(rs.next()){
			password=rs.getString("password");
		}
		%>
		
		<div class="md-form md-outline input-with-post-icon datepicker">
		  <input  type="text" id="example" onblur="check()" class="form-control" name="currentpass" placeholder="Current Password">
		 
		  <span id="error"></span>
		</div>

		<div class="md-form md-outline input-with-post-icon datepicker">
		  <input  type="text" id="example" class="form-control" name="newpass" placeholder="New Password">
	
		</div>
		<div class="md-form md-outline input-with-post-icon datepicker">
		  <input  type="text" id="example" onblur="checkPass()" class="form-control" name="retypepass" placeholder="Retype Password">
		  
		  <span id="error2"></span>
		</div>
		
            <!-- Send button -->
            <button class="au-btn au-btn--block au-btn--green m-b-20" type="submit">Set</button>

        </form>
        <!-- Form -->

    </div>
	           </div>      
            <div class="col-md-3"></div>
	                                   </div>
	                            </div>
	                             </div>
	                             
 

</div>
<!-- Material form contact -->

	                            </div>
	                       
	                    
	            <!-- END MAIN CONTENT-->
	            <jsp:include page="footer.jsp"/>
	            </div>
	                </div>
	            </div> 
	        </div>
	        <!-- END PAGE CONTAINER-->
		</div>       
		<script type="text/javascript">
function check(){
	var npass = document.getElementsByName("currentpass")[0].value;	
	if(npass!=="" ){
		if(npass!=<%=password%>){
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
 <jsp:include page="script.jsp"/>
</body>
</html>
