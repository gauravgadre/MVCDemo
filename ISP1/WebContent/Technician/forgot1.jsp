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
                            <h3>Forget Password</h3>
                        </div>
                        <div class="login-form">
                            <form action="forgot2_pass" method="post">
                                <div class="form-group">
                                    <label>Email</label>
                                    <input class="au-input au-input--full" type="email" name="temail" placeholder="Email" required>
                                </div>
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