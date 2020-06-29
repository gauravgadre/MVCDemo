<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@page import="emp.DbConn" %>

<% 
Connection conn = null;
PreparedStatement st = null;
String tid= request.getParameter("tid");	
String tname= request.getParameter("tname");
String mname= request.getParameter("mname");
String lname= request.getParameter("lname");
String email= request.getParameter("email");
String password= request.getParameter("password");
String mobile= request.getParameter("mobile");
String dob= request.getParameter("dob");
String uname= request.getParameter("uname");
String gender= request.getParameter("gender");
String idproof= request.getParameter("idproof");
String addproof= request.getParameter("addproof");
String passport= request.getParameter("passport");
String ccity= request.getParameter("ccity");
String status= request.getParameter("status");

try
{ 
	conn = DbConn.createConnection();
  Statement stmt=conn.createStatement();  
  int i= stmt.executeUpdate("Update technician set tname='"+tname+"',mname='"+mname+"',lname='"+lname+"',uname='"+uname+"',email='"+email+"',ccity='"+ccity+"',password='"+password+"',dob='"+dob+"',mobile='"+mobile+"',gender='"+gender+"',idproof='"+idproof+"',addproof='"+addproof+"',passport='"+passport+"',status='"+status+"'where tid='"+tid+"'");
  
 	if(i>0)
		{
			response.sendRedirect("view.jsp");
		}

else 
{
	request.setAttribute("error", "Data Not Inserted");
	request.getRequestDispatcher("error.jsp").include(request, response);
}
		conn.close();  
}

catch(Exception e)
{ 
out.println(e);
}



	
%>