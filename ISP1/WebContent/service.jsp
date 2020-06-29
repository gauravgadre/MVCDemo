<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<jsp:include page="link.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="header2.jsp"></jsp:include>


  <div class="container" style="margin-top:6%;margin-bottom:6%" >
				<h3 style="text-align:center;margin-bottom:3%;margin-top:3%;"><strong>All Services</strong></h3>
				
					<%@page import="java.sql.ResultSet" %>
					<%@page import="ISPPackage.ISPDao" %>
	              
					<%
						try{
							 ResultSet rs=ISPDao.get("service");
							 %>
								<div class="row">
								<% 
								while(rs.next()) {
								 	%>
									 <div class="col-lg-3 col-md-3 box wow fadeInRight">
								        <div class="card mb-3">
							           <img src="images/Service/<% out.print(rs.getString("simage")); %>" height="225px" width="225px" alt="">
							          <div class="card-body">
							            <h4 class="card-title"><% out.println(rs.getString("sname")); %></h4>
							            <p class="description"><% out.println(rs.getString("sdesc"));  %></p>
							            <p class="price"><% out.println(" Rs. "+rs.getString("sprice"));  %></p>
							            <a class="btn btn-dark py-2 px-3 btn-pill" href="addToCart.jsp?serid=<% out.print(rs.getInt("sid")); %>">Get Started</a>
							          </div>
							        </div>
								      </div>
									<%
									}
								%>
								</div>
						
						<% 
							rs.close();  
						}
						catch(Exception e)
						{ 
							System.out.println(e);
						}
					%>
	
	    			<!--/.First slide-->
	    
				

				
	 			</div>
	
<jsp:include page="footer.jsp"></jsp:include>
<jsp:include page="script.jsp"></jsp:include>
</body>
</html>