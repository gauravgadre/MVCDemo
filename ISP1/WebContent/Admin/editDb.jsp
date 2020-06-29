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
                                    <h2 class="title-1">Edit Employee</h2>
                                 
                                </div>
                            </div>
                        </div>
                    <div class="login-content">
                     <div class="row">
                       <div class="col-md-3"></div>
                       <div class="col-md-6">
                        <div class="login-form">
                            <form action="editemp" method="post">
                             <div class="form-group">
                                    <label>Employee name</label>
                                    <input class="au-input au-input--full" type="text" name="ename" placeholder="employee name" required>
                                </div>
                               <div class="form-group">
                                    <label>Password</label>
                                    <input class="au-input au-input--full" type="password" name="password" placeholder="password" required>
                                </div>
                                <div class="form-group">
                                    <label>Address</label>
                                    <input class="au-input au-input--full" type="text" name="address" placeholder="address" required>
                                </div>
                                <div class="form-group">
                                    <label>Mobile no</label>
                                    <input class="au-input au-input--full" type="text" name="mobile" placeholder="mobile" required>
                                </div>
                                
                                <button class="au-btn au-btn--block au-btn--green m-b-20" type="submit">sign up</button>
                               
                           </form>
                        </div>
	                           <div class="col-md-3"></div>
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