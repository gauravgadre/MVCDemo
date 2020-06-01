<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
<%@ page
	import="com.jspdemo.dao.StudentDao,com.jspdemo.bean.Student,java.util.*,java.lang.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% StudentDao std= new StudentDao();
int j=std.count();
double i=j/5.0;
int k=(int)Math.ceil(i);

//int k=(int)Math.ceil(std.count()/5.0);
%>

<%=k %>
</body>
</html>