<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Technician.*"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>

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
					String spageid="1";
					if(request.getParameter("page")!=null)
					spageid=request.getParameter("page");
					int pageid=Integer.parseInt(spageid);
					int total=5;
					if(pageid==1){}
					else{
						pageid=pageid-1;
						pageid=pageid*total+1;
					}
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
                                    <h2 class="title-1">Todays Request</h2>
                                </div>
                            </div>
                        </div>
                    	 <div class="row">
                            <div class="col-lg-12">
                                <div class="au-card recent-report">
                                    <div class="au-card-inner" >
                                     <div class="table-responsive table--no-card m-b-30">
                                             <table class="table table-borderless table-striped table-earning">
                                                     <thead>
                                                         <tr>
                                                             <th>CUSTOMER NAME</th>
	              	     <th scope='col'>EMAIL</th>
	              	     <th scope='col'>C_PHONE</th>
	              	     <th scope='col'>C_CITY</th>
	              	     <th>OPERATION</th>
                                                         </tr>
                                                     </thead>
                                                     <tbody>
						<%
						String email=(String)session.getAttribute("temail");	
        			 	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
       				 LocalDateTime today = LocalDateTime.now();
       				 String current= formatter.format(today);
       				
       				String startcurrent=current+" 00:00:00";
       				String endcurrent=current+" 23:59:59";
						 try{
	        			 	
      						  String sql="SELECT c.cid,c.cfname,c.cmname,c.clname,c.cemail,c.cphone,c.ccity from allot_technician a,customer_details c,request r,technician t where a.rid=r.rid and r.cid=c.cid and t.tid=a.tid and t.temail='"+email+"' and a.set_connection_date >= '"+current+"' and a.set_connection_date <= '"+endcurrent+"' and r.rstatus!=4";
      						  ResultSet rs = TechDao.get(sql);	        		     
	        		      while(rs.next())
	        		      {		   
	        		    	  %>
			        	<tr>
	              	     <th><%=rs.getString("cfname")+" "+rs.getString("cmname")+" "+rs.getString("clname") %></th>
	              	     <th scope='col'><%=rs.getString("cemail") %></th>
	              	     <th scope='col'><%=rs.getString("cphone") %></th>
	              	     <th scope='col'><%=rs.getString("ccity") %></th>
	              	     <th><a href='getDetails.jsp?cid=<%=rs.getString("cid") %>'>Get Detatils</a></th>
	              	     </tr>
			        	<%	            	  		
	        		      }	        		    
	        		      rs.close();
	        		    
	        		     }
	        		   catch(Exception se)
	        		  {	        		      
	        		      se.printStackTrace();
	        		   }
	 %> 
                                               </tbody>
                                                 </table>
                                            </div>
                                       </div>
                                       <center> 
                                         <%
                                         try {
     String sql=   "select count(*) as record from allot_technician a,customer_details c,request r,technician t where a.rid=r.rid and r.cid=c.cid and t.tid=a.tid and t.temail='"+email+"' and a.set_connection_date >= '"+current+"' and a.set_connection_date <= '"+endcurrent+"' and r.rstatus!=4 ";                                 	 
	 ResultSet rs = TechDao.get(sql);
  int record=total,i=1,div;
  if(rs.next())
  {
	  record=rs.getInt("record");
	  div=record%total;
	  record=record/total;
	  if(div!=0){
		  record+=1;
	  }	  
  }
  while(i<=record){
	  %>
	  <a class="btn btn-black" href="todays_request.jsp?page=<%=i%>"><%=i%></a>
	  <%
	  i++;
  }  
                                         }catch(Exception e){
                                        	 System.out.println(e);
                                         }
                                         %>
                                         </center>
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

