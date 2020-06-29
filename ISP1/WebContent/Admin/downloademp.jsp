<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.SQLException"%>
  <%@ page import=" java.io.PrintWriter"%>
  <%@ page import=" java.sql.Connection"%>
  <%@ page import=" java.sql.DriverManager"%>
  <%@ page import=" java.sql.PreparedStatement"%> 
 <%@ page import=" java.sql.ResultSet"%>
  <%@ page import=" java.sql.Statement"%>
    <%@page import="Admin.DbHelper" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee Report</title>

</head>
<body>
<div class="overview-wrap"> 

<h2 class="title-1" align="center">Employee Report </h2>

</div>
          
                         <%
Connection connection=null;
Statement stmt=null;
//String eid=request.getParameter("eid");;
response.setContentType("text/html;charset=UTF-8");
out.println("<table class='table'><tr><th>  eid </th><th> fname </th><th> mname </th><th> lname </th><th> mobile </th><th>email </th><th>address</th><th>jdate</th></tr>");   
		 try
		 {
				Connection con=DbHelper.getConnection();
			 PreparedStatement ps=con.prepareStatement("select * from empreport ");
			 ResultSet rs=ps.executeQuery();

		     while(rs.next())
    {
    	
    	out.print("<tr><td>");
    	out.println(rs.getInt(1));
    	out.print("</td>");
    	
    	out.print("<td>");
    	out.println(rs.getString(2));
    	out.print("</td>");
    	out.print("<td>");
    	out.println(rs.getString(3));
    	out.print("</td>");
    	out.print("<td>");
    	out.println(rs.getString(4));
    	out.print("</td>");
    	out.print("<td>");
    	out.println(rs.getString(5));
    	out.print("</td>");
    	out.print("<td>");
    	out.println(rs.getString(6));
    	out.print("</td>");
    	out.print("<td>");
    	out.println(rs.getString(7));
    	out.print("</td>");
    	out.print("<td>");
    	out.println(rs.getString(8));
    	out.print("</td>");
    	
    	out.print("</tr>");
    	
   //	request.getRequestDispatcher("sideNav.jsp").include(request, response);
    	
    }
    rs.close();
}
catch (Exception e)
{
	e.printStackTrace();
    	
    	
}
out.print("</table>");
	


%>                          
      
	     
</body>
</html>