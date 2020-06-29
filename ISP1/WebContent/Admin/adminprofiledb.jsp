<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@page import="Admin.DbHelper"%>
<% 
Connection conn = null;
PreparedStatement st = null;
String uid= request.getParameter("uid");
String name= request.getParameter("name");
String email= request.getParameter("email");
String password= request.getParameter("password");


try
{ 

	  conn=(Connection) DbHelper.getConnection(); 
	st=conn.prepareStatement("Update adminlogin set aname='"+name+"',email='"+email+"',password='"+password+"' where aid='"+uid+"'");
	
	int result=st.executeUpdate();
	//out.print("updated");
	out.print(email);
	out.print(password);
	
	System.out.println(result);
	RequestDispatcher rd=request.getRequestDispatcher("adminprofile.jsp");
	rd.forward(request,response);
	
//	out.print("<a href=logout>logout</a>");
	

}

catch(Exception cx)
{
System.out.println(cx.toString());
} 


	
%>