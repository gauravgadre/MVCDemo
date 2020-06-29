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

  <div class="container" style="margin-top:6%;margin-bottom:6%">
				<h3 style="text-align:center;margin-bottom:3%;margin-top:3%;"><strong>All Products</strong></h3>
				
					<%@page import="java.sql.ResultSet" %>
	              <%@page import="ISPPackage.ISPDao" %>
					<%
						try{ 
							 ResultSet rs=ISPDao.get("product");
							 %>
								<div class="row" style="margin-bottom:6%;">
								<% 
								while(rs.next()) {
								 	%>
									 <div class="col-lg-3 col-md-3 box wow fadeInRight">
								        <div class="card mb-3">
							          <img src="images/Product/<% out.print(rs.getString("prodimage")); %>" height="225px" width="225px" alt="">
								          <div class="card-body">
								            <h4 class="card-title"><% out.println(rs.getString("prodname")); %></h4>
								            <p class="description"><% out.println(rs.getString("proddesc"));  %></p>
								            <p class="price"><% out.println(" Rs. "+rs.getString("prodprice"));  %></p>
								            <a class="btn btn-dark py-2 px-3 btn-pill" href="addToCart.jsp?prodid=<% out.print(rs.getInt("prodid")); %>">Get Started</a>
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