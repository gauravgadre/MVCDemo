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
	
		<div class="container"  style="margin-top:6%;margin-bottom:6%">
			<h3 style="text-align:center;margin-bottom:3%;margin-top:3%;"><strong>All Packages</strong></h3>
				
				<div class="carousel-inner" role="listbox">
					<%@page import="java.sql.ResultSet" %>
					<%@page import="ISPPackage.ISPDao" %>
					
					<%
						try{  
							ResultSet rs=ISPDao.get("Package");
							%>
							<!--First slide-->
							<div class="row">
								<% 
								while(rs.next()) {
								%>
									<div class="col-md-4">
										<div class="card mb-2">  
											<div class="card-body">
												<h3><% out.print(rs.getString("pname")); %></h3>
												<h4><span> <% out.print( rs.getString("speed")); %></span></h4>
												<ul>
													<li><i class="ion-android-checkmark-circle"></i><% out.print( rs.getString("duration")); %> </li>
													<li><i class="ion-android-checkmark-circle"></i>Rs.<span> <% out.print( rs.getString("price")); %></span> </li>
													<li><i class="ion-android-checkmark-circle"></i> <% out.print( rs.getString("description")); %></li>
												</ul>
												<a class="btn btn-dark py-2 px-3 btn-pill" href="addToCart.jsp?pid=<% out.print(rs.getInt("pid")); %>">Get Started</a>
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
				</div>
			</div>
		
		
		<jsp:include page="footer.jsp"></jsp:include>
		<jsp:include page="script.jsp"></jsp:include>
	</body>
</html>