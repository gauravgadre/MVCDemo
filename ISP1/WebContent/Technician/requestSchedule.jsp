<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="Technician.*" %>
<%@page import="java.sql.ResultSet" %>
         
<!DOCTYPE html>

<html lang="en">

<head>
      <jsp:include page="head.jsp" />     
</head>
<% 
					response.setHeader("Cache-Control","no-cache");
					response.setHeader("Cache-Control","no-store");
					
					if(session.getAttribute("temail")==null)
					response.sendRedirect("../login.jsp");
					%>
<body class="animsition">
    <div class="page-wrapper">
     
		<jsp:include page="headerMobile.jsp" /> 
      
 		<jsp:include page="sideNav.jsp" /> 
        <!-- PAGE CONTAINER-->
        <div class="page-container">
          
			<jsp:include page="topNav.jsp" /> 
            <!-- MAIN CONTENT-->
            
            <div class="main-content">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="overview-wrap">
                                    <h2 class="title-1">Set Schedule</h2>
                                </div>
                            </div>
                        </div>
                    	 <div class="row" style="padding-top:1%;padding-bottom:1%;">
                            <div class="col-lg-12">
                                <div class="au-card recent-report">
                                    <div class="au-card-inner" >
                                       <div class="row">
                                    <div class="col-md-3"></div>
                                    <div class="col-md-6">
                                      <div class="login-form">
                             <!-- Form -->
        <form class="text-center" action="requestSchedule" method="post" style="color: #757575;">
		<%
		int cid=Integer.parseInt(request.getParameter("cid"));
		%>
			<input type="hidden" name="cid" value="<%=cid%>">
			
		<div class="md-form md-outline input-with-post-icon datepicker">
		<label>Set Date</label>
            <input class="au-input au-input--full"type="date" name="setdate" required>
		  
		</div>
		<div class="md-form md-outline">
		<label>Set Time</label>
            <input class="au-input au-input--full" type="time" name="settime" required>
  
</div>
<br>
            <!-- Send button -->
            <button class="au-btn au-btn--block au-btn--green m-b-20" type="submit">Set</button>

        </form>
                        </div>    
                                    </div>
                                    <div class="col-md-3"></div>
                                    </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                       
                    <jsp:include page="footer.jsp" /> 
                    </div>
                </div>
            </div>
            <!-- END MAIN CONTENT-->
            <!-- END PAGE CONTAINER-->
        </div>

    </div>

<jsp:include page="script.jsp" />

</body>

</html>
<!-- end document-->

