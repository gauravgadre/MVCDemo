<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

</head>
<body>
<div>

<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="java.lang.String" %>
<%@page import="ISPPackage.ISPDao" %>
<%

String cart=(String)session.getAttribute("add_to_cart");
//String cid=(String)s.getAttribute("cid");
String pid=request.getParameter("pid");
String prodid=request.getParameter("prodid");
String serid=request.getParameter("serid");


	 if(pid!=null){
		 if((String)session.getAttribute("cid")!=null){
				
			 String returnval=ISPDao.getId("request where cid="+(String)session.getAttribute("cid"));	
			 if(returnval.equals("Found")){
				 response.sendRedirect("index.jsp#pricing");	
			 }
			 else
				 if(cart==null){
					cart="pid-"+pid;
					session.setAttribute("add_to_cart", cart);				
					response.sendRedirect("index.jsp#pricing");
				}
				else
				if(!cart.contains("pid")){
					cart=cart+" pid-"+pid;	
					session.setAttribute("add_to_cart", cart);
					response.sendRedirect("index.jsp#pricing");
				}
		 }
		 else{		
			if(cart==null){
				cart="pid-"+pid;
				session.setAttribute("add_to_cart", cart);				
				response.sendRedirect("index.jsp#pricing");
			}
			else
			if(!cart.contains("pid")){
				cart=cart+" pid-"+pid;	
				session.setAttribute("add_to_cart", cart);
				response.sendRedirect("index.jsp#pricing");
			}
		 }
		}
if(prodid!=null){
	if(cart==null){
		cart="prod-"+prodid;
		session.setAttribute("add_to_cart", cart);
		response.sendRedirect("index.jsp#team");
	}else
	{
	cart=cart+" prod-"+prodid;
	session.setAttribute("add_to_cart", cart);
	response.sendRedirect("index.jsp#team");
	}
}
if(serid!=null){
	if(cart==null){
		cart="ser-"+serid;
		session.setAttribute("add_to_cart", cart);
		response.sendRedirect("index.jsp#faq");
	}else
	{
	cart=cart+" ser-"+serid;
	session.setAttribute("add_to_cart", cart);
	response.sendRedirect("index.jsp#faq");
	}
}

%>
</div>


</body>
</html>