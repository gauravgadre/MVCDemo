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
<%@page import="ISPPackage.ISPDao" %>
           <%@page import="java.sql.ResultSet" %>              
              <%             
            try{            	
  			
  			int cid=ISPDao.getcid("customer_details where cemail='"+(String)session.getAttribute("cemail")+"'");
			
			String liclass1="";
			String liclass2="";
			String liclass3="";
			String liclass4="";
			String text1="Your order is Not yet Placed.";
			String text2="Your Request is Not yet accepted.";
			String text3="Not Processed";
			String text4="You don't get the connection yet.";
			
			ResultSet rs=ISPDao.get("request where rstatus=0 and cid="+cid);
  			if(rs.next())
  			{
  				liclass1="completed";
  				text1="Your order is Placed.";
  			}
  			
  			ResultSet rs2=ISPDao.get("request r,allot_technician a where r.rid=a.rid and rstatus=2 and cid="+cid);
  			if(rs2.next()){
  				liclass1="completed";
  				text1="Your order is Placed.";
  				liclass2="completed";
  				text2="Your Request is Accepted. And Technician is alloted.";
  			}

  			ResultSet rs3=ISPDao.get("request where rstatus=3 and cid="+cid);
  			if(rs3.next()){
  				liclass1="completed";
  				liclass2="completed";
  				liclass3="completed";
  				text1="Your order is Placed.";
  				text2="Your Request is Accepted.";
  				text3="Processing Currently.";
  			}
  			
  			ResultSet rs4=ISPDao.get("request where rstatus=4 and cid="+cid);
  			if(rs4.next()){
  				liclass1="completed";
  				liclass2="completed";
  				liclass3="completed";
  				liclass4="completed";
  				text1="Your order is Placed.";
  				text2="Your Request is Accepted.";
  				text3="Processing Currently.";
  				text4="You got the connection successfully.";
  			}
  			%>
  			<!-- Vertical Steppers -->
<h3 style="text-align:center;margin-top:6%;"><b>Order Status</b></h3>
<div class="row mt-1"style="margin-bottom:6%">
	<div class="col-md-3"></div>
  <div class="col-md-6">
    <ul class="stepper stepper-vertical">
  			<li class="<% out.print(liclass1);%>">
		        <a href="#!">
		          <span class="circle">1</span>
		          <span class="label">Order Place</span>
		        </a>
		        <div class="step-content grey lighten-3">
					<% out.print(text1);%>
		        </div>
		      </li>
		      
		      <li class="<% out.print(liclass2);%>">
		        <a href="#!">
		          <span class="circle">2</span>
		          <span class="label">Request Accepted & Allot Technician</span>
		        </a>
		        <div class="step-content grey lighten-3">
					<% out.print(text2);%>
		        </div>
		      </li>
		      
		      <li class="<% out.print(liclass3);%>">
		        <a href="#!">
		          <span class="circle">3</span>
		          <span class="label">Process</span>
		        </a>
		        <div class="step-content grey lighten-3">
					<% out.print(text3);%>
		        </div>
		      </li>
		      
		      <li class="<% out.print(liclass4);%>">
		        <a href="#!">
		          <span class="circle">4</span>
		          <span class="label">Connected</span>
		        </a>
		        <div class="step-content grey lighten-3">
					<% out.print(text4);%>
		        </div>
		      </li>
  			<%
  			rs.close();  
  			rs2.close();  
  			rs3.close();  
  			rs4.close();  
  			}
              catch(Exception e){ System.out.println(e);}
           %>
    </ul>
  </div>
  <div class="col-md-3"></div>
</div>

<!-- Steppers Navigation -->

<!-- /.Vertical Steppers -->



<jsp:include page="footer.jsp"/>
<jsp:include page="script.jsp"/>
</body>
</html>