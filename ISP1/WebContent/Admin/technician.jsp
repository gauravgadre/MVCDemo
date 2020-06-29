<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
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
                                    <h2 class="title-1">Manage Technician</h2>     
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
                                                           
                                                           <th> Name </th><th> Username </th><th> Phone </th><th>email</th><th>password</th><th>city</th><th>dob</th><th>gender</th><th>idproof</th>
                                                        <th>addproof</th><th>passproof</th><th>Action</th><th>Action</th>
                                                         </tr>
                                                     </thead>
                                                     <tbody>
             <%
             Connection con=null;
             Statement stmt=null;
             try{
               
           	DbHelper db=new DbHelper();
         	  con=(Connection) db.getConnection(); 
         	 stmt = (Statement) con.createStatement(); 
         	ResultSet rs = stmt.executeQuery("select * from technician LIMIT "+(pageid-1)+","+total);
         	  while(rs.next())
		      {
		    	  out.print("<tr><th>");
		    	  out.println(rs.getString(2)+" "+rs.getString(3)+" "+rs.getString(4));
		    	  out.print("</th>");
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
		    	  out.print("<a class='btn btn-black' href='edittechnician.jsp?tid="+rs.getString(1)+"'>EDIT</a>");	        		    	 
		    	  out.print("</td>");
		    	  out.print("<td>");
		    	  out.print("<a class='btn btn-black' href='deletetechnician?tid="+rs.getString(1)+"'>DELETE</a>");
    	  		  out.print("</td></tr>");
    	  		 }
		    
		      rs.close();
		    
		      }catch(Exception se){
		      //Handle errors for JDBC
		      se.printStackTrace();
		   }
		  out.print("</table>");
		  
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
  ResultSet rs = stmt.executeQuery("select count(*) as record from technician");
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
	  <a class="btn btn-black" href="technician.jsp?page=<%=i%>"><%=i%></a>
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
