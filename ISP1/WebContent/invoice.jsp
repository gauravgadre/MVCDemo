<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Internet Service Provider</title>
<meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">

  <!-- Favicons -->
  <link href="img/favicon.png" rel="icon">
  <link href="img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,700|Open+Sans:300,300i,400,400i,700,700i" rel="stylesheet">

  <!-- Bootstrap CSS File -->
  <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Libraries CSS Files -->
  <link href="lib/animate/animate.min.css" rel="stylesheet">
  <link href="lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="lib/ionicons/css/ionicons.min.css" rel="stylesheet">
  <link href="lib/magnific-popup/magnific-popup.css" rel="stylesheet">

  <!-- Main Stylesheet File -->
  <link href="css/style.css" rel="stylesheet">
<!-- Font Awesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<!-- Google Fonts -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.13.0/css/mdb.min.css" rel="stylesheet">


</head>
<body>
<% 
					response.setHeader("Cache-Control","no-cache");
					response.setHeader("Cache-Control","no-store");
					
					if(session.getAttribute("cemail")==null)
					response.sendRedirect("login.jsp");
	%>
<%@page import="ISPPackage.ISPDao" %>
           <%@page import="java.sql.ResultSet" %>
          
				<%@page import="java.lang.String" %>
				<%@page import="java.util.ArrayList" %>
				<%@page import="java.util.ListIterator" %>
				<%@page import="java.util.List" %>
				<%@page import="java.util.Arrays" %>
              
 <%
    String cid=(String)session.getAttribute("cemail");
    String prod="";
    String amount="";
    String ser="";
	try{
		
		ResultSet rs=ISPDao.get("package,request,customer_details,payment where payment.orderid=request.orderid and customer_details.cid=request.cid and package.pid=request.pid and customer_details.cemail='"+cid+"'"); 
			
		 
		   
		if(rs.next())
		{
		
		%> 
	 
 <div class="container" style="margin: 50px 0px 3% 12%;">
<nav class="" style="height:72px;background-image: linear-gradient(45deg, #1de099, #1dc8cd);">
<a class="navbar-brand" style="color:#fff; padding-left:10%;font-size:40px;" href="#">Internet Service Provider</a>
	
  	<div class="collapse navbar-collapse" id="navbarText">  	
  	<span class="navbar-text white-text">
      Navbar text with an inline element
    </span>
    </div>
</nav>
 
    <div class="row">
     <div class="card col-md-5" style="margin:3% 3% 3% 5%;">
  <div class="card-body">
    <h5 class="card-title">Your Details</h5>
    <h6 class="card-subtitle mb-2 text-muted">
    <%
  	 	out.print("<br>"+rs.getString("cfname")+ " "+ rs.getString("cmname")+" " +rs.getString("clname"));
		out.print("<br><br> Flat No. "+rs.getString("cflat")+ " "+rs.getString("cbuilding")+ " "+rs.getString("cstreet")+ " "+rs.getString("ccity")+ "<br> "+rs.getString("ctaluka")+ "<br> "+rs.getString("cdistrict")+" "+rs.getString("cpincode")+ "<br> "+rs.getString("cstate")+ "<br> "+rs.getString("ccountry"));
		out.print("<br> Landmark: "+rs.getString("clandmark"));
		out.print("<br><br> Email: "+rs.getString("cemail"));
	%>
    </h6>
    </div>
</div> 

<div class="card col-md-5" style="margin:3%;">
  <div class="card-body">
    <h5 class="card-title"></h5>
    <h6 class="card-subtitle mb-2 text-muted">
 <%
			out.print("<br>Package : "+rs.getString("pname"));
			out.print("<br><br> Mobile No.: "+rs.getString("cphone")+ "<br>Customer Id: CUST"+rs.getString("cid")+ "<br><br>Order Id: "+rs.getString("orderid")+ "<br>Date: "+rs.getString("pdate")+ "<br><br>Total "+rs.getString("amount"));
%> 
	</h6>
  </div>
</div>
    </div> 
     <div class="row">
     <div class="card col-md-11" style="margin:3% 4% 3% 4%;">
  <div class="card-body">
    <h5 class="card-title">Detailed Description</h5>
    
    <h6 class="card-subtitle mb-2 text-muted"></h6>
    <table class="table">
    <tr><th>Description</th><th>Amount</th></tr>
    <tr><td style="color:red;">Package Name</td><td></td></tr>
    <tr><th><% out.print(rs.getString("pname")+"  "+rs.getString("speed")+"  " +rs.getString("duration")+" Months"); %></th><th><% out.print(rs.getString("price")); %></th></tr>
    
      <%
     prod=rs.getString("prodid");
     ser=rs.getString("serid");
    amount=rs.getString("amount");
	}
		
   String[] id=prod.split(",");
    int idlength=id.length;
    int i=0;
    while(i<idlength)
    {
    	%>
  		 <tr><td style="color:red;">Product Name</td><td></td></tr>
  		<%	
  	
   	ResultSet rs1=ISPDao.get("product where prodid="+id[i]); 
   	i++;
   	if(rs1.next()){
   		%>
   		 <tr><th><% out.print(rs1.getString("prodname")); %></th><th><% out.print(rs1.getString("prodprice")); %></th></tr>
   		<%	   	
	 }

    }
    
    String[] id1=ser.split(",");
    int idlength1=id1.length;
    int i1=0;
    while(i1<idlength1)
    {
    	%>
  		 <tr><td style="color:red;">Service Name</td><td></td></tr>
  		<%	
   	ResultSet rs1=ISPDao.get("service where sid="+id1[i1]); 
   	i1++;
   	if(rs1.next()){
   		%>
   		 <tr><th><% out.print(rs1.getString("sname")); %></th><th><% out.print(rs1.getString("sprice")); %></th></tr>
   		<%	   	
	 }

    }
    %>
       <tr style="color:red;"><th>TOTAL</th><th><% out.print(amount); %></th></tr> 
   
    <%
  
    }
    catch(Exception e){ out.print(e); }
     %> 
    
    	</table>
   </div>
</div> 

    </div> 
    <center><input type="button" class="btn btn-primary" value="Download" onClick="window.print()">
     <a href="index.jsp"><input type="button" class="btn btn-primary" value="Back"s></a></center>
    </div>





  <script src="lib/jquery/jquery.min.js"></script>
  <script src="lib/jquery/jquery-migrate.min.js"></script>
  <script src="lib/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="lib/easing/easing.min.js"></script>
  <script src="lib/wow/wow.min.js"></script>
  <script src="lib/superfish/hoverIntent.js"></script>
  <script src="lib/superfish/superfish.min.js"></script>
  <script src="lib/magnific-popup/magnific-popup.min.js"></script>

  <!-- Contact Form JavaScript File -->
  <script src="contactform/contactform.js"></script>

  <!-- Template Main Javascript File -->
  <script src="js/main.js"></script>
  <script src="js/addtocart.js"></script>
  <!-- JQuery -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.13.0/js/mdb.min.js"></script>

</body>
</html>