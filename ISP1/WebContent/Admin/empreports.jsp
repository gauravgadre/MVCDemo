<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
 <%@ page import="java.sql.SQLException"%>
  <%@ page import=" java.io.PrintWriter"%>
  <%@ page import=" java.sql.Connection"%>
  <%@ page import=" java.sql.DriverManager"%>
  <%@ page import=" java.sql.PreparedStatement"%> 
 <%@ page import=" java.sql.ResultSet"%>
  <%@ page import=" java.sql.Statement"%>
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
                                    <h2 class="title-1">Employee Report</h2>
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
		               <form method="post" action="empreports.jsp">
		                
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
                                                          <th> Name </th><th> mobile </th><th>email </th><th>address</th><th>jdate</th>
                                                          </tr>
                                                     </thead>  
                                                     <tbody>   
<%
try{
	        			   
	        			   String show="";
	        			   if(request.getParameter("show")!=null)
	        			   {
	        				show= (String)request.getParameter("show");
	        			   
	        			   String swhere="jdate>=DATE_SUB(NOW(), INTERVAL 48 HOUR)";
	        			   if(show.equals("0"))
	        			   {
	        				   swhere="jdate>=DATE_SUB(NOW(), INTERVAL 48 HOUR)";
	        			   }
	        			   else if(show.equals("1"))
	        			   {
	        				   swhere="jdate >=DATE_SUB(CURDATE(),INTERVAL 7 DAY)";
	        			   }
	        			   else if(show.equals("2"))
	        			   {
	        				   swhere="jdate >=DATE_SUB(CURDATE(),INTERVAL 1 MONTH)";
	        			   }
	        			   else if(show.equals("3"))
	        			   {
	        				   swhere="jdate >=DATE_SUB(CURDATE(),INTERVAL 12 MONTH);";
	        			   }
	        			          		   
      					String sql="SELECT * from emp where "+swhere+" ";
      					Connection con=DbHelper.getConnection();
      					Statement stmt= con.createStatement();
      					ResultSet rs=stmt.executeQuery(sql);
      					while(rs.next())
    {
    	out.print("<td>");
    	out.println(rs.getString(2)+" "+rs.getString(3)+" "+rs.getString(4));
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
    	}	        		    
	      rs.close();
		   }
	   }
		   catch(Exception e){
			   e.printStackTrace();
		   }
	        %>
                  
           </tbody>
	     
	              </table>          
	           </div></div>             



              
     
                           
                                 
	            <!-- END MAIN CONTENT-->
	           
	      </div></div></div>
	      <jsp:include page="footer.jsp" /> 
	      </div></div>
	    </div>
	    </div>
	        <!-- END PAGE CONTAINER-->
		</div>
		<jsp:include page="script.jsp" /> 
	</body>
</html>