<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.SQLException"%>
  <%@ page import=" java.io.PrintWriter"%>
  <%@ page import=" java.sql.Connection"%>
  <%@ page import=" java.sql.DriverManager"%>
  <%@ page import=" java.sql.PreparedStatement"%> 
 <%@ page import=" java.sql.ResultSet"%>
  <%@ page import=" java.sql.Statement"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee Report</title>

</head>
<body>
<div class="overview-wrap"> 
<h2 class="title-1" align="center">Employee Report </h2>
<div class="overview-wrap">

<%
                         Connection connection=null;
                		 Statement stmt=null;
                		 String selectedValue=request.getParameter("filter");
                		 out.println("Selected Value is: "+selectedValue);
                		
                		 String sdate="";
                		  ResultSet rs=null;
                		  response.setContentType("text/html;charset=UTF-8");
out.println("<table class='table'><tr><th>  eid </th><th> fname </th><th> mname </th><th> lname </th><th> mobile </th><th>email </th><th>address</th><th>jdate</th></tr>");   
		 try
		 {
				Class.forName("com.mysql.jdbc.Driver");
			 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/employeedb","root","mysql123");
			 System.out.println("connected");
			 stmt = (Statement) connection.createStatement(); 
			 if(selectedValue.equals("1"))
		 	 rs = stmt.executeQuery(" SELECT * FROM empreport WHERE jdate>=DATE_SUB(NOW(), INTERVAL 48 HOUR) ");
		 		
		 	else
		 			if(selectedValue.equals("2"))
		 				 rs = stmt.executeQuery(" select * from empreport where  jdate >=DATE_SUB(CURDATE(),INTERVAL 7 DAY) ");
		 		
		 			else
 		 			if(selectedValue.equals("3"))
 		 		
 		 				rs = stmt.executeQuery("select * from empreport where  jdate >=DATE_SUB(CURDATE(),INTERVAL 1 MONTH) ");
 		 			else
     		 			if(selectedValue.equals("4"))
     		 		
     		 				rs = stmt.executeQuery("select * from empreport where `jdate` BETWEEN DATE_SUB( CURDATE( ) ,INTERVAL 12  MONTH ) AND DATE_SUB( CURDATE( ) ,INTERVAL 6 MONTH ) ");
		 		


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
      
	</div>
	</div>        
</body>
</html>