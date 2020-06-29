 <%@page import="ISPPackage.ISPDao" %>
<%@page import="java.lang.String" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
<%@page import="java.util.ListIterator" %>
<%@page import="java.util.Arrays" %>
 <!-- ======= Header ======= -->
  <header id="header">
    <div class="container">

      <div id="logo" class="pull-left">
        <h1><a href="#intro" class="scrollto">ISP</a></h1>
      </div>

      <nav id="nav-menu-container">
        <ul class="nav-menu">
          <li class="menu-active"><a href="#intro">Home</a></li>
          <li><a href="#about">About Us</a></li>
          <li><a href="#pricing">Packages</a></li>
          <li><a href="#faq">Services</a></li>
          <li><a href="#team">Products</a></li>
           <li> <a href=""class="nav-link" class="btn btn-primary" data-toggle="modal" data-target="#centralModalSm">Cart (      
           <%	    
	           String cart=(String)session.getAttribute("add_to_cart");
	           int count=0;
	           System.out.print("\\cart "+cart);
	           if(cart!=null){
	        	   cart=cart.trim();
	        		String str[] = cart.split(" ");
			       	List<String> al = new ArrayList<String>();
			       	al = Arrays.asList(str);
			        ListIterator<String> listItr = al.listIterator();
			       	while(listItr.hasNext()){
			       		String val=(String)listItr.next();
			       		if(val!=null){
			       			count++;
			       		}
			       	}			       	
	           }	                
	           out.print(count);
           %>)</a></li>     
          <li><a href="#contact">Contact Us</a></li>
          <%
        String user=(String)session.getAttribute("cemail");
        
        if(user!=null){
        %>
         
       	<li class="menu-has-children"><a href="">My Account</a>
            <ul>
            <li><a href="myaccount.jsp">My Account</a></li>
             <%
            String result=ISPDao.getId("request r,customer_details c where c.cid=r.cid and r.rstatus<>4 and c.cemail='"+user+"'");
            if(result=="Found"){
            	%>
            	 <li><a href="getStatus.jsp">Get Status</a></li>
              <li><a href="getTechnDetails.jsp">Get Technician Details</a></li>
            	<%
            }
            %>
              <li><a href="support_ticket.jsp">Support Tickets</a></li>
            </ul>
          </li>
           <li><a href="#features">Notification</a></li>
           <li><a href="Logout">Logout</a></li>
        <%	
        }
        else{
        	%>
        	<li><a href="login.jsp" >Login </a></li>
			          <li><a href="register.jsp">Register</a></li>
			        	<%
			        }
			        %>
         
          
        </ul>
      </nav><!-- #nav-menu-container -->
    </div>
  </header><!-- End Header -->
