<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

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
        <div class="page-content--bge5">
            <div class="container">
                <div class="login-wrap">
                    <div class="login-content">
                        <div class="login-logo">
                     <h3>   <%if(null!=request.getAttribute("error")){
                        	out.println(request.getAttribute("error"));
                        	//out.println("<span class = "blinking"></span>");
                        	
                        } %></h3>
                            <a href="#">
                                <img src="images/icon/emp.jpg" alt="CoolEmployee">
                            </a>
                        </div>
                        <div class="login-form">
                            <form action="ForgotPassServlet" method="post">
                                <div class="form-group">
                                    <label>Email Address</label>
                                    <input class="au-input au-input--full" type="email" name="email" placeholder="Email">
                                </div>
                                <div class="form-group">
                                    <label>New Password</label>
                                    <input class="au-input au-input--full" type="password" name="newpassword" placeholder="enter Password">
                                </div>
                                 <div class="form-group">
                                    <label> Confirm Password</label>
                                    <input class="au-input au-input--full" type="password" name="confirmpassword" placeholder="retype Password">
                                </div>
                                
                                <div class="login-checkbox">
                                    <label>
                                        <input type="checkbox" name="remember">Remember Me
                                    </label>
                                 </div>
                                <button class="au-btn au-btn--block au-btn--green m-b-20" type="submit">sign in</button>
                                <div class="social-login-content">
                                    
                                </div>
                            </form>
                            <div class="register-link">
                                <p>
                                   Don't you have account?
                                    <a href="#">Sign Up Here</a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
<jsp:include page="script.jsp" /> 
</body>

</html>
<!-- end document-->