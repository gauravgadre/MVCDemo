<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
   <jsp:include page="link.jsp"/> 
</head>

<body class="animsition">
    <div class="page-wrapper">
        <div class="page-content--bge5">
            <div class="container">
                <div class="login-wrap">
                    <div class="login-content">
                        <div class="login-logo">
                     <h3>   <%if(null!=request.getAttribute("error")){
                        	out.println(request.getAttribute("error"));
                        	out.println("<span class = blinking></span>");
                        	
                        } %></h3>
                             <a href="#">
                                <img src="images/icon/emp.jpg" alt="CoolEmployee">
                            </a>
                        </div>
                        <div class="login-form">
                            <form action="emplogin" method="post">
                                <div class="form-group">
                                    <label>Email Id</label>
                                    <input class="au-input au-input--full" type="email" name="email" placeholder="Email">
                                </div>
                                <div class="form-group">
                                    <label>Password</label>
                                    <input class="au-input au-input--full" type="password" name="password" placeholder="Password">
                                </div>
                                <div class="login-checkbox">
                                    <label>
                                        <input type="checkbox" name="remember">Remember Me
                                    </label>
                                     <div class="form-group">
                                    <label>
                                        <a href="forgotpass.jsp">Forgotten Password?</a>
                                    </label>
                                    </div>
                                  
                                    
                                </div>
                                <button class="au-btn au-btn--block au-btn--green m-b-20" type="submit">sign in</button>
                                <div class="social-login-content">
                                    
                                </div>
                            </form>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
   <jsp:include page="script.jsp"/> 
</body>

</html>
<!-- end document-->