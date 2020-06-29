<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       
                        <%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="Admin.DbHelper"%>
<!DOCTYPE html>
<html>
	<head>
		<jsp:include page="link.jsp" />
	</head>
	<body class="animsition">
	
	<% 
	 response.setHeader("Cache-Control","no-cache");
    response.setHeader("Cache-Control","no-store");
	if(session.getAttribute("user")==null)
		response.sendRedirect("../login.jsp");  
		%>
		
		<div class="page-wrapper">
		<jsp:include page="headerMobile.jsp" /> 
	  		<jsp:include page="sideNav.jsp" /> 
	        <!-- PAGE .CONTAINER-->
	        <div class="page-container">
				<jsp:include page="topNav.jsp" /> 
	            <!-- MAIN CONTENT-->
			<div class="main-content">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="overview-wrap">
                                    <h2 class="title-1">User Report</h2>
                                     <button class="au-btn au-btn-icon au-btn--blue" onClick="window.print()">
                                        <i class="fa fa-download"></i>Download</button>                                        
                                </div>
                            </div>
                        </div>
                    	 <div class="row">
                            <div class="col-lg-12">
                                <div class="au-card recent-report">
                                    <div class="au-card-inner" >
                                          <div class="row">
		                <div class="col-md-4"></div>
		                <div class="col-md-4"  style="text-align:center">
		               <form method="post" action="userreports.jsp">
		                
			            <select class="mdb-select form-control" name="show">
			                <option value="0">Today</option>
			                <option value="1">Week</option>
			                <option value="2">Month</option>
			                <option value="3">Year</option>           
			            </select>
			           <br>
			           <button class="btn btn-primary" type="submit">Show</button>
			      		</form>
			       <br>
		                </div>
		                <div class="col-md-4"></div>
		                </div>
                                  <div class="table-responsive table--no-card m-b-30">

	                             <table class='table table-borderless table-striped table-earning'> 
	                              <thead>
                                      <tr>
                                     <th> name </th><th> mobile </th><th>email </th><th>package</th><th>activation date</th><th>renewval date</th>
                                       </tr>
                                  </thead>  
                                  <tbody>   
                      
                         <%
                         
                		 String show="";
	        			   if(request.getParameter("show")!=null)
	        			   {
	        				show= (String)request.getParameter("show");
	        			   
	        			   String swhere="activation_date>=DATE_SUB(NOW(), INTERVAL 48 HOUR)";
	        			   if(show.equals("0"))
	        			   {
	        				   swhere="activation_date>=DATE_SUB(NOW(), INTERVAL 48 HOUR)";
	        			   }
	        			   else if(show.equals("1"))
	        			   {
	        				   swhere="activation_date >=DATE_SUB(CURDATE(),INTERVAL 7 DAY)";
	        			   }
	        			   else if(show.equals("2"))
	        			   {
	        				   swhere="activation_date >=DATE_SUB(CURDATE(),INTERVAL 1 MONTH)";
	        			   }
	        			   else if(show.equals("3"))
	        			   {
	        				   swhere="activation_date >=DATE_SUB(CURDATE(),INTERVAL 12 MONTH);";
	        			   }
                		 try {
                			 Connection con=null;
                    		 Statement stmt=null;
                		 	 con=(Connection) DbHelper.getConnection();
                		 	 stmt = (Statement) con.createStatement();  
                		     ResultSet rs = stmt.executeQuery("select cfname,cmname,clname,pname,cemail,cphone,activation_date,renewval_date from customer_details,package,connection_details where customer_details.cid=connection_details.cid and connection_details.pid=package.pid and "+swhere+"");
                		     while(rs.next())
                		     {
                		     	
                		     	out.print("<tr><td>");
                		     	out.println(rs.getString("cfname")+" "+rs.getString("cmname")+" "+rs.getString("clname"));
                		     	out.print("</td>");
                		     	
                		     	out.print("<td>");
                		     	out.println(rs.getString("cphone"));
                		     	out.print("</td>");
                		     	out.print("<td>");
                		     	out.println(rs.getString("cemail"));
                		     	out.print("</td>");
                		     	out.print("<td>");
                		     	out.println(rs.getString("pname"));
                		     	out.print("</td>");
                		     	out.print("<td>");
                		     	out.println(rs.getString("activation_date"));
                		     	out.print("</td>");
                		     	out.print("<td>");
                		     	out.println(rs.getString("renewval_date"));
                		     	out.print("</td>");
                		 		out.print("</tr>");
                		     }
                		     rs.close();
                		 }
                		 catch (Exception e)
                		 {
                		 	e.printStackTrace();
                		     	
                		     	
                		 }
                		 
	        			   } 	
                		
	
	 %>
	 </tbody>
	 </table>
	     
                               
	   </div>
	 </div>
	 </div>
	 </div>
	 </div>
	 <jsp:include page="footer.jsp" /> 
	 </div>
	 </div>
	 </div>
	 </div>                    
                               
                               
              
      
                                 
	            <!-- END MAIN CONTENT-->
	           
	      
	        <!-- END PAGE CONTAINER-->
		</div>
		<jsp:include page="script.jsp" /> 
	</body>
</html>