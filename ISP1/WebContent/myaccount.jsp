<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="ISPPackage.ISPDao" %>
 <%@page import="java.util.*" %>
 <%@page import="java.sql.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <jsp:include page="link.jsp"></jsp:include>
</head>
<body>
 <jsp:include page="header2.jsp"></jsp:include>
<% 
					response.setHeader("Cache-Control","no-cache");
					response.setHeader("Cache-Control","no-store");
					
					if(session.getAttribute("cemail")==null)
					response.sendRedirect("login.jsp");
					
					String cemail=(String)session.getAttribute("cemail");
	%>
<div class="container my-5 z-depth-1" style="margin-top:6%;margin-bottom:6%;padding:4%">
  <!--Section: Content-->
  <section class="dark-grey-text" >
  <br>
   <h2 class="font-weight-bold mb-4">My Account</h2>
    <div class="row pr-lg-5" >
   
      <div class="col-md-7 mb-4">
	
        <%
try{
	
	String sql=" customer_details where cemail='"+cemail+"'";
	
ResultSet rs=ISPDao.get(sql);
if(rs.next()){
	%>
	<h3 class="font-weight-bold">Your Details</h3>
	 <h5><% out.print(rs.getString("cfname")+" "+rs.getString("cmname")+" "+rs.getString("clname")); %></h5>
     <h6><% out.print(rs.getString("cemail")); %></h6>
     <h6><% out.print(rs.getString("cphone")); %></h6>	
     <h6><% out.print(rs.getString("cflat")+", "+rs.getString("cbuilding")+", "+rs.getString("cstreet")+", "+rs.getString("ccity")+", "+rs.getString("ctaluka")); %></h6>
     <h6><% out.print(rs.getString("cdistrict")+",Pincode:- "+rs.getString("cpincode")); %></h6>
	<%
}

}catch(Exception e){
	System.out.println(e);
}
%> 
         </div>
		<div class="col-md-5">
		<%
		try{
			String sql2="";
			String returnval=ISPDao.getId("request r,customer_details c where r.cid=c.cid and r.rstatus=4  and cemail='"+cemail+"'");
			if(returnval=="Found")
			{
				sql2="customer_details,connection_details,package  where customer_details.cid=connection_details.cid and connection_details.pid=package.pid and customer_details.cemail='"+cemail+"'";
				%>
				<h3 class="font-weight-bold">Package Details</h3>
				<%
			}
			else{
				%>
				<h3 class="font-weight-bold">Requested Package Details</h3>
				<%
				sql2="customer_details,package,request where customer_details.cid=request.cid and request.pid=package.pid and customer_details.cemail='"+cemail+"'";
			}
			
ResultSet rs2=ISPDao.get(sql2);

if(rs2.next()){
	%>
	
	 <h5><%="Package Name :- "+rs2.getString("pname") %></h5>
     <h6><%="Speed :- "+rs2.getString("speed") %></h6>
     <h6><%="Description :- "+rs2.getString("description") %></h6>	
     <h6><%="Duration :- "+rs2.getString("duration")+" Month"  %></h6>
     <h6><%="Price :-"+rs2.getString("price") %></h6>
	<%
	
}		
		}catch(Exception e){
			System.out.println(e);
		}
		
		
		
		%>
		</div>
         </div>

</section>
</div>
<jsp:include page="footer.jsp"/>
<jsp:include page="script.jsp"></jsp:include>
</body>
</html>