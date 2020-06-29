<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String cart=(String)session.getAttribute("add_to_cart");

if(cart!=null) {
	session.setAttribute("add_to_cart",null);
	response.sendRedirect("index.jsp");
}
%>
</body>
</html>