<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="ISPPackage.ISPDao" %>
 <%@page import="java.util.*" %> 
 <%
 	Random randomGenerator = new Random();
	int randomInt = randomGenerator.nextInt(1000000);
 %>

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
<script src="https://code.jquery.com/jquery-1.11.2.min.js"></script>
</head>
<body>
<% 
					response.setHeader("Cache-Control","no-cache");
					response.setHeader("Cache-Control","no-store");
					
					if(session.getAttribute("cemail")==null)
					response.sendRedirect("login.jsp");
	%>
 <jsp:include page="header2.jsp"></jsp:include>
 

<div class="container my-5 z-depth-1" style="margin-top:6%;margin-bottom:6%">
  <!--Section: Content-->
  <section class="dark-grey-text">
    <form method="post" action="pgRedirect.jsp">
    <div class="row pr-lg-5">
      <div class="col-md-7 mb-4">
		 <div class="view" style="padding:7%;">
         <h2 class="font-weight-bold mb-4">CHECK OUT</h2>
         <br>
         <%
          HttpSession se=request.getSession();
String cemail=(String)se.getAttribute("cemail");

try{  
	 ResultSet rs=ISPDao.get("customer_details where cemail='"+cemail+"'");
	 if(rs.next()){
		 %>
		
		  <div class="orderid">         	
         	<input type="text" name="ORDER_ID" hidden="true" value="ORDS_<%= randomInt %>">
         	<h4>Order id :- ORDS_<%= randomInt %></h4>
         </div>
         <div class="orderid">
         	<input type="text" hidden="true" name="CUST_ID" value="CUST<%=rs.getInt("cid")%>">
         	<h4>Customer id :- CUST<%=rs.getInt("cid")%></h4>
         </div>
         <div class="indtypeid">
         <input type="text" hidden="true" name="INDUSTRY_TYPE_ID" value="Retail">
         </div>
         <div class="indtypeid">
         <input type="text" hidden="true" name="CHANNEL_ID" value="WEB">
         </div>
         <div class="orderid">
        	<h4>Customer Name :- <% out.print(rs.getString("cfname")+" "+rs.getString("cmname")+" "+rs.getString("clname")); %> </h4>
         </div>
         <div class="orderid">
        	<h4>Customer Mobile :- <% out.print(rs.getString("cphone")); %></h4>
         </div>
         <div class="orderid">
        	<h4>Customer Email :- <% out.print(rs.getString("cemail")); %></h4>
         </div>
  
		 <%
	 }
	 rs.close();  
}
catch(Exception e){ System.out.println(e);}
%>

  </div>

      </div>
      <div class="col-md-5 d-flex align-items-center">
        <div style="width:100%;padding:3%;">
                
<table class="table table-striped" >
  <thead>
    <tr>
      <th scope="col"><h5>Items</h5></th>
      <th scope="col"><h5>Price</h5></th>    
    </tr>
  </thead>
  <tbody>
<%
String p=(String)se.getAttribute("add_to_cart");
%>
	
           <%@page import="java.sql.ResultSet" %>
             <%@page import="java.io.IOException" %>
				<%@page import="java.lang.String" %>
				<%@page import="java.util.ArrayList" %>
				<%@page import="java.util.ListIterator" %>
				<%@page import="java.util.List" %>
				<%@page import="java.util.Arrays" %>
              <%	
              if(p!=null)
              {
            	  String str[] = p.split(" ");
    		      List<String> al = new ArrayList<String>();
    		      al = Arrays.asList(str);
                  ListIterator<String> listItr = al.listIterator();
                  Double total=0.0;
                  while(listItr.hasNext()) {
                      String val=(String)listItr.next();
                      String tblname="";
                      String tblid="";
                      String tblprice="";
                      String colname="";
                      if(val.contains("pid")){
                    	 tblname="package";
                    	 colname="pname";
                    	 tblid="pid";
                    	 tblprice="price";
                      	} 
                      if(val.contains("prod")){
                      	  tblname="Product";
                      	colname="prodname"; 
                      	  tblid="prodid";
                      	tblprice="prodprice";
                    	}
                      if(val.contains("ser")){
                      	  tblname="service";
                      	colname="sname";
                      	  tblid="sid";
                      	  tblprice="sprice";
                    	}
                      try{  
                		  	String[] id=val.split("-");
                			 ResultSet rs=ISPDao.get(""+tblname+" where "+tblid+"="+id[1]);
                				 while(rs.next()) {
                  				 total=total+Double.parseDouble(rs.getString(tblprice));
                  				%>
						        <tr>
						        <td><h6><% out.print(rs.getString(colname)); %></h6></td>
						        <td><h6><% out.print(rs.getString(tblprice)); %></h6></td>
						        </tr>	
              				 <%
                  			}
                 			rs.close();  
                 			}
                    	  catch(Exception e){ System.out.println(e);}
                 	}
      				%>
			        <tr>
			        <td><h6>Total</h6></td>
			        <td><h6><% out.print(total); %></h6></td>
			         
			        </tr>
			        <input type="text" hidden="true" name="TXN_AMOUNT" value="<% out.print(total);%>">
      				<%
             	} 
             %>   
  </tbody>
</table>

 <button type="submit" class="btn btn-orange btn-rounded mx-0">Proceed to Pay</button>
</div>
</div>
</div>
</form>
</section>
  <!--Section: Content-->
</div>


<jsp:include page="footer.jsp"/>
<jsp:include page="script.jsp"></jsp:include>
</body>
</html>