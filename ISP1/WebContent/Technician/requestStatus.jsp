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
                                    <h2 class="title-1">Update Status</h2>
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
      
<!-- Form -->
        <form class="text-center" action="requestStatus" method="post" style="color: #757575;">
<%
int cid=Integer.parseInt(request.getParameter("cid"));
ResultSet rs=TechDao.get("Select rstatus from allot_technician a,request r,customer_details c where a.rid=r.rid and r.cid=c.cid and c.cid="+cid);
String status="";
String val1="";
String val2="";
String val3="";
String val4="";
if(rs.next()){
	status=rs.getString("rstatus");
	if(status.equals("1")) {
		val1="disabled";
		val2="selected";
		val3="disabled";
		val4="disabled";
	}
	else if(status.equals("2")){
		val1="disabled";
		val2="disabled";
		val3="selected";
		val4="disabled";
	}
	else if(status.equals("3")){
		val1="disabled";
		val2="disabled";
		val3="disabled";
		val4="selected";
	}
}
%>
			<input type="hidden" name="cid" value="<%=cid%>">
            
            <select class="mdb-select form-control" name="status">
                <option value="1" <%=val1 %>>Waiting</option>
                <option value="2" <%=val2 %>>Accept</option>
                <option value="3" <%=val3 %>>Processed</option>
                <option value="4" <%=val4 %>>Connected</option>           
            </select>

			<br>           
            <!-- Send button -->
            <button class="au-btn au-btn--block au-btn--green m-b-20" type="submit">Update</button>

        </form>
        <!-- Form -->

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

<jsp:include page="script.jsp" />

</body>

</html>
<!-- end document-->

