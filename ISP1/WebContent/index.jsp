<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="ISPPackage.ISPDao" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.lang.String" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.ListIterator" %>
<%@page import="java.util.List" %>
<%@page import="java.util.Arrays" %>
<!DOCTYPE html>
<html lang="en">

<head>  
<jsp:include page="link.jsp"/>
</head>

<body>
<jsp:include page="header.jsp"/>
 
  <!-- ======= Intro Section ======= -->
  <section id="intro">

    <div class="intro-text">
      <h2>Welcome to ISP</h2>
      <p>ISP provides the best sevice to our Customers.</p>
      <a href="#about" class="btn-get-started scrollto">Get Started</a>
    </div>
  </section><!-- End Intro Section -->

  <main id="main">
  
	<!-- ======= Slider ======= -->
	<div id="carousel-example-1z" class="carousel slide carousel-fade" data-ride="carousel">
	  <!--Indicators-->
	  <ol class="carousel-indicators">
	    <li data-target="#carousel-example-1z" data-slide-to="0" class="active"></li>
	    <li data-target="#carousel-example-1z" data-slide-to="1"></li>
	    <li data-target="#carousel-example-1z" data-slide-to="2"></li>
	  </ol>
	<div id="carousel-example-2" class="carousel slide carousel-fade" data-ride="carousel">
	  <ol class="carousel-indicators">
	    <li data-target="#carousel-example-2" data-slide-to="0" class="active"></li>
	    <li data-target="#carousel-example-2" data-slide-to="1"></li>
	    <li data-target="#carousel-example-2" data-slide-to="2"></li>
	    <li data-target="#carousel-example-2" data-slide-to="3"></li>
	    <li data-target="#carousel-example-2" data-slide-to="4"></li>
	  </ol>
	  <div class="carousel-inner" role="listbox">
	    <div class="carousel-item active">
	      <div class="view">
	         <img src="assets/img/First_slide.jpg" height="670px" width="100%" alt="First slide">
	   		 <div class="mask rgba-black-light"></div>
	      </div>
	      <div class="carousel-caption">
	        <a class="btn btn-outline-Primary btn-rounded waves-effect" href="register.jsp">Register</a>
	      <a class="btn btn-outline-Primary btn-rounded waves-effect" href="login.jsp">Login</a>
	      </div>
	    </div>
	    <div class="carousel-item">
	      <!--Mask color-->
	      <div class="view">
	          <img src="assets/img/Second_slide.jpg" height="670px" width="100%" alt="Second slide">
	      <div class="mask rgba-black-light"></div>
	      </div>
	      <div class="carousel-caption">
	    	<a class="btn btn-outline-Primary btn-rounded waves-effect" href="register.jsp">Register</a>
	      <a class="btn btn-outline-Primary btn-rounded waves-effect" href="login.jsp">Login</a>
	      </div>
	    </div>
	     <div class="carousel-item">
	      <div class="view">
	          <img src="assets/img/Third_slide.jpg" height="670px" width="100%" alt="Third slide">
	   
	        <div class="mask rgba-black-light"></div>
	      </div>
	      <div class="carousel-caption">
	        <a class="btn btn-outline-Primary btn-rounded waves-effect" href="register.jsp">Register</a>
	      <a class="btn btn-outline-Primary btn-rounded waves-effect" href="login.jsp">Login</a>
	      </div>
	    </div>
	     <div class="carousel-item">
	      <div class="view">
	          <img src="assets/img/Fourth_slide.jpg" height="670px" width="100%" alt="Fourth slide">
	       <div class="mask rgba-black-light"></div>
	      </div>
	      <div class="carousel-caption">
	        <a class="btn btn-outline-Primary btn-rounded waves-effect" href="register.jsp">Register</a>
	      <a class="btn btn-outline-Primary btn-rounded waves-effect" href="login.jsp">Login</a>
	      </div>
	    </div>
	    <div class="carousel-item">
	      <!--Mask color-->
	          <img src="assets/img/Fifth_slide.jpg" height="670px" width="100%" alt="Fifth slide">	   
	        <div class="mask rgba-black-light"></div>
	      </div>
	      <div class="carousel-caption">
	      <a class="btn btn-outline-Primary btn-rounded waves-effect"  href="register.jsp">Register</a>
	      <a class="btn btn-outline-Primary btn-rounded waves-effect" href="login.jsp">Login</a>
	         </div>
	    </div>
	  </div>
	  <a class="carousel-control-prev" href="#carousel-example-2" role="button" data-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="sr-only">Previous</span>
	  </a>
	  <a class="carousel-control-next" href="#carousel-example-2" role="button" data-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="sr-only">Next</span>
	  </a>
	</div>	

  	<!-- ======= About Section ======= -->
    <section id="about">
      <div class="container-fluid">
        <div class="section-header">
          <h3 class="section-title">About Us</h3>
          <span class="section-divider"></span>
          <p class="section-description">
           An Internet service provider (ISP) is a company that provides customers with Internet access. 
          </p>
        </div>

        <div class="row">
          <div class="col-lg-6 about-img wow fadeInLeft">
            <img src="assets/img/about-img.jpg" alt="">
          </div>

          <div class="col-lg-6 content wow fadeInRight">
            <h2>ISPs also provide their customers with the ability to communicate with one another.</h2>
            <h3>Also provides dial-up, DSL, cable modem, wireless or dedicated high-speed interconnects.</h3>
            <p>
              Typically, ISPs also provide their customers with the ability to communicate with one another by providing Internet email accounts, usually with numerous email addresses at the customer’s discretion.
            </p>

            <ul>
              <li><i class="ion-android-checkmark-circle"></i>  ISPs also provide their customers with the ability to communicate with one another.</li>
              <li><i class="ion-android-checkmark-circle"></i> Also provides dial-up, DSL, cable modem, wireless or dedicated high-speed interconnects.</li>
              <li><i class="ion-android-checkmark-circle"></i> This cascades multiple times until transmissions reach a Tier 1 carrier, which is an ISP capable of reaching every other network on the Internet without purchasing IP transit or paying settlements.</li>
            </ul>

            <p>
              Individual customers and businesses pay ISPs for Internet Access. ISPs are interconnected to one another at network access points. In turn, ISPs pay other, larger ISPs for their Internet access, which in turn pay still other ISPs. 
            </p>
          </div>
        </div>

      </div>
    </section><!-- End About Section -->

    <!-- ======= Pricing Section ======= -->
    <section id="pricing" class="section-bg">
      <div class="container">
     <div id="multi-item-example" class="carousel slide carousel-multi-item" data-ride="carousel">
				<h3 style="text-align:center;">Packages</h3>
				<div class="carousel-inner" role="listbox">					
					<%
						try{ 
							 ResultSet rs=ISPDao.get("Package limit 0,3 ");
							 
							 %>
							<!--First slide-->
							<div class="carousel-item active">
								<div class="row" style="margin-bottom:6%;">
								<% 
								while(rs.next()) {
								 %>
									<div class="col-md-4 fadeInleft">
										<div class="card mb-2">
											<div class="card-body" style="text-align:center;">
												<h3><% out.print(rs.getString("pname")); %></h3>
												<h4><span> <% out.print( rs.getString("speed")); %></span></h4>
												<ul>
													<li><i class="ion-android-checkmark-circle"></i><% out.print( rs.getString("duration")); %> </li>
													<li><i class="ion-android-checkmark-circle"></i>Rs.<span> <% out.print( rs.getString("price")); %></span> </li>
													<li><i class="ion-android-checkmark-circle"></i> <% out.print( rs.getString("description")); %></li>
												</ul>
												<a class="btn btn-dark py-2 px-3 btn-pill" href="addToCart.jsp?pid=<% out.print(rs.getInt("pid")); %>">Get Started</a>
											</div>
										</div>
									</div>
								<%
								}
								%>
								</div>
							</div>
						<% 
							rs.close();  
						}
						catch(Exception e)
						{ 
							System.out.println(e);
						}
					%>
	
	    			<!--/.First slide-->
	    
					<%
					try{  
						 ResultSet rs=ISPDao.get("Package limit 3,3");
						%>
						<!--First slide-->
						<div class="carousel-item ">
							<div class="row" style="margin-bottom:6%;">
							<% 
								while(rs.next()) {
								%>
								<div class="col-md-4 fadeInleft">
									<div class="card mb-2">
										<div class="card-body" style="text-align:center;">
											<h3><% out.print(rs.getString("pname")); %></h3>
												<h4><span> <% out.print( rs.getString("speed")); %></span></h4>
												<ul>
													<li><i class="ion-android-checkmark-circle"></i><% out.print( rs.getString("duration")); %> </li>
													<li><i class="ion-android-checkmark-circle"></i>Rs.<span> <% out.print( rs.getString("price")); %></span> </li>
													<li><i class="ion-android-checkmark-circle"></i> <% out.print( rs.getString("description")); %></li>
												</ul>
												<a class="btn btn-dark py-2 px-3 btn-pill" href="addToCart.jsp?pid=<% out.print(rs.getInt("pid")); %>">Get Started</a>
										</div>
									</div>
								</div>
								<%
							}
							%>
							</div>
						</div>
						<%
						rs.close();  
					}
					catch(Exception e)
					{ 
						System.out.println(e);
					}
					%>

					<!--/.second slide-->
					<%
					try{  
						 ResultSet rs=ISPDao.get("Package limit 6,3");
						%>
						<!--First slide-->
						<div class="carousel-item ">
							<div class="row" style="margin-bottom:6%;">
							<% 
								while(rs.next()) {
								%>
								<div class="col-md-4 fadeInleft">
									<div class="card mb-2">
										<div class="card-body" style="text-align:center;">
											<h3><% out.print(rs.getString("pname")); %></h3>
												<h4><span> <% out.print( rs.getString("speed")); %></span></h4>
												<ul>
													<li><i class="ion-android-checkmark-circle"></i><% out.print( rs.getString("duration")); %> </li>
													<li><i class="ion-android-checkmark-circle"></i>Rs.<span> <% out.print( rs.getString("price")); %></span> </li>
													<li><i class="ion-android-checkmark-circle"></i> <% out.print( rs.getString("description")); %></li>
												</ul>
												<a class="btn btn-dark py-2 px-3 btn-pill" href="addToCart.jsp?pid=<% out.print(rs.getInt("pid")); %>">Get Started</a>
										</div>
									</div>
								</div>
								<%
							}
							%>
							</div>
						</div>
						<%
						rs.close();  
					}
					catch(Exception e)
					{ 
						System.out.println(e);
					}
					%>
	 			</div>
		  	<!--/.Slides-->
			</div>
			<a class="btn btn-dark py-2 px-3 btn-pill" style="float:right;margin-right:4%;margin-top:3%" href="plan.jsp">More Details</a>
     </div>
    </section><!-- End Pricing Section -->

    <!-- ======= Frequently Asked Questions Section ======= -->
    <section id="faq">
      <div class="container">
<!--Carousel Wrapper-->
			<div id="multi-item-example" class="carousel slide carousel-multi-item" data-ride="carousel">
				<h3 style="text-align:center;">Services</h3>
				
	  			<!--Slides-->
				<div class="carousel-inner" role="listbox">
			
					<%
						try{  
							ResultSet rs=ISPDao.get("service limit 0,4");
							 %>
							<!--First slide-->
							<div class="carousel-item active">
								<div class="row" style="margin-bottom:6%;">
								<% 
								while(rs.next()) {
								 	%>
									 <div class="col-lg-3 col-md-3 box wow fadeInRight">
								        <div class="card mb-3">
								          <img src="images/Service/<% out.print(rs.getString("simage")); %>" height="225px" width="225px" alt="">
							          <div class="card-body">
							            <h4 class="card-title"><% out.println(rs.getString("sname")); %></h4>
							            <p class="price"><% out.println(" Rs. "+rs.getString("sprice"));  %></p>
							            <a class="btn btn-dark py-2 px-3 btn-pill" href="addToCart.jsp?serid=<% out.print(rs.getInt("sid")); %>">Get Started</a>
								          </div>
								        </div>
								      </div>
									<%
									}
								%>
								</div>
							</div>
						<% 
							rs.close();  
						}
						catch(Exception e)
						{ 
							System.out.println(e);
						}
					%>
	
	    			<!--/.First slide-->
	    
					<%
					try{  
						ResultSet rs=ISPDao.get("service limit 4,4");
						%>
						<!--First slide-->
						<div class="carousel-item ">
							<div class="row" style="margin-bottom:6%;">
							<% 
								while(rs.next()) {
								%>
								 <div class="col-lg-3 col-md-3 box wow fadeInRight">
							        <div class="card mb-3">
							          <img src="images/Service/<% out.print(rs.getString("simage")); %>" height="225px" width="225px" alt="">
							          <div class="card-body">
							            <h4 class="card-title"><% out.println(rs.getString("sname")); %></h4>
							            <p class="price"><% out.println(" Rs. "+rs.getString("sprice"));  %></p>
							            <a class="btn btn-dark py-2 px-3 btn-pill" href="addToCart.jsp?serid=<% out.print(rs.getInt("sid")); %>">Get Started</a>
							          </div>
							        </div>
							      </div>
								<%
							}
							%>
							</div>
						</div>
						<%
						rs.close();  
					}
					catch(Exception e)
					{ 
						System.out.println(e);
					}
					%>

					<!--/.second slide-->
					<%
					try{  
						ResultSet rs=ISPDao.get("service limit 8,4");
						%>
						<!--First slide-->
						<div class="carousel-item ">
							<div class="row" style="margin-bottom:6%;">
							<% 
								while(rs.next()) {
								%>
								 <div class="col-lg-3 col-md-3 box wow fadeInRight">
							        <div class="card mb-3">
							          <img src="images/Service/<% out.print(rs.getString("simage")); %>" height="225px" width="225px" alt="">
							          <div class="card-body">
							            <h4 class="card-title"><% out.println(rs.getString("sname")); %></h4>
							            <p class="price"><% out.println(" Rs. "+rs.getString("sprice"));  %></p>
							            <a class="btn btn-dark py-2 px-3 btn-pill" href="addToCart.jsp?serid=<% out.print(rs.getInt("sid")); %>">Get Started</a>
							          </div>
							        </div>
							      </div>
								<%
								}
							%>
							</div>
						</div>
						<%
						rs.close();  
					}
					catch(Exception e)
					{ 
						System.out.println(e);
					}
					%>
	 			</div>
		  	<!--/.Slides-->
			</div>
		<a class="btn btn-dark py-2 px-3 btn-pill" style="float:right;margin-right:4%;margin-top:3%" href="service.jsp">More Details</a>
      </div>
    </section><!-- End Frequently Asked Questions Section -->

    <!-- ======= Team Section ======= -->
	<section id="team" class="section-bg">
	  <div class="container">
				<div id="multi-item-example" class="carousel slide carousel-multi-item" data-ride="carousel">
					<h3 style="text-align:center;">Products</h3>
					<div class="carousel-inner" role="listbox">			
						<%
							try{  
								ResultSet rs=ISPDao.get("product limit 0,4");
								 %>
								<!--First slide-->
								<div class="carousel-item active">
									<div class="row">
									<% 
									while(rs.next()) {
									 	%>
										 <div class="col-lg-3 col-md-3 box wow fadeInRight">
									        <div class="card mb-3">
								         		<img src="images/Product/<% out.print(rs.getString("prodimage")); %>" height="225px" width="225px" alt="">
									          	<div class="card-body">
									            <h4 class="card-title"><% out.println(rs.getString("prodname")); %></h4>
									            <p class="price"><% out.println(" Rs. "+rs.getString("prodprice"));  %></p>
									            <a class="btn btn-dark py-2 px-3 btn-pill" href="addToCart.jsp?prodid=<% out.print(rs.getInt("prodid")); %>">Get Started</a>
								          		</div>
								        	</div>
									     </div>
										<%
										}
									%>
									</div>
								</div>
							<% 
								rs.close();  
							}
							catch(Exception e)
							{ 
								System.out.println(e);
							}
						try{  
							ResultSet rs=ISPDao.get("product limit 4,4");
							%>
							<!--First slide-->
							<div class="carousel-item ">
								<div class="row">
								<% 
									while(rs.next()) {
									%>
									 <div class="col-lg-3 col-md-3 box wow fadeInRight">
								        <div class="card mb-3">
								         	<img src="images/Product/<% out.print(rs.getString("prodimage")); %>" height="225px" width="225px" alt="">
									          <div class="card-body">
									            <h4 class="card-title"><% out.println(rs.getString("prodname")); %></h4>
									            <p class="description"><% out.println(rs.getString("proddesc"));  %></p>
									            <p class="price"><% out.println(" Rs. "+rs.getString("prodprice"));  %></p>
									            <a class="btn btn-dark py-2 px-3 btn-pill" href="addToCart.jsp?prodid=<% out.print(rs.getInt("prodid")); %>">Get Started</a>
								          	</div>
								        </div>
								      </div>
									<%
								}
								%>
								</div>
							</div>
							<%
							rs.close();  
						}
						catch(Exception e)
						{ 
							System.out.println(e);
						}
						try{  
							ResultSet rs=ISPDao.get("product limit 8,4");
							%>
							<!--First slide-->
							<div class="carousel-item ">
								<div class="row">
								<% 
									while(rs.next()) {
									%>
									 <div class="col-lg-3 col-md-3 box wow fadeInRight">
								        <div class="card mb-3">
								         	<img src="images/Product/<% out.print(rs.getString("prodimage")); %>" height="225px" width="225px" alt="">
									          <div class="card-body">
									            <h4 class="card-title"><% out.println(rs.getString("prodname")); %></h4>
									            <p class="description"><% out.println(rs.getString("proddesc"));  %></p>
									            <p class="price"><% out.println(" Rs. "+rs.getString("prodprice"));  %></p>
									            <a class="btn btn-dark py-2 px-3 btn-pill" href="addToCart.jsp?prodid=<% out.print(rs.getInt("prodid")); %>">Get Started</a>
								          	</div>
								        </div>
								      </div>
									<%
									}
								%>
								</div>
							</div>
							<%
							rs.close();  
						}
						catch(Exception e)
						{ 
							System.out.println(e);
						}
						%>
		 			</div>
				</div>
		 	<a class="btn btn-dark py-2 px-3 btn-pill" style="float:right;margin-right:4%;margin-top:3%" href="products.jsp">More Details</a>
			</div>
	   </section><!-- #team -->


<!-- Central Modal Small -->
<div class="modal fade" id="centralModalSm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">

  <!-- Change class .modal-sm to change the size of the modal -->
  <div class="modal-dialog modal-lg" role="document">


    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title w-100" id="myModalLabel">Cart</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
	    <div class="row">
	    <div class="col-md-6">Name</div>
	    <div class="col-md-5">Price</div>
	    <div class="col-md-1"></div>
	    </div><hr> 
 <%
  	String cart=(String)session.getAttribute("add_to_cart");
 	String pname="";Double pprice=0.0;
 	String prodname="";Double prodprice=0.0;
 	String sname="";Double sprice=0.0;
 	int cart_total=0;
    Double total=0.0; 	
  if(cart!=null)
  {            	
	  cart=cart.trim();
	  String str[] = cart.split(" ");
List<String> al = new ArrayList<String>();
cart_total=al.size();
al = Arrays.asList(str);
      ListIterator<String> listItr = al.listIterator();
   		
      while(listItr.hasNext()) {
          String val=(String)listItr.next();
          if(val.contains("pid")){
        	  try{  
        		  	String[] id=val.split("-");                    		
        			 ResultSet rs=ISPDao.get("package where pid="+id[1]);
        			 if(rs.next()) {
        				 %>
        				 <div class="row">
				        <div class="col-md-6"><%=rs.getString("pname") %></div>
				        <div class="col-md-5"><%=rs.getDouble("price") %></div>
				         <div class="col-md-1"><a href="cancel.jsp?id=<%="pid-"+rs.getString("pid") %>"><i class="fa fa-times"></i></a></div>
				        </div> <hr>
        				 <%
        				 total=total+Double.parseDouble(rs.getString("price"));
        				
        			}
         			rs.close();  
         			}catch(Exception e){ System.out.println(e);}
          	} 
          if(val.contains("prod")){
          	  try{  
      		  	String[] id=val.split("-");                  		
      			 ResultSet rs=ISPDao.get("product where prodid="+id[1]);
        			 while(rs.next()) {
        				 %>
        				 <div class="row">
				        <div class="col-md-6"><%=rs.getString("prodname") %></div>
				        <div class="col-md-5"> <%=rs.getDouble("prodprice") %> </div>
				         <div class="col-md-1"><a href="cancel.jsp?id=<%="prod-"+rs.getString("prodid") %>"><i class="fa fa-times"></i></a></div>
				        </div> <hr>
        				 <%
        				 total=total+Double.parseDouble(rs.getString("prodprice"));
        			
        			}
       			rs.close();  
       			}
          	  catch(Exception e){ System.out.println(e);}
        	}
          if(val.contains("ser")){
          	  try{  
          		  
      		  	String[] id=val.split("-");                  			
      			 ResultSet rs=ISPDao.get("service where sid="+id[1]);
        			 while(rs.next()) {
        				 %>
        				  <div class="row">
					        <div class="col-md-6"> <%=rs.getString("sname") %></div>
					        <div class="col-md-5"><%=rs.getDouble("sprice") %></div>
					         <div class="col-md-1"><a href="cancel.jsp?id=<%="ser-"+rs.getString("sid") %>"><i class="fa fa-times"></i></a> </div>
					        </div>  <hr>
        				 <%
        				 total=total+Double.parseDouble(rs.getString("sprice"));
        				
        			}
       			rs.close();  
       			}
          	  catch(Exception e){ System.out.println(e);}
        	} 
     	}    		
  }
  %>
		<div class="row">
        <div class="col-md-6">Total</div>
        <div class="col-md-6"><%=total %></div>
        </div>
      </div>
      <div class="modal-footer">
        <a class="btn btn-secondary clear-cart py-2 px-3  btn-pill" href="cart.jsp">Clear All</a>
        <a  class="btn btn-primary py-2 px-3  btn-pill" href="checkout.jsp">Check Out</a>
      </div>
    </div>
  </div>
</div>
<!-- Central Modal Small -->

   <!-- ======= Contact Section ======= -->
    <section id="contact">
     <div class="container">
      <div class="row wow fadeInUp">

          <div class="col-lg-4 col-md-4">
            <div class="contact-about">
             <div class="contact-about">
              <h4>Testimonials</h4>
              <p>Quote testimonials are ads or artwork that display positive statements made about your company from a brand evangelist or a highly satisfied customer. The quote is usually accompanied by an image of the person being quoted to make the message feel more relatable to the target audience.</p>            
            </div>
            </div>
          </div>
          
           <div class="col-lg-4 col-md-4">
            <div class="contact-about">
              <h4>Privacy Policy</h4>
              <p>A privacy policy is a statement or a legal document (in privacy law) that discloses some or all of the ways a party gathers, uses, discloses, and manages a customer or client's data.	</p>            
            </div>
          </div>  

          <div class="col-lg-4 col-md-4">
            <div class="info">
              <div>
                <i class="ion-ios-location-outline"></i>
                <p>A108 Adam Street<br>New York, NY 535022</p>
              </div>

              <div>
                <i class="ion-ios-email-outline"></i>
                <p>info@example.com</p>
              </div>

              <div>
                <i class="ion-ios-telephone-outline"></i>
                <p>+1 5589 55488 55s</p>
              </div>

            </div>
          </div>
        </div>
       <div class="row wow fadeInUp">

          <div class="col-lg-3 col-md-4">
            <div class="contact-about"></div>
          </div>

          <div class="col-lg-6 col-md-8">
            <div class="form">
              <form action="forms/contact.php" method="post" role="form" class="php-email-form">
                <div class="form-row">
                  <div class="form-group col-lg-6">
                    <input type="text" name="name" class="form-control" id="name" placeholder="Your Name" data-rule="minlen:4" data-msg="Please enter at least 4 chars">
                    <div class="validate"></div>
                  </div>
                  <div class="form-group col-lg-6">
                    <input type="email" class="form-control" name="email" id="email" placeholder="Your Email" data-rule="email" data-msg="Please enter a valid email">
                    <div class="validate"></div>
                  </div>
                </div>
                <div class="form-group">
                  <input type="text" class="form-control" name="subject" id="subject" placeholder="Subject" data-rule="minlen:4" data-msg="Please enter at least 8 chars of subject">
                  <div class="validate"></div>
                </div>
                <div class="form-group">
                  <textarea class="form-control" name="message" rows="5" data-rule="required" data-msg="Please write something for us" placeholder="Message"></textarea>
                  <div class="validate"></div>
                </div>
                <div class="mb-3">
                  <div class="loading">Loading</div>
                  <div class="error-message"></div>
                  <div class="sent-message">Your message has been sent. Thank you!</div>
                </div>
                <div class="text-center"><button type="submit" title="Send Message">Send Message</button></div>
              </form>
            </div>
          </div>
          
          <div class="col-lg-3 col-md-4">
            <div class="info"></div>
          </div>

        </div>
   
     </div>
    </section><!-- End Contact Section -->

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer">
    <div class="container">
      <div class="row">
        <div class="col-lg-6 text-lg-left text-center">
          <div class="copyright">
            &copy; Copyright <strong>ISP</strong>. All Rights Reserved
          </div>
        </div>
    
      </div>
    </div>
  </footer><!-- End  Footer -->



<jsp:include page="script.jsp"/>

</body>

</html>