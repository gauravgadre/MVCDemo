<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
		<jsp:include page="link.jsp" />
		</head>
	<body>
	<% 
	 response.setHeader("Cache-Control","no-cache");
    response.setHeader("Cache-Control","no-store");
	if(session.getAttribute("uemail")==null)
		response.sendRedirect("../login.jsp");  
		%>
		<div class="page-wrapper">
		<jsp:include page="headerMobile.jsp" /> 
	  		<jsp:include page="sideNav.jsp" /> 
	        <!-- PAGE CONTAINER-->
	        <div class="page-container">
				<jsp:include page="topNav.jsp" /> 
	            <!-- MAIN CONTENT-->
	            <div class="main-content">
        			<div class="section__content--p30">
                <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="overview-wrap">
                                    <h2 class="title-1">Reply to Support Request</h2>
                                        
                                </div>
                            </div>
                        </div>
                    <div class="login-content">
                  
                        <div class="login-form">
                            <form action="accept_support_ticket" method="post" >
                             <div class="modal fade" id="modalLoginForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-center">
        <h4 class="modal-title w-100 font-weight-bold">Message</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body mx-3">
        <div class="md-form mb-5">
          <i class="fas fa-envelope prefix grey-text"></i>
          <input type="text" id="defaultForm-email" class="form-control validate" name="reply">
          <label data-error="wrong" data-success="right" >Send Reply to customer</label>
        </div>
<div>
     <input type="text" name="sid" hidden="true" value="<% out.print(request.getParameter("sid"));  %>">
                                </div>

      </div>
      <div class="modal-footer d-flex justify-content-center">
        <button class="btn btn-default">Send</button>
      </div>
    </div>
  </div>
</div>

<div class="text-center">
  <a href="" class="btn btn-default btn-rounded mb-4" data-toggle="modal" data-target="#modalLoginForm">
    Reply Form</a>
</div>
</form>

</div>
</div>
</div>
<jsp:include page="footer.jsp" />
</div>
</div>
</div>
</div>
<jsp:include page="script.jsp" />
</body>
</html>