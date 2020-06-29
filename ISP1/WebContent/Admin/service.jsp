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
	if(session.getAttribute("user")==null)
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
                                    <h2 class="title-1">Add Service</h2>
                                 
                                </div>
                            </div>
                        </div>
                    <div class="login-content">
                     <div class="row">
                       <div class="col-md-3"></div>
                       <div class="col-md-6">
                         <div class="login-form">
                    <center>
                      
                        <h4><%if(null!=request.getAttribute("errormsg")){
                    	 out.println ( request.getAttribute("errormsg"));
                    	  
                       } %></h4>
                       </center>
                            <form action="servicedb" method="post" enctype="multipart/form-data">
                             <div class="form-group">
                                    <label>service name</label>
                                    <input class="au-input au-input--full" type="text" name="sname" placeholder="service name" pattern="[A-Za-z,\s]{3,30}" title="only characters are alloweed" required>
                                </div>
                               <div class="form-group">
                                    <label>Information</label>
                                    <input class="au-input au-input--full" type="text" name="sdesc" placeholder="detail" pattern="[A-Za-z,\s]{3,30}" title="only characters are alloweed" required>
                                </div>
                                <div class="form-group">
                                    <label>Image</label>
                                    <input class="au-input au-input--full" type="file" name="ImageFile" height=30px, width=30px required >
                                </div>
                                
                                <div class="form-group">
                                    <label>Price</label>
                                    <input class="au-input au-input--full" type="text" name="sprice" placeholder="Price" required>
                                </div>
                                
                                
                                <button class="au-btn au-btn--block au-btn--green m-b-20" type="submit">Save</button>
                               
                           </form>
                        </div>
	                                    
	                                </div>
	                     </div></div>
	                     <jsp:include page="footer.jsp" /> 
	                     </div></div>      
	                      </div>  
	            <!-- END MAIN CONTENT-->
	           
	        </div>
	        <!-- END PAGE CONTAINER-->
		</div>
		<jsp:include page="script.jsp" /> 
	</body>
</html>