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
                                    <h2 class="title-1">Payment Report</h2>
                                    <input type="button" class="au-btn au-btn-icon au-btn--blue" value="Download" onClick="window.print()">
                                        
                                </div>
                            </div>
                        </div>
	            
	                        <div class="row">
	                            <div class="col-md-12">
	                          		<div class="au-card recent-report">
                                    <div class="au-card-inner" > 
                                    <div class="row">
		                <div class="col-md-4"></div>
		                <div class="col-md-4"  style="text-align:center">
		               <form method="post" action="paymentreports.jsp">
		                
			            <select class="mdb-select form-control" name="show">
			                <option value="0">Today</option>
			                <option value="1">Week</option>
			                <option value="2">Month</option>
			                <option value="3">Year</option>           
			            </select>
			           <br>
			           <button class="btn btn-primary" type="submit">Show</button>
			      		</form>
			      		</div>
			      		<div class="col-md-4"></div>
			      		</div>
			      		
                          <div class="table-responsive table--no-card m-b-40" align="center">                                 
                         <table class="table table-borderless table-striped table-earning">
                             <thead>
                                 <tr>
                                   <th> transaction id </th><th> name </th><th> email </th><th> mobile </th><th>package</th><th>amount </th><th>date Time</th>
                                   
                                 </tr>
                             </thead>
                             <tbody>
                         <%
                         String show="";
	        			   if(request.getParameter("show")!=null)
	        			   {
	        				show= (String)request.getParameter("show");
	        			   
	        			   String swhere="pdate>=DATE_SUB(NOW(), INTERVAL 48 HOUR)";
	        			   if(show.equals("0"))
	        			   {
	        				   swhere="pdate>=DATE_SUB(NOW(), INTERVAL 48 HOUR)";
	        			   }
	        			   else if(show.equals("1"))
	        			   {
	        				   swhere="pdate >=DATE_SUB(CURDATE(),INTERVAL 7 DAY)";
	        			   }
	        			   else if(show.equals("2"))
	        			   {
	        				   swhere="pdate >=DATE_SUB(CURDATE(),INTERVAL 1 MONTH)";
	        			   }
	        			   else if(show.equals("3"))
	        			   {
	        				   swhere="pdate >=DATE_SUB(CURDATE(),INTERVAL 12 MONTH);";
	        			   }
                         Connection con=null;
                		 Statement stmt=null;
                		 response.setContentType("text/html;charset=UTF-8");
                		// PrintWriter out = response.getWriter();

                		  try {
                			  DbHelper db=new DbHelper();
                    			 con=(Connection) DbHelper.getConnection();
                  		 	 stmt = (Statement) con.createStatement();  
                  		     ResultSet rs = stmt.executeQuery("select cfname,cmname,clname,pname,cemail,cphone,transactionid,pdate,amount from customer_details,package,payment,request,connection_details where customer_details.cid=connection_details.cid and connection_details.pid=package.pid and connection_details.rid=request.rid and request.orderid=payment.orderid and "+swhere+"");
                  		     while(rs.next())
                  		     {
                  		    	out.print("<td>");
                  		     	out.println(rs.getString("transactionid"));
                  		     	out.print("</td>");
                  		     	out.print("<td>");
                		     	out.println(rs.getString("cfname")+" "+rs.getString("cmname")+" "+rs.getString("clname"));
                		     	out.print("</td>");
                  		     	
                  		     	out.print("<td>");
                  		     	out.println(rs.getString("cemail"));
                  		     	out.print("</td>");
                  		     	out.print("<td>");
                  		     	out.println(rs.getString("cphone"));
                  		     	out.print("</td>");
                  		     	out.print("<td>");
                  		     	out.println(rs.getString("pname"));
                  		     	out.print("</td>");
                  		     	out.print("<td>");
                  		     	out.println(rs.getString("amount"));
                  		     	out.print("</td>");
                  		     	out.print("<td>");
                  		     	out.println(rs.getString("pdate"));
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
	            <!-- END MAIN CONTENT-->
	           
	      </div>
	        <!-- END PAGE CONTAINER-->
		</div>
		<jsp:include page="script.jsp" /> 
	</body>
</html>