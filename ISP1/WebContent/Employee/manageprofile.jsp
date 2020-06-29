<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="emp.DbConn"%>

<!DOCTYPE html>
<html>
	<head>
		<jsp:include page="link.jsp" />

		
	</head>
	
					<% 
					response.setHeader("Cache-Control","no-cache");
					response.setHeader("Cache-Control","no-store");
					
					if(session.getAttribute("uemail")==null)
					response.sendRedirect("../login.jsp");
					%>
<body  class="animsition">
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
                                    <h2 class="title-1" style="color:#000;">Manage Profile</h2>
                                     <a class="au-btn au-btn-icon au-btn--blue" href="updatePassword.jsp">UpdatePassword</a>
                                        
                                </div>
                            </div>
                        </div>
                    	 <div class="row">
                            <div class="col-lg-12">
                                <div class="au-card recent-report">
                                    <div class="au-card-inner">
		               
	              	 <%
	              	try{  
	              		Statement stmt=null;
	              		String email=(String)session.getAttribute("uemail");
	          			ResultSet rs=DbConn.get("select * from emp where email='"+email+"'");	          	
	          			 if(rs.next()) {
	          				 %>	          				
	          						<div class="col-md-2">
									  <img height=225px width=225px src="images/<% out.print(rs.getString("idproof")); %>" alt="">
									</div>
									<div class="col-md-4" style="margin:3%">
									<h4 style="color:#000;">Name :- <% out.print(rs.getString("ename")+" "+ rs.getString("mname")+" "+ rs.getString("lname"));%></h4> 
								  	<h4 style="color:#000;">Email :- <% out.print(rs.getString("email"));%></h4> 
								  	<h4 style="color:#000;">Contact No :- <% out.print(rs.getString("mobile"));%></h4> 
								  	<h4 style="color:#000;">Gender :- <% out.print(rs.getString("gender"));%></h4> 
								  	<h4 style="color:#000;">Password :- <% out.print(rs.getString("password"));%></h4> 
								  	<h4 style="color:#000;">Address :- <% out.print(rs.getString("address"));%></h4> 
								  	<h4 style="color:#000;">Birth Date :- <% out.print(rs.getString("dob"));%></h4> 
								  	</div>     
	          				 <%  				 				
	          			 }
	          			 
	          			rs.close();  
	          			}catch(Exception e){ System.out.println(e);}   	 
	              	 
	              	 %>
	              			
	   									</div>
	                                </div>
	                            </div>
	         				 </div>
	         				    <jsp:include page="footer.jsp" />
	                	 </div>
	                   </div>
	                </div>
	            </div>
	            
	        </div>
	        <!-- END PAGE CONTAINER-->
	 
        <jsp:include page="script.jsp" />
	</body>
</html>

