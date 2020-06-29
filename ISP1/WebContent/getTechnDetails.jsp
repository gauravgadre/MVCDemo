<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<jsp:include page="link.jsp"/>
</head>
<body>
<jsp:include page="header2.jsp"/>
<% 
					response.setHeader("Cache-Control","no-cache");
					response.setHeader("Cache-Control","no-store");
					
					if(session.getAttribute("cemail")==null)
					response.sendRedirect("login.jsp");
	%>
<h3 style="text-align:center;margin-top:10%"><b>Technincian Details</b></h3>
<div class="row" style="margin-bottom:10%">
<div class="col-md-3"></div>
<%@page import="ISPPackage.ISPDao" %>
           <%@page import="java.sql.ResultSet" %>
              
              <%
            try{  
			int cid=ISPDao.getcid("customer_details where cemail='"+(String)session.getAttribute("cemail")+"'");
			
  			 ResultSet rs=ISPDao.get("technician where tid=(select tid from allot_technician where rid=(select rid from request where cid="+cid+"));");
  			 %>
  			 
  			 <% 
  			 if(rs.next()) {
  				 %>
  				
  					<div class="col-md-2">
					  <img height=225px width=225px src="images/<% out.print(rs.getString("tidproof")); %>" alt="">
					</div>
					<div class="col-md-4" style="margin:3%">
					<h4>Name :- <% out.print(rs.getString("tfname")+" "+ rs.getString("tmname")+" "+ rs.getString("tlname"));%></h4> 
				  	<h4>Email :- <% out.print(rs.getString("temail"));%></h4> 
				  	<h4>Contact No :- <% out.print(rs.getString("tphone"));%></h4> 
				  	<h4>Gender :- <% out.print(rs.getString("tgender"));%></h4> 
				  	</div> 
  				 
					   
  				 <%  				 				
  			 }
  			 else{
  				 %>
  				 <div class="col-md-6" style="text-align:center;">
  				 <h4>Not Yet Alloted.</h4>  				 
  				 </div>  				 
  				 <%  				 
  			 }
  			rs.close();  
  			}catch(Exception e){ System.out.println(e);}
              %>

<div class="col-md-3"></div>
</div>
<jsp:include page="footer.jsp"/>
<jsp:include page="script.jsp"></jsp:include>
</html>