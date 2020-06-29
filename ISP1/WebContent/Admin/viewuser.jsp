
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="Admin.DbHelper"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
                                    <h2 class="title-1">Manage User</h2>
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
                                                          
                                                          <th>Name</th>
                                                          
                                                          <th class="text-right">motherf</th>
                                                          
                                                          <th class="text-right">cemail</th>
                                                        <th class="text-right">gender</th>
                                                         <th class="text-right">password</th>
                                                          <th class="text-right">dob</th>
                                                          <th class="text-right">phone</th>
                                                           <th class="text-right">username</th>
                                                            <th class="text-right">cflat</th>
                                                             <th class="text-right">cbuilding</th>
                                                              <th class="text-right">street</th>
                                                               <th class="text-right">landmark</th>
                                                                <th class="text-right">city</th>
                                                                 <th class="text-right">taluka</th>
                                                                  <th class="text-right">district</th>
                                                                   <th class="text-right">state</th>
                                                                   <th class="text-right">country</th>
                                                                    <th class="text-right">pincode</th>
                                                                    <th class="text-right">passportproof</th>
                                                               <th class="text-right">idproof</th>
                                                                <th class="text-right">addressproof</th>
                                                               
                                                                
                                                                 
                                                      </tr>
                                                  </thead>
                                                  <tbody>
                                                 
                                                     <% 
                                                     Connection con=null;
                                                     Statement stmt=null;
                                                     response.setContentType("text/html;charset=UTF-8");
                                                     try {
                                            			 con=(Connection) DbHelper.getConnection(); 
             	 stmt = (Statement) con.createStatement();  
                 ResultSet rs = stmt.executeQuery("select * from customer_details LIMIT "+(pageid-1)+","+total);
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
                 	out.println(rs.getString(16));
                 	out.print("</td>");
                 	out.print("<td>");
                 	out.println(rs.getString(17));
                 	out.print("</td>");
                 	out.print("<td>");
                 	out.println(rs.getString(18));
                 	out.print("</td>");
                 	out.print("<td>");
                 	out.println(rs.getString(19));
                 	out.print("</td>");
                 	out.print("<td>");
                 	out.println(rs.getString(20));
                 	out.print("</td>");
                 	out.print("<td>");
                 	out.println(rs.getString(21));
                 	out.print("</td>");
                 	out.print("<td>");
                 	out.println(rs.getString(22));
                 	out.print("</td>");
                 	out.print("<td>");
                 	out.println(rs.getString(23));
                 	out.print("</td>");
                 	out.print("<td>");
                 	out.println(rs.getString(24));
                 	out.print("</td>");               
                 	out.print("</tr>");	
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
                                         	DbHelper db=new DbHelper();
                                       	  con=(Connection) db.getConnection(); 
	 stmt = (Statement) con.createStatement();  
  ResultSet rs = stmt.executeQuery("select count(*) as record from customer_details");
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
	  <a class="btn btn-black" href="viewuser.jsp?page=<%=i%>"><%=i%></a>
	  <%
	  i++;
  }  
                                         }catch(Exception e){
                                        	 System.out.println(e);
                                         }
                                         %>
                                         </center>
                                             
                                        
</div>
</div></div>
                 <jsp:include page="footer.jsp" /> 
                 </div>
                 </div>
             </div>
                 </div>
                 </div>
<jsp:include page="script.jsp" /> 
             </body>

             </html>
             
             <!-- end document-->
