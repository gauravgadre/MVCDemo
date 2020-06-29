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
<script type="text/javascript">
function checkPass(){
	var npass = document.getElementsByName("npass")[0].value;
	var cpass = document.getElementsByName("cpass")[0].value;
	if(npass!=="" && cpass!==""){
		if(npass!=cpass){
			document.getElementById("blinking").textContent="Password Not Match";
			return false;
		}else{
			return true;
		}
	}else{
		alert("Empty");
	}
	
}
</script>
</head>
<body>
<jsp:include page="header2.jsp"/>
 <br><br><br>
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
        <form class="text-center" onSubmit ="return checkPass()" style="color: #757575;" method="post" action="Forgot">
			<input type="hidden" name="cemail" value="">
            <!-- New Password -->
            <div class="md-form mt-0">
                <input type="password" id="materialRegisterFormEmail" Id="npass" name="npass" class="form-control">
                <label for="materialRegisterFormEmail">New Password</label>
            </div>
 
            <!-- Confirm Password -->
            <div class="md-form">
                <input type="password" id="materialRegisterFormPassword" Id="cpass" name="cpass" class="form-control" aria-describedby="materialRegisterFormPasswordHelpBlock">
                <label for="materialRegisterFormPassword">Confirm Password</label>
            </div>
            <button  class="btn btn-rounded btn-block my-4 waves-effect z-depth-0" style="border: 2px solid black;border-color:#1DD2B8; color:#1DD2B8;" type="submit" >Save Password</button>
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