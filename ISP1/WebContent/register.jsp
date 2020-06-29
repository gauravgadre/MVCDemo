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
<section id="register"style="margin-top:6%;margin-bottom:6%">
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
    <h5 class="card-header white-text text-center py-4" style="background-color:#1DD2B8;color:#fff;">
        <strong>Personal Details</strong>
    </h5>

    <!--Card content-->
    <div class="card-body px-lg-5 pt-0">

  	<form method="post" action="RegisterDetails" enctype="multipart/form-data">
  	
		<hr>
			<div class="form-row">
				<div class="col form-group">
					<label>First name </label>   
				  	<input type="text" class="form-control" name="cfname" pattern="^[A-z -']+$" required placeholder="First Name">
				</div> <!-- form-group end.// -->
				<div class="col form-group">
					<label>Middle name </label>   
				  	<input type="text" class="form-control" name="cmname" pattern="^[A-z -']+$" required placeholder="Middle Name">
				</div> <!-- form-group end.// -->
				<div class="col form-group">
					<label>Last name</label>
				  	<input type="text" class="form-control" name="clname" pattern="^[A-z -']+$" required placeholder=" Last Name">
				</div> <!-- form-group end.// -->
			</div> <!-- form-row end.// -->
			<div class="form-row">
				<div class="col form-group">
					<label>Mother name </label>   
				  	<input type="text" class="form-control" name="motherf" pattern="^[A-z -']+$" required placeholder="Mother Name">
				</div> <!-- form-group end.// -->
				<div class="col form-group">
					<label>Email address</label>
				<input type="email" class="form-control" name="cemail" placeholder="Email">
			
				</div> <!-- form-group end.// -->
				
			</div> <!-- form-row end.// -->
		
				<div class="form-row">
				<div class="col form-group">
					<label>User Name </label>   
				  	<input type="text" class="form-control" name="username" pattern="^[A-z0-9 -']+$" required placeholder="Username">
				</div> <!-- form-group end.// -->
				<div class="col form-group">
					<label>Password</label>
				  	<input type="password" class="form-control" name="cpass"pattern="^[A-z0-9 -']{8,12}$" required placeholder="password">
				</div> <!-- form-group end.// -->
			</div> <!-- form-row end.// -->
			<div class="form-row">
				<div class="col form-group">
					<label>Date of Birth </label>   
				  	<input type="date" class="form-control" name="cdob" placeholder="mm-dd-yyyy">
				</div> <!-- form-group end.// -->
				<div class="form-group">
				<label>Mobile No</label>
			    <input class="form-control" name="cphone" pattern="^[0-9']{12}+$" required type="text" placeholder="Mobile no">
			</div> <!-- form-group end.// -->
			</div> <!-- form-row end.// -->
		<label>Gender </label>  
			<div class="form-group">
		
					<label class="form-check form-check-inline">
		
				  <input class="form-check-input" type="radio" checked name="cgender" value="male">
				  <span class="form-check-label"> Male </span>
				</label>
				<label class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="cgender" value="female">
				  <span class="form-check-label"> Female</span>
				</label>
				<label class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="cgender" value="other">
				  <span class="form-check-label">Other</span>
				</label>
			</div> <!-- form-group end.// -->
				<hr>
		 <h4 class="text-center" >Address </h4>
		<hr>
		<div class="form-row">
				<div class="col form-group">
					<label>Flat No</label>   
				  	<input type="text" class="form-control" name="cflat" placeholder="Flat No ">
				</div> <!-- form-group end.// -->
				<div class="col form-group">
					<label>Building Name</label>   
				  	<input type="text" class="form-control" name="cbuilding" placeholder="Building Name">
				</div> <!-- form-group end.// -->
				
			</div> <!-- form-row end.// -->
		<div class="form-row">
				<div class="col form-group">
					<label>Street </label>   
				  	<input type="text" class="form-control" pattern="^[A-z0-9 -']+$" required name="cstreet" placeholder="Street">
				</div> <!-- form-group end.// -->
		
				<div class="col form-group">
					<label>LandMark</label>   
				  	<input type="text" class="form-control" pattern="^[A-z0-9 -']+$" required name="clandmark" placeholder="LandMark ">
				</div> <!-- form-group end.// -->
				
			</div> <!-- form-row end.// -->
			<div class="form-row">
			<div class="col form-group">
					<label>City </label>   
				  	<input type="text" class="form-control" pattern="^[A-z -']+$" required  name="ccity"placeholder="City ">
				</div> <!-- form-group end.// -->
				
				<div class="col form-group">
					<label>Taluka </label>   
				  	<input type="text" class="form-control" pattern="^[A-z -']+$" required name="ctaluka" placeholder="Taluka">
				</div> <!-- form-group end.// -->
				
			</div> <!-- form-row end.// -->
			<div class="form-row">
				<div class="col form-group">
				
					<label>District </label>   
				  	<input type="text" class="form-control" pattern="^[A-z -']+$" required name="cdistrict" placeholder="District ">
				</div> <!-- form-group end.// -->
				<div class="col form-group">
					<label>State </label>   
				  	<input type="text" class="form-control" pattern="^[A-z -']+$" required name="cstate" placeholder="State">
				</div> <!-- form-group end.// -->
				
			</div> <!-- form-row end.// -->
			<div class="form-row">
				<div class="col form-group">
					<label>Country</label>   
				  	<input type="text" class="form-control" pattern="^[A-z -']+$" required name="ccountry" placeholder="Country">
				</div> 
				<div class="col form-group">
					<label>Zip/Postal code/Pin code</label>   
				  	<input type="text" class="form-control" pattern="^[0-9 -']{6}+$" required name="cpincode" placeholder="Zip/Postal code/Pin code ">
				</div> <!-- form-group end.// -->
				
				
			</div> <!-- form-row end.// -->
				<hr>
			<h4 class="text-center" >Document</h4>
		<hr>
		<TABLE>
			<tr>
		
			<td>
				<label ><strong>Passport Photo</strong></label>
			</td>
			<td> 
				<input class="form-control" type="file" required name="passport" multiple>
			
			</td>
				
			 <!-- form-group end.// -->
			 </tr>
		
			<tr>
				<td>
				
					<label><strong>Id Proof</strong></label>
				</td>
				<td> 
					<input class="form-control" type="file" required name="idproof" multiple>
			
				</td>
				
			 <!-- form-group end.// -->
			 </tr>
		
			<tr>
				<td>
					
					<label ><strong>Address Proof</strong></label>
				</td>
				<td> 
					<input type="file" class="form-control" required name="addrproof" multiple>
				
				</td>
				
		 <!-- form-group end.// -->
		 	</tr>
		</TABLE>
		    <div class="form-group">
		        <button class="btn btn-rounded btn-block my-4 waves-effect z-depth-0" style="border: 2px solid black;border-color:#1DD2B8; color:#1DD2B8;" type="submit">Sign Up</button>
		    </div> <!-- form-group// -->      
		<br><br>
		</form>      
	
    </div>

</div>


</div>
<div class="col-md-3"></div>
</div>
</section>



<jsp:include page="footer.jsp"/>
<jsp:include page="script.jsp"></jsp:include>
<script type="text/javascript">
$(document).ready(function(){
	$('#username').change(function(){
		var username=$('#username').val();
		$.ajax({
			type:'POST',
			data:{username:username},
			url:'UsernameExist',
			success:function(result){
				$('#result').html(result);
			}
		});
	});
});
</script>
</body>
</html>