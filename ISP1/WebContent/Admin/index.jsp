<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="Admin.DbHelper"%>
<!DOCTYPE html>
<html>
	<head>
		<jsp:include page="link.jsp" />
	</head>
	<body>
	<% 
	 response.setHeader("Cache-Control","no-cache");
    response.setHeader("Cache-Control","no-store");
    
	if(session.getAttribute("user")==null)
		response.sendRedirect("../login.jsp");
	Connection connection=null;
		Statement stmt=null;
		int total=0;
		int total_package=0;
		int total_connection=0;
		Double total_earning=0.0;
			try {
				  connection=(Connection) DbHelper.getConnection(); 
			 stmt = (Statement) connection.createStatement();  
		    ResultSet rs = stmt.executeQuery("select count(*) as total from customer_details ");
		    if(rs.next())
		    {
		    	total=rs.getInt("total");
			}
		   ResultSet rs2 = stmt.executeQuery("select count(*) as total from package ");
		    if(rs2.next())
		    {
		    	total_package=rs2.getInt("total");
			}
		    ResultSet rs3 = stmt.executeQuery("select count(*) as total from connection_details where activation_date >=DATE_SUB(CURDATE(),INTERVAL 7 DAY)");
		    if(rs3.next())
		    {
		    	total_connection=rs3.getInt("total");
			}
		    ResultSet rs4 = stmt.executeQuery("select price from package,request where package.pid=request.pid and rstatus=4");
		    while(rs4.next())
		    {
		    	total_earning+=rs4.getDouble("price");
			}
			}
			
            catch(Exception e)
   			{
   				System.out.print(e.toString());
   			}
		%>
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
	                                    <h2 class="title-1">overview</h2>
	                                    <button class="au-btn au-btn-icon au-btn--blue">
	                                        <i class="zmdi zmdi-plus"></i>add item</button>
	                                </div>
	                            </div>
	                        </div>
	                        <div class="row m-t-25">
	                            <div class="col-sm-6 col-lg-3">
	                                <div class="overview-item overview-item--c1">
	                                    <div class="overview__inner">
	                                        <div class="overview-box clearfix">
	                                            <div class="icon">
	                                                <i class="zmdi zmdi-account-o"></i>
	                                            </div>
	                                            <div class="text">
	                                                <h2><%=total %></h2>
	                                                <span>Total Customers</span>
	                                            </div>
	                                        </div>
	                                        <div class="overview-chart">
	                                            <canvas id="widgetChart1"></canvas>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="col-sm-6 col-lg-3">
	                                <div class="overview-item overview-item--c2">
	                                    <div class="overview__inner">
	                                        <div class="overview-box clearfix">
	                                            <div class="icon">
	                                                <i class="zmdi zmdi-shopping-cart"></i>
	                                            </div>
	                                            <div class="text">
	                                                <h2><%=total_package %></h2>
	                                                <span>Total Packages</span>
	                                            </div>
	                                        </div>
	                                        <div class="overview-chart">
	                                            <canvas id="widgetChart2"></canvas>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="col-sm-6 col-lg-3">
	                                <div class="overview-item overview-item--c3">
	                                    <div class="overview__inner">
	                                        <div class="overview-box clearfix">
	                                            <div class="icon">
	                                                <i class="zmdi zmdi-calendar-note"></i>
	                                            </div>
	                                            <div class="text">
	                                                <h3 style="color:#fff;"><%=total_connection %> Connect</h3>
	                                                <span>In Week</span>
	                                            </div>
	                                        </div>
	                                        <div class="overview-chart">
	                                            <canvas id="widgetChart3"></canvas>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="col-sm-6 col-lg-3">
	                                <div class="overview-item overview-item--c4">
	                                    <div class="overview__inner">
	                                        <div class="overview-box clearfix">
	                                            <div class="icon">
	                                                <i class="zmdi zmdi-money"></i>
	                                            </div>
	                                            <div class="text">
	                                                <h2><%=total_earning %></h2>
	                                                <span>total earnings</span>
	                                            </div>
	                                        </div>
	                                        <div class="overview-chart">
	                                            <canvas id="widgetChart4"></canvas>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                        <div class="row">
	                            <div class="col-lg-12">
	                                <h2 class="title-1 m-b-25">Earnings By Packages</h2>
	                                <div class="table-responsive table--no-card m-b-40">
	                                    <table class="table table-borderless table-striped table-earning">
	                                        <thead>
	                                            <tr>
	                                                <th>Package Name</th>
	                                                <th class="text-right">price</th>
	                                                <th class="text-right">Total Customer</th>
	                                                <th class="text-right">total</th>
	                                            </tr>
	                                        </thead>
	                                        <tbody>
	                                        <%
	                                        try {
	                             			connection=(Connection) DbHelper.getConnection(); 
	                             			stmt = (Statement) connection.createStatement();
	                             			int total_cust=0;
	                             			int pid=0;
	                             			Double price=0.0;
	                             		    ResultSet rs = stmt.executeQuery("select * from package");
	                             		    while(rs.next())
	                             		    {
	                             		   	ResultSet rs1 = stmt.executeQuery("select count(cid) as total,pname,price from package p,connection_details c where c.pid=p.pid and c.pid="+rs.getInt("pid"));
	                             		   if(rs1.next()){
	                             		    	%>
	                             		    	<tr>
	                                                <td><%=rs1.getString("pname") %></td>
	                                                <td class="text-right"><%=rs1.getDouble("price") %></td>
	                             		    		<td class="text-right"><%=rs1.getInt("total") %></td>
	                             		    		<td class="text-right"><%=rs1.getInt("total")*rs1.getDouble("price") %></td>
	                                            </tr>
	                             		    		<%
	                             		    	}
	                             		    	
	                             		    }
	                             		  
	                             		    
	                             		    }
	                                        catch(Exception e)
	                               			{
	                               				System.out.print(e.toString());
	                               			}
	                                        
	                                        %>
	                                            
	                                                
	                                                
	                                        </tbody>
	                                    </table>
	                                </div>
	                            </div>
	                         </div>
	                        <jsp:include page="footer.jsp"/> 
	                    </div>
	                </div>
	            </div>
	            <!-- END MAIN CONTENT-->
	          
	        </div>
	        <!-- END PAGE CONTAINER-->
		</div>
		<jsp:include page="script.jsp" /> 
	</body>
</html>