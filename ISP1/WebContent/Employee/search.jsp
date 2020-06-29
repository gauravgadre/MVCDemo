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
                                    <h2 class="title-1">Search Technician</h2>
                                 </div>
                            </div>
                        </div>
                    	 <div class="row">
                            <div class="col-lg-12">
                                <div class="au-card recent-report">
                                    <div class="au-card-inner" >
                                    <%
                         	       Connection con = null;
                         	        Statement stmt = null;
                         	        String sql="";
                         	        	 String ccity=request.getParameter("ccity");
                         	               String rid=request.getParameter("rid");

                         	        		   try{
                         	        			   con=(Connection)DbConn.createConnection(); 
                         	        		     stmt = (Statement) con.createStatement();
                         	        		     ResultSet rs1=stmt.executeQuery("SELECT *  FROM technician where taddress='"+ccity+"'");
                         	        		     if(rs1.next()){
                         	        		    	 sql="SELECT *  FROM technician where taddress='"+ccity+"'";
                         	        		     }else{
                         	        		    	 sql="SELECT *  FROM technician";
                         	        		    	 %>
                         	        		    	 <h5>There is no technician from same city you can select one from below.</h5>
                         	        		    	 <%
                         	        		     }
                                    %>
                                     <div class="table-responsive table--no-card m-b-30">
                                             <table class="table table-borderless table-earning">
                        					<thead>
                        					<tr> 
                        					<th scope='col'>NAME</th><th scope='col'>EMAIL</th><th scope='col'>PHONE</th><th scope='col'>GENDER</th><th scope='col'>ADDRESS</th><th scope='col'>STATUS</th><th scope='col'>ACTION</th>
                        					</tr>
                        					</thead>
                        					<tbody>                                                              
	   <%
	        		       ResultSet rs = stmt.executeQuery(sql);
	        		     	
	        		      while(rs.next())
	        		      {
	        		    	 
	        		    	  out.print("<tr><td>");
	        		    	  out.println(rs.getString("tfname")+" "+rs.getString("tmname")+" "+rs.getString("tlname"));
	        		    	  out.print("</td>");
	        		    	  out.print("<td>");
	        		    	  out.println(rs.getString("temail"));
	        		    	  out.print("</td>");
	        		    	  out.print("<td>");
	        		    	  out.println(rs.getString("tphone"));
	        		    	  out.print("</td>");
	        		    	  out.print("<td>");
	        		    	  out.println(rs.getString("tgender"));
	        		    	  out.print("</td>");
	        		    	  out.print("<td>");
	        		    	  out.println(rs.getString("taddress"));
	        		    	  out.print("</td>");
	        		    	  out.print("<td>");
	        		    	  out.println(rs.getString("tstatus"));
	        		    	  out.print("</td>");
	        		    	  out.print("<td>");
	        		    	  out.print("<a class='btn btn-black' href='AllotTechServlet?rid="+rid+"&tid="+rs.getString(1)+"'>Allot</a>");
	        		    	  	        		    	  
	        		    	  out.print("</td></tr>");
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
	               	 </div>
	               </div> 
	            </div> 
	    
	     

	            <!-- END MAIN CONTENT-->
	          <jsp:include page="footer.jsp"/> 
	        </div>
	        </div> </div></div>
	        <!-- END PAGE CONTAINER-->
		</div>
		<jsp:include page="script.jsp"/> 
	</body>
</html>
