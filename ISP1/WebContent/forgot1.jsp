<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<jsp:include page="link.jsp"/>
</head>
<body>
<jsp:include page="header2.jsp"/>

<section id="login" style="margin-top:6%;margin-bottom:6%">
<div class="row">
<div class="col-md-3"></div>
<div class="col-md-6">
<div class="card">

<span id="blinking"></span>
<h5 class="card-header white-text text-center py-4" style=" background-color:#1DD2B8; " >
        <strong>Forgot Password</strong>
</h5>
<br>
    <!--Card content-->
    <div class="card-body px-lg-5 pt-0">

        <!-- Form -->
        <form class="text-center" style="color: #757575;" method="post" action="forgot1">
			<!-- email -->
            <div class="md-form mt-0">
                <input type="email" id="materialRegisterFormEmail" Id="uemail" required name="uemail" class="form-control">
                <label for="materialRegisterFormEmail">Email</label>
            </div>	
			<span id="error"></span>
            <button  class="btn btn-rounded btn-block my-4 waves-effect z-depth-0" style="border: 2px solid black;border-color:#1DD2B8; color:#1DD2B8;" type="submit" >Send OTP</button>
            <hr>

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