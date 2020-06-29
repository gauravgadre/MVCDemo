<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<jsp:include page="link.jsp" />
	</head>
	<body class="animsition">
	
	<% 
	 response.setHeader("Cache-Control","no-cache");
    response.setHeader("Cache-Control","no-store");
	if(session.getAttribute("user")==null)
		response.sendRedirect("../login.jsp");  
		%>
		<div class="page-wrapper">
		<jsp:include page="headerMobile.jsp" /> 
	  		<jsp:include page="sideNav.jsp" /> 
	        <!-- PAGE .CONTAINER-->
	        <div class="page-container">
				<jsp:include page="topNav.jsp" /> 
	            <!-- MAIN CONTENT-->
			<div class="main-content">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="overview-wrap">
                                    <h2 class="title-1">Admin Profile</h2>
                                   <a href="editadmin.jsp" class="au-btn au-btn-icon au-btn--blue">Edit</a>     
                                </div>
                            </div>
                        </div>
                    <div class="login-content">
                    
                        <div class="login-form">
                        
                        <%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="Admin.DbHelper"%>
                         <%
                             Connection connection=null;
Statement stmt=null;
response.setContentType("text/html;charset=UTF-8");
//PrintWriter out = response.getWriter();

 out.println("<table class='table'><tr><th>  Name </th><th> email </th><th> password </th></tr>");   

try {

	  connection=(Connection) DbHelper.getConnection(); 
	 stmt = (Statement) connection.createStatement();  
    ResultSet rs = stmt.executeQuery("select * from adminlogin");
    while(rs.next())
    {
    	
    	out.print("<tr><td>");
    	out.println(rs.getString(4));
    	out.print("</td>");
    	
    	out.print("<td>");
    	out.println(rs.getString(2));
    	out.print("</td>");
    	out.print("<td>");
    	out.println(rs.getString(3));
    	out.print("</td>");

    	out.print("</tr>");
    	    }
    rs.close();
}
catch (Exception e)
{
	e.printStackTrace();
    	
    	
}
out.print("</table>");
	
	 %>                          
                               
                                
                              
                               
                        </div>
                        </div>
                          <jsp:include page="footer.jsp"/> 
                        </div>
                        </div>
                           
                        </div>
	                                    
	                              
	                           
	                        
	            <!-- END MAIN CONTENT-->
	           
	        </div>
	        <!-- END PAGE CONTAINER-->
		</div>
		<jsp:include page="script.jsp" />
	</body>
</html>  	