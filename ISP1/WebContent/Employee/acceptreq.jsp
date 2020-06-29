<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="emp.DbConn" %>
<!DOCTYPE html>
<html>
	<head>
		<jsp:include page="link.jsp" />
	</head>
	<body class="animsition">
	
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
                                    <h2 class="title-1" style="color:#000;">Accepted Support Request</h2>
                                        
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
                                                        <th> Department </th><th> subject </th><th> smaintext </th><th>cid </th><th> senddate </th><th> replydate </th><th> reply </th>
                                                         </tr>
                                                         </thead>
                                                         <tbody>
                        <%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
                         <%
                             Connection connection=null;
Statement stmt=null;
response.setContentType("text/html;charset=UTF-8");
//PrintWriter out = response.getWriter();

   

try {
		 connection=(Connection) DbConn.createConnection();
	 stmt = (Statement) connection.createStatement();  
    ResultSet rs = stmt.executeQuery("select * from support_ticket where status='1' and sdept='Sales'");
    while(rs.next())
    {
    	
    	out.print("<tr><td>");
    	out.println(rs.getString("sdept"));
    	out.print("</td>");
    	
    	out.print("<td>");
    	out.println(rs.getString("subject"));
    	out.print("</td>");
    	out.print("<td>");
    	out.println(rs.getString("smaintext"));
    	out.print("</td>");
    	out.print("<td>");
    	out.println(rs.getString("cid"));
    	out.print("</td>");
    	out.print("<td>");
    	out.println(rs.getString("senddate"));
    	out.print("</td>");
    	out.print("<td>");
    	out.println(rs.getString("replydate"));
    	out.print("</td>");
    	out.print("<td>");
    	out.println(rs.getString("reply"));
    	out.print("</td>");
    	
    	out.print("</tr>");
    	
   //	request.getRequestDispatcher("sideNav.jsp").include(request, response);
    	
    }
    rs.close();
}
catch (Exception e)
{
	e.printStackTrace();
    	
    	
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
                                       	  connection=(Connection) db.createConnection(); 
	 stmt = (Statement) connection.createStatement();  
  ResultSet rs = stmt.executeQuery("select count(*) as record FROM support_ticket where status='1' and sdept='Sales'");
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
	  <a class="btn btn-black" href="acceptreq.jsp?page=<%=i%>"><%=i%></a>
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
	           
	        </div>
	        <!-- END PAGE CONTAINER-->
		</div>
		<jsp:include page="script.jsp" /> 
	</body>
</html>