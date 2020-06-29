

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="emp.DbConn"%>
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
	
	if(session.getAttribute("uemail")==null)
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
                                    <h2 class="title-1" style="color:#000">Edit Employee</h2>
                                 
                                </div>
                            </div>
                        </div>
                    <div class="login-content">
                     <div class="row">
                       <div class="col-md-3"></div>
                       <div class="col-md-6">
        
               <%               
               response.setContentType("text/html");
               PrintWriter ouPrintWriter= response.getWriter();
               String tid =request.getParameter("tid");
               Connection con=null;
               Statement st=null;
               ResultSet rs = null;
                
               try {
               		con=DbConn.createConnection();
              	 	st = (Statement) con.createStatement();
                 	String sql = ("Select *  from technician where tid='"+tid+"'");
                 	 rs = st.executeQuery(sql);
                 while(rs.next())
                 {
                 %>
                 
               	 <form action="EditTechDb" method="post"  enctype="multipart/form-data">
               	 			<div class="form-group">
                    		<input class="au-input au-input--full" type="hidden" name="tid"  value="<%out.print(rs.getString(1));  %>" >
                            </div>
               	 
                                 <div class="form-group">
                                 <label>First name</label>
                                 <input class="au-input au-input--full" type="text" name="tfname"  value="<%out.print(rs.getString(2)); %>" required>
                                  </div>
                                <div class="form-group">
                                    <label>Middle name</label>
                                    <input class="au-input au-input--full" type="text" name="tmname" value="<%out.print(rs.getString(3)); %>" placeholder="Middle name" required>
                                 </div>
                                <div class="form-group">
                                    <label>Last name</label>
                                    <input class="au-input au-input--full" type="text" name="tlname" value="<%out.print(rs.getString(4)); %>" placeholder="Last name" required>
                                </div>
                                <div class="form-group">
                                    <label>user name</label>
                                    <input class="au-input au-input--full" type="text" name="uname" value="<%out.print(rs.getString(5)); %>"placeholder="user name" required>
                                </div>
                                 <div class="form-group">
                                    <label>Mobile no</label>
                                    <input class="au-input au-input--full" type="text" name="tphone" value="<%out.print(rs.getString(6)); %>" placeholder="mobile" required>
                                </div>
                                <div class="form-group">
                                    <label>Email</label>
                                    <input class="au-input au-input--full" type="text" name="temail" value="<%out.print(rs.getString(7)); %>" placeholder="Email" required>
                                </div>
                               <div class="form-group">
                                    <label>Password</label>
                                    <input class="au-input au-input--full" type="password" name="tpass" value="<%out.print(rs.getString(8)); %>" placeholder="password" required>
                                </div>
                                <div class="form-group">
                                    <label>Address</label>
                                    <input class="au-input au-input--full" type="text" name="ccity" value="<%out.print(rs.getString(9)); %>" placeholder="address" required>
                                </div>
                               
                                <div class="form-group">
                                    <label>DOB</label>
                                    <input class="au-input au-input--full" type="date" name="tdob" value="<%out.print(rs.getString(10)); %>" placeholder="date of birth" required>
                                </div>
                                <div class="form-group">
                                    <label>Gender</label>
                                   
                                    <div class="radio">
										  <label><input type="radio" name="tgender" value="male"  value="<% out.print(rs.getString(11)); %>">male</label>
										</div>
									<div class="radio">
										  <label><input type="radio" name="tgender" value="female" checked value="<% out.print(rs.getString(11)); %>">female</label>
									</div>
									</div>
                              <div class="form-group">
                                    <label>Image</label>
                                     <input class="au-input au-input--full" type="file" name="tidproof" height="20px" width="20px"value="<%=(rs.getString(12)) %>" >
                                    <img src= "images/<%=(rs.getString(12)) %>"/>
                                   
                                </div>
                                <div class="form-group">
                                    <label>Image</label>
                                    <input class="au-input au-input--full" type="file" name="taddrproof" height="20px" width="20px"value="<%=(rs.getString(13)) %>" >
                                   <img src= "images/<%=(rs.getString(13)) %>"/>
                                </div>
                                
                                <div class="form-group">
                                    <label>Image</label>
                                    <input class="au-input au-input--full" type="file" name="tpassport" height="20px" width="20px" value="<%=(rs.getString(14)) %>">
                                   <img src= "images/<%=(rs.getString(14)) %>"/>
                                </div>     
                                                       
                                <div class="login-checkbox">
                                </div>
                               <div>
                                <button class="au-btn au-btn--block au-btn--green m-b-20" value="submit" type="submit">UPDATE</button>
                                </div>
                                </form>
                                
	                     <%             
	    
                 } 
                
               }	

                   		catch(Exception cx)
               {
                   System.out.println(cx.toString());
               }
               
               
               %>  
             
                   		    </div>
                   		    <div class="col-md-3"></div>
                         </div>
                      </div>
                      <jsp:include page="footer.jsp" />
                    </div>
                  </div>
                  </div>
                  </div>
                  </div>
             <jsp:include page="script.jsp" />
               </body>
            </html>
                   
                   
                   
                   