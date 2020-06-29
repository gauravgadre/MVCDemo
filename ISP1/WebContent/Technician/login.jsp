<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<jsp:include page="head.jsp" />

</head>
<body class="animsition">
    <div class="page-wrapper">
        <div class="page-content--bge5">
            <div class="container">            
                <div class="login-wrap">
                    <div class="login-content">
                        <div class="login-logo">
                        <%if(null!=request.getAttribute("errorMessage"))
                     
    								{
    								String message=(String)request.getAttribute("errorMessage");%>
                        	<span class="blinking"><%=message%></span>
        								
   									 <%}
							%> 
                            <h3>Login</h3>
                        </div>
                        <div class="login-form">
                            <form action="loginTech" method="post">
                                <div class="form-group">
                                    <label>Email</label>
                                    <input class="au-input au-input--full" type="email" name="temail" placeholder="Email" required>
                                </div>
                                <div class="form-group">
                                    <label>Password</label>
                                    <input class="au-input au-input--full" type="password" name="tpassword" placeholder="Password" required>
                                </div>
                                <div class="login-checkbox">
                                   
                                    <label>
                                        <a href="forgot1.jsp">Forgotten Password?</a>
                                    </label>
                                </div>
                                <div>
                                
                                <button class="au-btn au-btn--block au-btn--green m-b-20" type="submit">sign in</button>
                               
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