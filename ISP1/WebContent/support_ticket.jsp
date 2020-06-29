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
<% 
					response.setHeader("Cache-Control","no-cache");
					response.setHeader("Cache-Control","no-store");
					
					if(session.getAttribute("cemail")==null)
					response.sendRedirect("login.jsp");
	%>
<div class="row" style="margin-top:7%;margin-bottom:7%;">
  <div class="col-md-3"></div>
  <div class="col-md-6">
<ul class="nav nav-tabs" id="myTab" role="tablist">
  <li class="nav-item">
    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home"
      aria-selected="true">Open New Ticket</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile"
      aria-selected="false">My Support Ticket</a>
  </li>
</ul>
<div class="tab-content" id="myTabContent">
  <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
  		<form method="post" action="support_ticket" enctype="multipart/form-data">
  			<div class="Title">
  				<h4>OPEN NEW TICKET</h4>
  			<hr>
  			</div>
  			<div class="dept" style="margin:10px">
  				<label>Select Department :</label>
  				<select class="form-control" name="dept">
  				<option value="Billing">Billing</option>
  				<option value="Sales">Sales</option>
  				<option value="Service">Service</option>
  				</select>
  			</div>
  			<div class="subject" style="margin:10px">
  				<label>Subject :</label>
  				<input type="text" class="form-control" name="subject">
  			</div>
  			<div class="maintext" style="margin:10px">
  				<label>Compose :</label>
  				<textarea class="form-control" rows="15%" cols="90%" name="maintext"></textarea>
  			</div>
  			<div class="attachments" style="margin:20px">
	  			<div class="row">
	  				<div class="attach1 col-md-4">
			  			<label>Attachment 1</label>
			  			<input type="file" name="attach1">
		  			</div>
		  			<div class="attach1 col-md-4">
			  			<label>Attachment 2</label>
			  			<input type="file" name="attach2">
		  			</div>
		  			<div class="attach1 col-md-4">
			  			<label>Attachment 3</label>
			  			<input type="file" name="attach3">
		  			</div>
	  			</div>
  			</div>
  			<div class="submit" style="text-align:center;">
  				<button class='btn btn-info btn-rounded' type="submit">SEND</button>
  			</div>
  		</form>  
  </div>
  <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
  	<div class="Title">
  				<h4>MY SUPPORT TICKETS</h4>
  			<hr>
  			</div>	
  	<div class="table-responsive">
  <table class="table">
    <thead>
      <tr>
        <th scope="col">Department</th>
        <th scope="col">Subject</th>
        <th scope="col">Status</th>
        <th scope="col">Last Reply</th>
      </tr>
    </thead>
    <tbody>
      
           <%@page import="java.sql.ResultSet" %>
           <%@page import="ISPPackage.ISPDao" %>
              
              <%
            try{  
  	        int cid=ISPDao.getcid("customer_details where cemail='"+(String)session.getAttribute("cemail")+"'");
  	        
  			 ResultSet rs=ISPDao.get("support_ticket where cid= "+cid);
  			 while(rs.next()) {
  				%>
  				  <tr>
			        <td><% out.print(rs.getString("sdept")); %></td>
			        <td><% out.print(rs.getString("subject")); %></td>
			        <td><% out.print(rs.getString("status")); %></td>
			        <td><% if(rs.getString("reply")==null) 
			        			out.print("-"); 
			        		else 
			        			out.print(rs.getString("reply")); %></td>
			      </tr>
  				
  				
  				
  				<%
  			}
   			rs.close();  
   			}catch(Exception e){ System.out.println(e);}
  				%>
      
    </tbody>
  </table>
</div>
  
  </div>
 
</div>
</div>
  		<div class="col-md-3"></div>  	
  	</div>
<jsp:include page="footer.jsp"/>
<jsp:include page="script.jsp"></jsp:include>
</body>
</html>