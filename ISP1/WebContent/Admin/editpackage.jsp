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
                                    <h2 class="title-1">Edit Package</h2>
                                 
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
                 		String pid=request.getParameter("pid");
                 		Connection con=null;
                 		Statement stmt=null;
                 			try {
                 				DbHelper db=new DbHelper();
                 				 con=(Connection) db.getConnection(); 
                 			 stmt = (Statement) con.createStatement();  
                 		    ResultSet rs = stmt.executeQuery("select * from package where pid='"+pid+"'");
                 		    while(rs.next())
                 		    {
                 		    	%>
                            <form action="packageupdate" method="post" enctype="multipart/form-data">
                             <div class="form-group">
                                <div class="form-group">
                                   
                                    <input class="au-input au-input--full" type="hidden" name="pid" value="<% out.print(rs.getString(1)); %>" hidden required>
                                </div>
                                <div class="form-group">
                                    <label>Package name</label>
                                    <input class="au-input au-input--full" type="text" name="pname" value="<% out.print(rs.getString(2)); %>"  pattern="[A-Za-z,\s]{3,30}" title="only characters are alloweed"  required>
                                </div>
                                <div class="form-group">
                                    <label>Duration(in Months)</label>
                                    <input class="au-input au-input--full" type="text" name="duration" value="<% out.print(rs.getString(3)); %>"  required>
                                </div>
                                 <div class="form-group">
                                    <label>Price</label>
                                    <input class="au-input au-input--full" type="text" name="price" value="<% out.print(rs.getString(4)); %>"  pattern="[0-9]+" title="number only" required>
                                </div>
                                 <div class="form-group">
                                    <label>Speed</label>
                                    <input class="au-input au-input--full" type="text" name="speed" value="<% out.print(rs.getString(5)); %>"  required>
                                </div>
                                 <div class="form-group">
                                    <label>Description</label>
                                    <input class="au-input au-input--full" type="text" name="description" value="<% out.print(rs.getString(6)); %>"  pattern="[A-Za-z,\s]{3,30}" title="only characters are alloweed" required>
                                </div>
                                <div class="form-group">
                                    <label>Image</label>
                                    <input class="au-input au-input--full" type="file" name="ImageFile" height="20px",width="20px" value="<%=rs.getString(7) %>" >
                                   <img src= "<%="../images/Package/"+(rs.getString(7)) %>"/>
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
	                           </div></div>
	                           </div>
	                           <jsp:include page="footer.jsp" /> 
	                           </div></div>         
	                                </div>
	                           </div>
	                        
	            <!-- END MAIN CONTENT-->
	           </div>
	      <jsp:include page="script.jsp" />   
	</body>
</html>