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
                                    <h2 class="title-1">Edit Employee</h2>
                                 
                                </div>
                            </div>
                        </div>
                    <div class="login-content">
                     <div class="row">
                       <div class="col-md-3"></div>
                       <div class="col-md-6">
                    <center>
                    <h4><%if(null!=request.getAttribute("errormsg")){
                    	 out.println ( request.getAttribute("errormsg"));
                    	  
                       } %></h4>
                       </center>
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
                 		String sid=request.getParameter("sid");
                 		Connection connection=null;
                 		Statement stmt=null;
                 			try {
                 			DbHelper db=new DbHelper();
                 			 connection=(Connection) db.getConnection(); 
                 			 stmt = (Statement) connection.createStatement();  
                 		    ResultSet rs = stmt.executeQuery("select * from service where sid='"+sid+"'");
                 		    while(rs.next())
                 		    {
                 		    	%>
                            <form action="serviceupdate" method="post" enctype="multipart/form-data">
                             <div class="form-group">
                                <div class="form-group">
                                   
                                    <input class="au-input au-input--full" type="hidden" name="sid" value="<% out.print(rs.getString(1)); %>" hidden required>
                                </div>
                               
                               <div class="form-group">
                                    <label>Service name</label>
                                    <input class="au-input au-input--full" type="text" name="sname" value="<% out.print(rs.getString(2)); %>"  pattern="[A-Za-z,\s]{3,30}" title="only characters are alloweed"  required>
                                </div>
                                <div class="form-group">
                                    <label>Description</label>
                                    <input class="au-input au-input--full" type="text" name="sdesc" value="<% out.print(rs.getString(3)); %>"  required>
                                </div>
                            
                                <div class="form-group">
                                    <label>Image</label>
                                    <input class="au-input au-input--full" type="file" name="ImageFile" height="20px",width="20px"value="<%=(rs.getString(4)) %>" >
                                   <img src= "<%="../images/Service/"+(rs.getString(4)) %>"/>
                                </div>
                               <div class="form-group">
                                    <label>Price</label>
                                    <input class="au-input au-input--full" type="text" name="sprice" value="<% out.print(rs.getString(5)); %>"  pattern="[0-9\. ]+" title="number only" required>
                                </div>
                                <button class="au-btn au-btn--block au-btn--green m-b-20" type="submit">update</button>
                               
                          </div></form> 
                        </div>
                        <%
                 	}
                 			}
                 catch(Exception e)
                 			{
                 				System.out.print(e.toString());
                 			}
                 	
                 			
	
	 %>                          
	                           </div></div></div>
	                           <jsp:include page="footer.jsp" /> 
	                           </div></div>         
	                                </div>
	                           
	                     </div>   
	            <!-- END MAIN CONTENT-->
	           </div>
	        <jsp:include page="script.jsp" /> 
	</body>
</html>