 
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="emp.DbConn" %>
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
                                    <h2 class="title-1" style="color:#000;">Manage Technician</h2>
                                    <a class="au-btn au-btn-icon au-btn--blue" href="manage_technician.jsp">Add Technician</a>
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
                        					<th scope='col'>Name</th><th scope='col'>UNAME</th><th scope='col'>PHONE</th><th scope='col'>EMAIL</th><th scope='col'>PASSWORD</th><th scope='col'>ADDRESS</th><th scope='col'>DOB</th><th scope='col'>GENDER</th><th scope='col'>ID_PROOF</th><th scope='col'>ADDRESS_PROOF</th><th scope='col'>PASSPORT</th><th scope='col'>JOINING DATE</th><th scope='col'>OPERATION</th><th scope='col'>OPERATION</th>
                        					</tr>
                        					</thead>
                        					<tbody>
	                                                           
	   <%
	   
	   		
					        Connection conn = null;
					        Statement stmt = null;
	        		   try{
	        			   conn=(Connection) DbConn.createConnection(); 
	        		     stmt = (Statement) conn.createStatement();
	        		      String sql = ("SELECT * FROM technician");
	        		      ResultSet rs = stmt.executeQuery(sql);
	        		      
	        		      while(rs.next())
	        		      {
	        		    	  out.print("<tr><td>");
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
	        		    	  out.print("<td>");
	        		    	  out.println(rs.getString(9));
	        		    	  out.print("</td>");
	        		    	  out.print("<td>");
	        		    	  out.println(rs.getString(10));
	        		    	  out.print("</td>");
	        		    	  out.print("<td>");
	        		    	  out.println(rs.getString(11));
	        		    	  out.print("</td>");
	        		    	  out.print("<td>");
	        		    	  out.println(rs.getString(12));
	        		    	  out.print("</td>");
	        		    	  out.print("<td>");
	        		    	  out.println(rs.getString(13));
	        		    	  out.print("</td>");
	        		    	  out.print("<td>");
	        		    	  out.println(rs.getString(14));
	        		    	  out.print("</td>");
	        		    	  
	        		    	  out.print("<td>");
	        		    	  out.println(rs.getString(15));
	        		    	  out.print("</td>");
	        		    	  out.print("<td>");
	        		    	  out.print("<a class='btn btn-black' href='EditTech.jsp?tid="+rs.getString("tid")+"'>Edit</a>");
	        		    		out.print("</td>");
	        		    		out.print("<td>");
	        		    		 out.print("<a class='btn btn-black' href='DeleteTech?tid="+rs.getString(1)+"'>Delete</a>");          	
	        		    		  out.print("</td>");
	        		    	    	out.print("</tr>");	        		    	    	
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
  ResultSet rs = stmt.executeQuery("select count(*) as record FROM technician");
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
	  <a class="btn btn-black" href="view.jsp?page=<%=i%>"><%=i%></a>
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
