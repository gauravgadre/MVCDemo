<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Internet Service Provider</title>
<style>
#blinking{
	font-size:30px;
	 text-align:center;
    animation:blinkingText 1.2s infinite;
}
@keyframes blinkingText{
    0%{     color: #FF0000;    }
    49%{    color: #FF0000; }
    60%{    color: transparent; }
    99%{    color:transparent;  }
    100%{   color: #FF0000;    }
}

</style>
<jsp:include page="link.jsp"/>
</head>
<body>
 <jsp:include page="header2.jsp"></jsp:include> 
 <br><br><br>
<section id="login" style="margin-top:6%;margin-bottom:6%">
<div class="row">
<div class="col-md-3"></div>
<div class="col-md-6">
<div class="card">
<%  
if(null!=request.getAttribute("error")){
	String msg=(String)request.getAttribute("error");
	%>
	<span id="blinking"><% out.print(msg); %></span>
	<% 
}
%>
    <h5 class="card-header white-text text-center py-4" style="background-color:#1DD2B8;">
        <strong>Sign In</strong>
    </h5>
<br>
    <!--Card content-->
    <div class="card-body px-lg-5 pt-0">

        <!-- Form -->
        <form class="text-center" style="color: #757575;" method="post" action="LoginDetails">
			<%
				if((String)request.getParameter("id")=="c"){
					%>
					 <input type="hidden" name="id" value="c">
					<%
				}
			%>
            <!-- E-mail -->
            <div class="md-form mt-0">
                <input type="email" id="materialRegisterFormUsername" required name="email" class="form-control">
                <label for="materialRegisterFormUsername">Email id</label>
            </div>

            <!-- Password -->
            <div class="md-form">
                <input type="password" id="materialRegisterFormPassword" pattern="^[A-z0-9 \@']{6,12}$" required name="upass" class="form-control" aria-describedby="materialRegisterFormPasswordHelpBlock">
                <label for="materialRegisterFormPassword">Password</label>
                <small id="materialRegisterFormPasswordHelpBlock" class="form-text text-muted mb-4">
                    At least 8 characters and 1 digit
                </small>
            </div>
            <a href="forgot1.jsp">Forgot Password</a>
            <!-- Sign up button -->
            <button class="btn btn-rounded btn-block my-4 waves-effect z-depth-0" style="border: 2px solid black;border-color:#1DD2B8; color:#1DD2B8;" type="submit">Sign In</button>
         
       </form>
        <!-- Form -->
    </div>
</div>


</div>
<div class="col-md-3"></div>
</div>
</section>

<jsp:include page="footer.jsp"/>
<jsp:include page="script.jsp"></jsp:include>
</body>
</html>