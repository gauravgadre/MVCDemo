
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
	
	
	<% //String sql =(" SELECT tname,fname,t.address,c.address,t.email,c.email FROM request r,technician t,customer c where t.tid=r.tid and r.cid=c.cid  ");

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
                                    <h2 class="title-1" style="color:#000;">Accepted Request</h2>
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
                        					<th scope='col'>C_FULL NAME</th><th scope='col'>SERVICE NAME</th><th scope='col'>PRODUCT NAME</th><th scope='col'>PACKAGE NAME</th><th scope='col'>REQUEST DATE</th><th scope='col'>REQUEST ID</th><th scope='col'>PHONE</th><th scope='col'>CITY</th><th scope='col'>ACCEPT</th>
                        					</tr>
                        					</thead>
                        					<tbody>                                                    
	   <%
	   
	   Connection conn = null;
       Statement stmt = null;
  
  try{
	   conn=(Connection)DbConn.createConnection(); 
    stmt = (Statement) conn.createStatement();
     String sql = "SELECT c.cid, c.ccity,c.cfname,c.clname,c.cphone,c.cmname,s.sname,pr.prodname,p.pname,r.rdate,r.rid FROM customer_details c,request r,package p,product pr,service s where c.cid=r.cid and pr.prodid=r.prodid and s.sid=r.serid and p.pid=r.pid and r.rstatus=1";
     ResultSet rs = stmt.executeQuery(sql);
     
     while(rs.next())
     {
					   	  out.print("<tr><th scope='row'</th>");
					   	  out.println(rs.getString("cfname")+" "+rs.getString("cmname")+" "+rs.getString("clname"));
					   	  out.print("</th>");
					   	  out.print("<td>");
					   	  out.println(rs.getString("s.sname"));
					   	  out.print("</td>");
					   	  out.print("<td>");
					   	  out.println(rs.getString("pr.prodname"));
					   	  out.print("</td>");
					   	  out.print("<td>");
					   	  out.println(rs.getString("p.pname"));
					   	  out.print("</td>");
					   	  out.print("<td>");
					   	  out.println(rs.getString("r.rdate"));
					   	  out.print("</td>");
					   	  out.print("<td>");
					   	  out.println(rs.getString("r.rid"));
					   	  out.print("</td>");
					   	  out.print("<td>");
					   	  out.println(rs.getString("c.cphone"));
					   	  out.print("</td>");
					   	 out.print("<td>");
					   	  out.println(rs.getString("c.ccity"));
					   	  out.print("</td>");
					   	 out.print("<td>");
					   	 %>
                         <%out.print("<a class='btn btn-outline-success waves-effect' href='search.jsp?rid="+rs.getString("r.rid")+"&ccity="+rs.getString("c.ccity")+"'>Search City</a>");	%> 
                         <% 	        		    	 
					      out.print("</td>");
					    
	            	  		
	        		     }
	        		      rs.close();
	        		    
	        		      }catch(Exception se){
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
  ResultSet rs = stmt.executeQuery("select count(*) as record FROM customer_details c,request r,package p,product pr,service s where c.cid=r.cid and pr.prodid=r.prodid and s.sid=r.serid and p.pid=r.pid and r.rstatus=1");
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
	  <a class="btn btn-black" href="NewRequest.jsp?page=<%=i%>"><%=i%></a>
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
