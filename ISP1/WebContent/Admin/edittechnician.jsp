
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
                                    <h2 class="title-1">Edit Technician</h2>
                                 
                                </div>
                            </div>
                        </div>
                    <div class="login-content">
                     <div class="row">
                       <div class="col-md-3"></div>
                       <div class="col-md-6">
                    <center>
                    <h4><%if(null!=request.getAttribute("errormsg")){
                    	 out.println ( request.getAttribute("errormsg"));
                    	  
                       } %></h4>
                       </center>
                        <div class="login-form">
                        
                       <%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
                         <%
                         response.setContentType("text/html;charset=UTF-8");
                 		//PrintWriter out = response.getWriter();
                 		String tid=request.getParameter("tid");
                 		Connection connection=null;
                 		Statement stmt=null;
                 			try {
                 				DbHelper db=new DbHelper();
                            	  connection=(Connection) db.getConnection(); 
                 			
                 			 stmt = (Statement) connection.createStatement();  
                 		    ResultSet rs = stmt.executeQuery("select * from technician where tid='"+tid+"'");
                 		    while(rs.next())
                 		    {
                 		    	%>
                            <form action="technicianupdate"  method="post" enctype="multipart/form-data">
                            <div class="form-group">
                                   
                                    <input class="au-input au-input--full" type="hidden" name="tid" value="<% out.print(rs.getString(1)); %>"  required>
                                </div>
                             <div class="form-group">
                                    <label>First name</label>
                                    <input class="au-input au-input--full" type="text" name="tfname" value="<% out.print(rs.getString(2)); %>" pattern="[A-Za-z,\s]{3,30}" title="only characters are alloweed" required>
                                </div>
                                <div class="form-group">
                                    <label>Middle name</label>
                                    <input class="au-input au-input--full" type="text" name="tmname" value="<% out.print(rs.getString(3)); %>" pattern="[A-Za-z,\s]{3,30}" title="only characters are alloweed" required>
                                </div>
                                <div class="form-group">
                                    <label>Last name</label>
                                    <input class="au-input au-input--full" type="text" name="tlname" value="<% out.print(rs.getString(4)); %>" pattern="[A-Za-z,\s]{3,30}" title="only characters are alloweed" required>
                                </div>
                                <div class="form-group">
                                    <label>user name</label>
                                    <input class="au-input au-input--full" type="text" name="uname" value="<% out.print(rs.getString(5)); %>" pattern="[A-Za-z,\s]{3,30}" title="only characters are alloweed" required>
                                </div>
                                <div class="form-group">
                                    <label>Email</label>
                                    <input class="au-input au-input--full" type="email" name="temail" value="<% out.print(rs.getString(7)); %>" pattern="/^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-z]{2,4}+$/" title="email contains @" required>
                                </div>
                                  <div class="form-group">
                                    <label>password</label>
                                    <input class="au-input au-input--full" type="tpass" name="tpass" value="<% out.print(rs.getString(8)); %>" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,12}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"  required>
                                </div>
                              
                                <div class="form-group">
                                    <label>Address</label>
                                    <input class="au-input au-input--full" type="text" name="ccity" value="<% out.print(rs.getString(9)); %>" required>
                                </div>
                                <div class="form-group">
                                    <label>Mobile no</label>
                                    <input class="au-input au-input--full" type="number" name="tphone" value="<% out.print(rs.getString(6)); %>" pattern="[7-9]{1}[0-9]{9}" 
     									  title="Phone number with 7-9 and remaing 9 digit with 0-9" required>
                                </div>
                                <div class="form-group">
                                    <label>DOB</label>
                                    <input class="au-input au-input--full" type="date" name="tdob" value="<% out.print(rs.getString(10)); %>"required>
                                </div>
                                <div class="form-group">
                                    <label>Gender</label>
                                   
                                 <div class="radio">
										  <label><input type="radio" name="gender" value="male" value="<% out.print(rs.getString(11)); %>">male</label>
										</div>
										<div class="radio">
										  <label><input type="radio" name="gender" value="female" checked value="<% out.print(rs.getString(11)); %>">female</label>
										</div>
										 </div>
                                <div class="form-group">
                                    <label> Id proof</label>
                                    <input class="au-input au-input--full" type="file" name="ImageFile" height="20px",width="20px"value="<%=(rs.getString(12)) %>" >
                                   <img src= "../images/Technician/<%=rs.getString(12) %>"/>
                                </div>
                                <div class="form-group">
                                    <label>Address proof</label>
                                    <input class="au-input au-input--full" type="file" name="ImageFile1" height="20px",width="20px"value="<%=(rs.getString(13)) %>" >
                                   <img src= "../images/Technician/<%=rs.getString(13) %>"/>
                                </div>
                                <div class="form-group">
                                    <label>passport</label>
                                    <input class="au-input au-input--full" type="file" name="ImageFile2" height="20px",width="20px"value="<%=(rs.getString(14)) %>" >
                                   <img src= "../images/Technician/<%=rs.getString(14) %>"/>
                                </div>
                                <div class="login-checkbox">
                                   
                                   
                                </div>
                                <button class="au-btn au-btn--block au-btn--green m-b-20" type="submit">Update</button>
                               
                           </form>
                        </div>
	                      <%
                 	}
                 			}
                 catch(Exception e)
                 			{
                 				System.out.print(e.toString());
                 			}
                 	
                 			
	
	 %>                   </div></div>  </div>     
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