<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Technician.*"%>

<!DOCTYPE html>
<html>
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
                                    <h2 class="title-1">Customer Details</h2>
                                </div>
                            </div>
                        </div>
                    	 <div class="row" style="padding-top:1%;padding-bottom:1%;">
                            <div class="col-lg-12">
                                <div class="au-card recent-report">
                                    <div class="au-card-inner" >
                                       <div class="row" style="margin:6%">
											<div class="col-md-2"></div>
								            <%
								              	String cid=(String)request.getParameter("cid");
								            	try{  
								  					ResultSet rs=TechDao.get("select * from customer_details where cid="+cid);
								  				 	if(rs.next()) {
								  				 	%>									  				
								  					<div class="col-md-3">
														<img height=225px width=225px src="../images/Customer/<% out.print(rs.getString("cidproof")); %>" alt="">														
													</div>
													<div class="col-md-5" style="margin:3%">
														<h4>Name :- <% out.print(rs.getString("cfname")+" "+ rs.getString("cmname")+" "+ rs.getString("clname"));%></h4> 
													  	<h4>Email :- <% out.print(rs.getString("cemail"));%></h4> 
													  	<h4>Contact No. :- <% out.print(rs.getString("cphone"));%></h4> 
													  	<h4> Flat No. <%=rs.getString("cflat")+ ", "+rs.getString("cbuilding")+ ", "+rs.getString("cstreet")+ ", "+rs.getString("ccity")+", "+rs.getString("ctaluka") %></h4>
													  	<h4>Landmark :- <%=rs.getString("clandmark") %></h4>
													  	<h4>Pin Code :- <%=rs.getString("cpincode") %></h4>				
												  	</div>												
								  				 	<%  				 				
									  			 	}									  			 
									  				rs.close();  
									  				}catch(Exception e){ System.out.println(e);}
								            %>									
											<div class="col-md-2"></div>
									 		<a class="btn btn-primary" href="requestStatus.jsp?cid=<%=cid%>">Update Status</a>
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

