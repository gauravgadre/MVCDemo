
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
                                    <h2 class="title-1" style="color:#000">Alloted Technician</h2>
                                </div>
                            </div>
                        </div>
                    	 <div class="row">
                            <div class="col-lg-12">
                                <div class="au-card recent-report">
                                    <div class="au-card-inner" >
                                     <div class="table-responsive table--no-card m-b-30">
                                             <table class="table table-borderless table-earning">
                        					<thead>
                        					<tr>
                        					<th scope='col'>FULLNAME</th><th scope='col'>EMAIL</th><th scope='col'>PHONE</th><th scope='col'>Technician's FULLNAME</th><th scope='col'>Technician's EMAIL</th><th scope='col'>Technician's PHONE</th><th>OPERATION</th>
                        					</tr>
                        					</thead>
	                                         <tbody>                  
	   <%
	   
	   		
	        				Connection conn = null;
	        				Statement stmt = null;
	        		  	 
	        		   try{
				        			  
	        			   //String address=request.getParameter("address");
				        			  String cid=request.getParameter("cid");
				        			
				        			   conn=(Connection)DbConn.createConnection(); 
	        		     			  stmt = (Statement) conn.createStatement();
	        		     			  
       String sql=("SELECT a.aid,c.cfname,c.cmname,c.clname,c.cphone,c.cemail,r.rid,t.tid,t.tfname,t.tmname,t.tlname,t.tphone,t.temail,a.allot_date from allot_technician a ,request r,technician t,customer_details c where a.rid=r.rid and t.tid=a.tid and r.status!=4 and r.cid=c.cid ");
								     

	        		   			      ResultSet rs = stmt.executeQuery(sql);
	        		     
	        		     			 while(rs.next())
	        		    		  {		    	 
			        		    	 // out.print("<tr><th scope='row'</th>");
								       out.print("<tr><td>");
//									   out.print("<td>");
			        		    	
			        		    	
  								      out.println(rs.getString("c.cfname")+" "+rs.getString("c.cmname")+" "+rs.getString("c.clname"));
			        		    	  out.print("</td>");
			        		    	  out.print("<td>");
			        		    	  out.println(rs.getString("c.cemail"));
			        		    	  out.print("</td>");
			        		    	  out.print("<td>");
			        		    	  out.println(rs.getString("c.cphone"));
			        		    	  out.print("</td>");
			        		    	  out.print("<td>");

			        		    	  out.println(rs.getString("t.tfname") +"   "+ rs.getString("t.tmname")+" "+rs.getString("t.tlname"));
			        		    	  out.print("</td>");
			        		    	  out.print("<td>");
			        		    	  out.println(rs.getString("t.temail"));
			        		    	  out.print("</td>");
			        		    	  out.print("<td>");
			        		    	  out.println(rs.getString("t.tphone"));
			        		    	  out.print("</td>");
				        		      out.print("<td>");
				        		      out.print("<a class='btn btn-black' href='sendMail?rid="+rs.getString("r.rid")+"'>send</a>");
 							         out.print("</td></tr>");
	            	  		 }
	        		      
	        		      rs.close();
	        		     
								}
	        		   catch(Exception se){
	        		      
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
                                         	DbConn db=new DbConn();
                                       	  conn=(Connection) db.createConnection(); 
	 stmt = (Statement) conn.createStatement();  
  ResultSet rs = stmt.executeQuery("select count(*) as record FROM allot_technician a ,request r,technician t,customer_details c where a.rid=r.rid and t.tid=a.tid and r.cid=c.cid");
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
	  <a class="btn btn-black" href="AllotTech.jsp?page=<%=i%>"><%=i%></a>
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
	                   
	            <!-- END MAIN CONTENT-->
	            <jsp:include page="footer.jsp"/> 
	        </div>
	        </div>
	                </div>
	            </div>
	        <!-- END PAGE CONTAINER-->
		</div>
		<jsp:include page="script.jsp"/>       
	</body>
</html>

