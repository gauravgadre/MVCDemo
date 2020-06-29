<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="Admin.DbHelper"%>
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
                                    <h2 class="title-1">Edit Profile</h2>
                                 
                                </div>
                            </div>
                        </div>
                    <div class="login-content">
                    <center>
                    <h4>
                    <%if(null!=request.getAttribute("errormsg")){
                    	 out.println ( request.getAttribute("errormsg"));                    	  
                       } %>
                       </h4>
                       </center>
                       <div class="row">
                       <div class="col-md-3"></div>
                       <div class="col-md-6">
                         <div class="login-form">
                        <%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
                         <%
                         response.setContentType("text/html;charset=UTF-8");
                 		//PrintWriter out = response.getWriter();
                 		String uid=(String)session.getAttribute("user");
                 		Connection connection=null;
                 		Statement stmt=null;
                 			try {
                 			
                 				  connection=(Connection) DbHelper.getConnection(); 
                 			
                 			 stmt = (Statement) connection.createStatement();  
                 		    ResultSet rs = stmt.executeQuery("select * from adminlogin where email='"+uid+"'");
                 		    while(rs.next())
                 		    {
                 		    	%>
                            <form action="adminprofiledb.jsp" method="post">
                             <div class="form-group">
                                <div class="form-group">                                    
                                    <input class="au-input au-input--full" type="hidden" name="uid" value="<% out.print(rs.getString(1)); %>"  required>
                                </div>
                                <div class="form-group">
                                    <label>Name</label>
                                    <input class="au-input au-input--full" type="text" name="name" value="<% out.print(rs.getString(4)); %>"  pattern="/^[a-zA-Z\ ]$/" title="Characters Only" required>
                                </div>
                               <div class="form-group">
                                    <label>Email id</label>
                                    <input class="au-input au-input--full" type="email" name="email" value="<% out.print(rs.getString(2)); %>"  pattern="/^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-z]{2,4}+$/" title="email contains @" required>
                                </div>
                                
                               
                                <div class="form-group">
                                    <label>Password</label>
                                    <input class="au-input au-input--full" type="text" name="password" value="<% out.print(rs.getString(3)); %>" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"  required>
                                </div>
                                <button class="au-btn au-btn--block au-btn--green m-b-20" type="submit">update</button>
                               
                        
                        <%
                 	}
                 			}
                 catch(Exception e)
                 			{
                 				System.out.print(e.toString());
                 			}
                 	
                 			
	
	
                 			%>                          
	                        </div>
	                        </form>
	                        </div>
	                   
                       </div>
                       <div class="col-md-3"></div>
                       </div>
                           </div>
	                        <jsp:include page="footer.jsp" />
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