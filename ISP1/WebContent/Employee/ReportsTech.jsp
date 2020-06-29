<%@page import="emp.DbConn"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html>
	<head>
<jsp:include page="link.jsp" />
</head>
	
	
	<% 
					response.setHeader("Cache-Control","no-cache");
					response.setHeader("Cache-Control","no-store");
					
					if(session.getAttribute("uemail")==null)
					response.sendRedirect("../login.jsp");
	%>
<body class="animsition">
 <div class="page-wrapper">     
		<jsp:include page="headerMobile.jsp" /> 
      
 		<jsp:include page="sideNav.jsp" /> 
        <!-- PAGE CONTAINER-->
        <div class="page-container">
          
			<jsp:include page="topNav.jsp" /> 
            <!-- MAIN CONTENT-->
            
            <div class="main-content">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="overview-wrap">
                                    <h2 class="title-1" style="color:#000;">Report</h2>
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
		               <form method="post" action="ReportsTech.jsp">
		                
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
                                             <table class="table table-borderless table-striped table-earning">
                                                     <thead>
                                                         <tr>
                                                           <th>TECHNICIAN NAME</th>
	              	    									 <th scope='col'>EMAIL</th>
	        									      	     <th scope='col'>PHONE</th>
	              	    									 <th scope='col'>CITY</th>
	              	    									 <th scope='col'>JOIN DATE</th>
	              	    									 
	              	   										  
                                                         </tr>
                                                     </thead>
                                                     
                                                     <tbody>
                   <%
                   Connection conn = null;
                   Statement stmt = null;
            	   conn=(Connection)DbConn.createConnection(); 
	        		   try{
	        			   
	        			   String show="";
	        			   if(request.getParameter("show")!=null)
	        			   {
	        				show= (String)request.getParameter("show");
	        			   
	        			   String swhere="tjdate>=DATE_SUB(NOW(), INTERVAL 24 HOUR)";
	        			   if(show.equals("0"))
	        			   {
	        				   swhere="tjdate>=DATE_SUB(NOW(), INTERVAL 24 HOUR)";
	        			   }
	        			   else if(show.equals("1"))
	        			   {
	        				   swhere="tjdate>=DATE_SUB(CURDATE(),INTERVAL 7 DAY)";
	        			   }
	        			   else if(show.equals("2"))
	        			   {
	        				   swhere="tjdate >=DATE_SUB(CURDATE(),INTERVAL 1 MONTH)";
	        			   }
	        			   else if(show.equals("3"))
	        			   {
	        				   swhere="tjdate >=DATE_SUB(CURDATE(),INTERVAL 12 MONTH);";
	        			   }
	        			  
	 							stmt = (Statement) conn.createStatement();
								String sql = ("SELECT * from technician where "+swhere+" ");
							    ResultSet rs = stmt.executeQuery(sql);
	        			     

	        while(rs.next())
	        		      {		   
	        		    	  %>
			        			<tr>
	              	     <th><%=rs.getString("tfname")+" "+rs.getString("tmname")+" "+rs.getString("tlname") %></th>
	              	     <th scope='col'><%=rs.getString("temail") %></th>
	              	     <th scope='col'><%=rs.getString("tphone") %></th>
	              	     <th scope='col'><%=rs.getString("taddress") %></th>
	              	     <th scope='col'><%=rs.getString("tjdate") %></th>
	              	     </tr>
			        	<%	            	  		
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
            <!-- END PAGE CONTAINER-->
        </div>

    </div>

<jsp:include page="script.jsp"/> 

</body>

</html>
<!-- end document-->

	            