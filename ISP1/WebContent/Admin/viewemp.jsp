
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
                                    <h2 class="title-1">Manage Employee</h2>
                                    
                                     <a class="au-btn au-btn-icon au-btn--blue" href="empreg.jsp">Add Employee</a>   
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
                                                             
                                                             <th class="text-right">Email</th>
                                                             
                                                             <th class="text-right">Mobile</th>
                                                              <th class="text-right">DOB</th>
                                                               <th class="text-right">Gender</th>
                                                                <th class="text-right">Image</th>
                                                                 <th class="text-right">UserName</th>
                                                                 <th class="text-right">Address</th>
                                                                  <th class="text-right">Idproof</th>
                                                                   <th class="text-right">Addressproof</th>
                                                                    <th class="text-right">Joiningdate</th>
                                                                   <th class="text-right">Action</th>
                                                                   <th class="text-right">Action</th>
                                                                    <th class="text-right">Action</th>
                                                                    <th class="text-right">Action</th>
                                                         </tr>
                                                     </thead>
                                                     <tbody>
                                                    
                                                        <% 
                                                        Connection connection=null;
                                                        Statement stmt=null;
                                                        response.setContentType("text/html;charset=UTF-8");
                                                        try {
                                                        	DbHelper db=new DbHelper();
                                                      	  connection=(Connection) db.getConnection(); 
             	 stmt = (Statement) connection.createStatement();  
                 ResultSet rs = stmt.executeQuery("select * from emp LIMIT "+(pageid-1)+","+total);
                 while(rs.next())
                 {
                 	
                 	out.print("<tr><td>");
                 	
                 
                 	out.println(rs.getString(2)+" "+rs.getString(3)+" "+rs.getString(4));
                 	out.print("</td>");
                 	
                 	out.print("<td>");
                 	out.println(rs.getString(5));
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
  %>               
<a class="btn btn-black" href="editemp.jsp?eid=<%=rs.getString("eid") %>">Edit</a>
<%
             	out.print("</td>");
             	out.print("<td>");
                 out.print("<a class='btn btn-black' href='deleteDb?eid="+rs.getString(1)+"'><i class='glyphicon glyphicon-trash'>  Delete</i></a>");                	
                out.print("</td>");
                out.print("<td>");
                out.print("<a class='btn btn-black' href='emailsend?eid="+rs.getString(1)+"'><span class='glyphicon glyphicon-envelope'>  send mail</span></a>");                	
               out.print("</td>");
               out.print("<td>");
               out.print("<a class='btn btn-black' href='smssend.jsp?eid="+rs.getString(1)+"'><span class='glyphicon glyphicon-envelope'>  send sms</span></a>");                	
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
                                         	DbHelper db=new DbHelper();
                                       	  connection=(Connection) db.getConnection(); 
	 stmt = (Statement) connection.createStatement();  
  ResultSet rs = stmt.executeQuery("select count(*) as record from emp");
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
	  <a class="btn btn-black" href="viewemp.jsp?page=<%=i%>"><%=i%></a>
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
                 </div> </div>
                 </div>
                 </div>
                 </div>
<jsp:include page="script.jsp" /> 

             </body>

             </html>
             
             <!-- end document-->
