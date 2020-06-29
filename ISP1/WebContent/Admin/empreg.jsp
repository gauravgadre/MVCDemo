
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
                                    <h2 class="title-1">Add Employee</h2>
                                 
                                </div>
                            </div>
                        </div>
                    <div class="login-content">
                     <div class="row">
                       <div class="col-md-3"></div>
                       <div class="col-md-6">
                    <center>
                        <div class="login-form">
                        <h4><%if(null!=request.getAttribute("errormsg")){
                    	 out.println ( request.getAttribute("errormsg"));
                    	  
                       } %></h4>
                       
                       </center>
                            <form action="employeedb"  method="post" enctype="multipart/form-data"  >
                             <div class="form-group">
                                    <label>First name</label>
                                    <input class="au-input au-input--full" type="text" name="ename" placeholder="employee name" pattern="[A-Za-z,\s]{3,30}" title="only characters are alloweed" required>
                                </div>
                                <div class="form-group">
                                    <label>Middle name</label>
                                    <input class="au-input au-input--full" type="text" name="mname" placeholder="Middle name" pattern="[A-Za-z,\s]{3,30}" title="only characters are allowed" required >
                                </div>
                                <div class="form-group">
                                    <label>Last name</label>
                                    <input class="au-input au-input--full" type="text" name="lname" placeholder="Last name" pattern="[A-Za-z,\s]{3,30}" title="only characters are allowed" required>
                                </div>
                                <div class="form-group">
                                    <label>user name</label>
                                    <input class="au-input au-input--full" type="text" name="uname" placeholder="user name" pattern="[A-Za-z,\s]{3,30}" title="only characters are allowed" required>
                                </div>
                                <div class="form-group">
                                    <label>Email</label>
                                    <input class="au-input au-input--full" type="email" name="email" placeholder="Email" pattern="/^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-z]{2,4}+$/" title="email contains @" required>
                                </div>
                               <div class="form-group">
                                    <label>Password</label>
                                    <input class="au-input au-input--full" type="password" name="password" placeholder="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required>
                                </div>
                                <div class="form-group">
                                    <label>Address</label>
                                    <input class="au-input au-input--full" type="text" name="address" placeholder="address" required>
                                </div>
                                <div class="form-group">
                                    <label>Mobile no</label>
                                    <input class="au-input au-input--full" type="text" name="mobile" placeholder="mobile"  pattern="[7-9]{1}[0-9]{9}" 
     									  title="Phone number with 7-9 and remaing 9 digit with 0-9" required>
                                </div>
                                <div class="form-group">
                                    <label>DOB</label>
                                    <input class="au-input au-input--full" type="date" name="dob" placeholder="date of birth" required>
                                </div>
                                <div class="form-group">
                                    <label>Gender</label>
                                   
                                 <div class="radio">
										  <label><input type="radio" name="gender" value="male"checked>male</label>
										</div>
										<div class="radio">
										  <label><input type="radio" name="gender" value="female">female</label>
										</div>
										 </div>
                                <div class="form-group">
                                    <label>Image</label>
                                    <input class="au-input au-input--full" type="file" name="ImageFile" required>
                                </div>
                                 <div class="form-group">
                                    <label>Id Proof[Adhar Card,Pan Card,Electricity bill]</label>
                                    <input class="au-input au-input--full" type="file" name="ImageFile1" required >
                                </div>
                                <div class="form-group">
                                    <label>Address proof</label>
                                    <input class="au-input au-input--full" type="file" name="ImageFile2" required>
                                </div>
                                 <div class="form-group">
                                    <label>Joining date</label>
                                    <input class="au-input au-input--full" type="date" name="jdate" placeholder="jdate" required>
                                </div>
                                <div class="login-checkbox">
                                   
                                   
                                </div>
                                <button class="au-btn au-btn--block au-btn--green m-b-20" type="submit">sign up</button>
                               
                           </form>
                        </div>
	                                    
	                    </div>
	                    </div>
	                    <jsp:include page="footer.jsp" /> 
	                    </div>          
	                           </div>
	                        
	            <!-- END MAIN CONTENT-->
	           </div>
	       </div>
	        <!-- END PAGE CONTAINER-->
		</div>
		<jsp:include page="script.jsp" /> 
	</body>
</html>