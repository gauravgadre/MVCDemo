<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Technician.*"%>

<!DOCTYPE html>
<html lang="en">

<head>
      <jsp:include page="head.jsp" /> 

    
</head>
<% 
					response.setHeader("Cache-Control","no-cache");
					response.setHeader("Cache-Control","no-store");
					
					if(session.getAttribute("temail")==null)
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
                                    <h2 class="title-1">Report</h2>
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
		               <form method="post" action="report.jsp">
		                
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
                                                           <th>CUSTOMER NAME</th>
	              	     <th scope='col'>EMAIL</th>
	              	     <th scope='col'>C_PHONE</th>
	              	     <th scope='col'>C_CITY</th>
	              	     <th>Date of Connection</th>
                                                         </tr>
                                                     </thead>
                                                     <tbody>
                                                      <%
	        		   try{
	        			   
	        			   String show="";
	        			   if(request.getParameter("show")!=null)
	        			   {
	        				show= (String)request.getParameter("show");
	        			   
	        			   String swhere="";
	        			   if(show.equals("0"))
	        			   {
	        				   swhere="a.get_connection_date>=DATE_SUB(NOW(), INTERVAL 48 HOUR)";
	        			   }
	        			   else if(show.equals("1"))
	        			   {
	        				   swhere="a.get_connection_date >=DATE_SUB(CURDATE(),INTERVAL 7 DAY)";
	        			   }
	        			   else if(show.equals("2"))
	        			   {
	        				   swhere="a.get_connection_date >=DATE_SUB(CURDATE(),INTERVAL 1 MONTH)";
	        			   }
	        			   else if(show.equals("3"))
	        			   {
	        				   swhere="a.get_connection_date >=DATE_SUB(CURDATE(),INTERVAL 12 MONTH);";
	        			   }
	        			   
	        		
	        			 	String email=(String)session.getAttribute("temail");	        		   
      						  String sql="SELECT c.cid,c.cfname,c.cmname,c.clname,c.cemail,c.cphone,c.ccity,a.get_connection_date from allot_technician a,customer_details c,request r,technician t where a.rid=r.rid and r.cid=c.cid and t.tid=a.tid and "+swhere+" ";					   
      		   			 
      						  ResultSet rs = TechDao.get(sql);	        		     
	        		      while(rs.next())
	        		      {		   
	        		    	  %>
			        	<tr>
	              	     <td><%=rs.getString("cfname")+" "+rs.getString("cmname")+" "+rs.getString("clname") %></td>
	              	     <td scope='col'><%=rs.getString("cemail") %></td>
	              	     <td scope='col'><%=rs.getString("cphone") %></td>
	              	     <td scope='col'><%=rs.getString("ccity") %></td>
	              	     <td scope='col'><%=rs.getString("a.get_connection_date") %></td>
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

<jsp:include page="script.jsp" />

</body>

</html>
<!-- end document-->

