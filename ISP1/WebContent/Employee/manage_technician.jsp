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
	
	if(session.getAttribute("uemail")==null)
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
                                    <h2 class="title-1" style="color:#000">Add Employee</h2>
                                 
                                </div>
                            </div>
                        </div>
                    <div class="login-content">
                     <div class="row">
                       <div class="col-md-3"></div>
                       <div class="col-md-6">
                    
                        <div class="login-form">
                        <h4> <%if(null!=request.getAttribute("errormsg")){
                    	 out.println ( request.getAttribute("errormsg"));
                        } %></h4></div>
                            <form action="register"  onsubmit="return checkForm(this);" method="post" enctype="multipart/form-data">
                             <div class="form-group">
                                    <label>First name</label>
                                    <input class="au-input au-input--full"  type="text" title="Name must contain at least  characters, including UPPER/lowercase LETTERS ONLY" type="text" required pattern="^[A-z -']{15}+$"  name="tfname" onchange="
  										this.setCustomValidity(this.validity.patternMismatch ? this.title : '');
  										if(this.checkValidity()) form.password.pattern = RegExp.escape(this.value);"></div>
  										
                                    
                                     
                                <div class="form-group">
                               <label>Middle name</label>
                                    <input class="au-input au-input--full" title ="enter only  alphabet.  numbers are not allowed" type="text" pattern="^[A-z -']{15}+$"  name="tmname"  required>
                                </div>
                                <div class="form-group">
                                    <label>Last name</label>
                                    <input class="au-input au-input--full" title ="enter only  alphabet.  numbers are not allowed" type="text" pattern="^[A-z -']{15}+$"   name="tlname"  required>
                                										
                              
                                </div>
                                <div class="form-group">
                                    <label>User name</label>
                                    <input class="au-input au-input--full"  title ="enter only  alphabet. numbers are not allowed" type="text" pattern="^[A-z -']{15}+$"   name="uname"  required>
                                </div>
                                <div class="form-group">
                                    <label>Email</label>
                                    <input class="au-input au-input--full" type="email" name="temail"  required>
                                </div>
									<div class="form-group">
                                <label>Password: </label><input class="au-input au-input--full"  type="password" title="Password must contain at least 6 characters, including UPPER/lowercase and numbers" type="text" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,10}" name="tpass" onchange="
  										this.setCustomValidity(this.validity.patternMismatch ? this.title : '');
  										if(this.checkValidity()) form.password.pattern = RegExp.escape(this.value);">
  										
  										</div>
                                
                              
                               <div class="form-group">
                                    <label>address </label>
                                    <input class="au-input au-input--full" title ="enter only  alphabet.  Numbers are not allowed" type="text"   name="ccity" required >
                                    
                                </div>
                                <div class="form-group">
                                    <label>Mobile no</label>
                                    <input class="au-input au-input--full"  type="text" id="mobile" name="tphone" required >
                                  
                                </div>
                                <div class="form-group">
                                    <label>DOB</label>
                                    <input class="au-input au-input--full" type="date" name="tdob"  required>
                                </div>
                                <div class="form-group">
                                    <label>Gender</label>
                                   
                                 <div class="radio">
										  <label><input type="radio" name="tgender" value="male" checked>male</label>
										</div>
										<div class="radio">
										  <label><input type="radio" name="tgender" value="female">female</label>
										</div>
										 </div>
                                <div class="form-group">
                                    <label><b>Id Proof</b></label>
                                    <input class="au-input au-input--full" type="file" name="tidproof" placeholder="image" >
                                </div>
                                 <div class="form-group">
                                    <label><b>Address Proof</b></label>
                                    <input class="au-input au-input--full" type="file" name="taddrproof" placeholder="image" >
                                    
                                </div>
                                
                                 <div class="form-group">
                                    <label><b>Passport</b></label>
                                    <input class="au-input au-input--full" type="file" name="tpassport" placeholder="image" >
                                </div> 
                                <div class="form-group">
                                    <label><b>Joining date</b></label>
                                    <input class="au-input au-input--full" type="date" name="jdate" placeholder="Joining Date" >
                                </div> 
                                 <div class="form-group">
                                    <label></label>
                                    <input class="au-input au-input--full" type="hidden" value=0 name="status"  required>
                                </div>  
                                
                                <div class="login-checkbox">
                                   
                                   
                                </div>
                                  <div>
                                <button class="au-btn au-btn--block au-btn--green m-b-20" type="submit" value="Submit" >sign up</button>
                       </div>
                        </form>
	                    </div>
	                     <div class="col-md-3"></div>
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
		<script>
           function validate()      
           {
         	    
         	    var m=document.getElementById("mobile").value;        
         	  if(m==" ")
         		  {
         		  document.getElementById("div1").innerHTML="enter the mobile number";
         		  document.getElementById("div1").style.color="Red";
         		  }
         	  if(isNaN(m))
         		  {
         		  document.getElementById("div1").innerHTML="please enter only numeric value";
         		  return false;
         		  }
         	  
         	  if(m.length<10)
         		  {
         		  document.getElementById("div1").innerHTML="please enter 10 digit number";
         		  return false;
         		  
         		  }
         	  if(m.length>10)
        		  {
        		  document.getElementById("div1").innerHTML="please enter only 10 digit number";
        		  return false;
				  }
         	  if((m.charAt(0)!=9) && (m.charAt(0)!=8) && (m.charAt(0)!=7))
         	  {
         		  document.getElementById("div1").innerHTML="please enter VALID mobile  number";
         		  return false;
         		 
     		 }
         	  
         }
            </script>
            <jsp:include page="script.jsp" />
	</body>
</html>
