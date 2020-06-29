<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE>
<html>
<head>
 <jsp:include page="head.jsp"/> 
</head>
<body class="animsition">
    <div class="page-wrapper">
        <div class="page-content--bge5">
            <div class="container">
            
                <div class="login-wrap">
                    <div class="login-content">
                        <div class="login-logo">
                       
                            <h3>Forgot Password</h3>
                        </div>
                        <div class="login-form">
                            <form action="Forgot1_pass" method="post">
                                <div class="form-group">
                                    <label>New Password</label>
                                    <input class="au-input au-input--full" type="password" name="npass" placeholder="Password" required>
                                </div>
                                <div class="form-group">
                                    <label>Confirm Password</label>
                                    <input class="au-input au-input--full" type="password" name="cpass" placeholder="Password" required>
                                </div>
                                <div>
                                <button class="au-btn au-btn--block au-btn--green m-b-20" type="submit">Update Password</button>
                                </div>
                            </form>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    </body>
 <jsp:include page="script.jsp"/> 
</html>
    