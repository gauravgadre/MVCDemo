<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="ISPPackage.ISPDao" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.lang.String" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.ListIterator" %>
<%@page import="java.util.List" %>
<%@page import="java.util.Arrays" %>
<!DOCTYPE html>
<html lang="en">
<head>  
</head>
<body>
<%
String id=(String)request.getParameter("id");
  	String cart=(String)session.getAttribute("add_to_cart");
          	
	  cart=cart.trim();
	  String str[] = cart.split(" ");
List<String> al = new ArrayList<String>();

al = Arrays.asList(str);
      ListIterator<String> listItr = al.listIterator();
   		String cart2= "";
      while(listItr.hasNext()) {
          String val=(String)listItr.next();
          if(val.contains(id)){
        		cart2=cart2+"";  
          	} 
          else{
        	  cart2=cart2+" "+val;
          }
     	}    
      session.setAttribute("add_to_cart", cart2);
      response.sendRedirect("index.jsp");
 System.out.print(cart2);
  %>
</body>

</html>