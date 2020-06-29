<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="Admin.DbHelper"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
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
                                    <h2 class="title-1">Manage Service</h2>
                                     <a class="au-btn au-btn-icon au-btn--blue" href="service.jsp">Add Services</a>                                   
                                </div>
                            </div>
                        </div>
                    	 <div class="row">
                            <div class="col-lg-12">
                                <div class="au-card recent-report">
                                    <div class="au-card-inner" >
                                     <div class="table-responsive table--no-card m-b-30">
                                             <table class="table table-borderless table-earning">
                                                     <thead>
                                                         <tr>
                                                         <th> Servicename </th><th> information </th><th> Image </th><th> Price </th><th>Action</th><th>Action</th>
                                                         </tr>
                                                         </thead>
                                                         <tbody>
                     
                         <%
                             Connection connection=null;
Statement stmt=null;

try {
	DbHelper db=new DbHelper();
	  connection=(Connection) DbHelper.getConnection(); 
	 stmt = (Statement) connection.createStatement();  
    ResultSet rs = stmt.executeQuery("select * from service");
    while(rs.next())
    {
    	
    	out.print("<tr><td>");
    	
    	out.println(rs.getString(2));
    	out.print("</td>");
    	out.print("<td>");
    	out.println(rs.getString(3));
    	out.print("</td>");
    	out.print("<td>");
    	out.println(rs.getString(4));
    	out.print("</td>");
    	out.print("<td>");
    	out.println(rs.getString(5));
    	out.print("</td>");
    	out.print("<td>");
   	  out.print("<a class='btn btn-black' href='editservice.jsp?sid="+rs.getString(1)+"'>EDIT</a>");	        		    	 
   	  out.print("</td>");
   	  out.print("<td>");
   	  out.print("<a class='btn btn-black' href='deleteservice?sid="+rs.getString(1)+"'>DELETE</a>");
 		  out.print("</td></tr>");	
    }
    rs.close();
}
catch (Exception e)
{
	e.printStackTrace();   	
}	
	 %>                          
                               
                                
                        </tbody>
                        </table>        
                      
                        </div>
	                       </div>             
	                        </div>
	                       </div>      
	                          </div> 
	                        <jsp:include page="footer.jsp" /> 
	            <!-- END MAIN CONTENT-->
	           </div></div></div>
	        </div>
	        <!-- END PAGE CONTAINER-->
		</div>
		<jsp:include page="script.jsp" /> 
	</body>
</html>