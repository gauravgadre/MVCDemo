<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Technician.*"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<!DOCTYPE html>
<html>
	<head>
		<jsp:include page="head.jsp" />
	</head>
	<body class="animsition">
<%	
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
if(session.getAttribute("temail")==null){
	response.sendRedirect("../login.jsp");
}
%>
<%
	String email=(String)session.getAttribute("temail");
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	LocalDateTime today = LocalDateTime.now();
	String current= formatter.format(today);
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
	                                    <h2 class="title-1">Overview</h2>
	                                </div>
	                            </div>
	                        </div>
	                       <div class="row">
	                            <div class="col-lg-6">
	                                <div class="au-card au-card--no-shadow au-card--no-pad m-b-40">
	                                    <div class="au-card-title" style="background-image:url('images/bg-title-01.jpg');">
	                                        <div class="bg-overlay bg-overlay--blue"></div>
	                                        <h3>
	                                            <i class="zmdi zmdi-account-calendar"></i>Todays Request</h3>
	                                        
	                                    </div>	                                    
	                                    	<%
	                                    	ResultSet res=TechDao.get("select * from technician where temail='"+session.getAttribute("temail")+"'");
	                                    	if(res.next()){
	                                    		%>
	                                    		  <div class="au-task js-list-load">
	                                        <div class="au-task__title">
	                                            <p>Tasks for <%=res.getString("tfname")+" "+res.getString("tlname") %></p>
	                                        </div>
	                                        <div class="au-task-list js-scrollbar3">
	                                        
	                                    		<%
	                                    	}
	                                    	
	                                    String startcurrent=current+" 00:00:00";
	                                	String endcurrent=current+" 23:59:59";
	                                	String sql="SELECT c.cid,c.cfname,c.cmname,c.clname,c.cemail,c.cphone,c.ccity,t.tfname,t.tlname,a.set_connection_date from allot_technician a,customer_details c,request r,technician t where a.rid=r.rid and r.cid=c.cid and t.tid=a.tid and t.temail='"+email+"' and a.set_connection_date >= '"+current+"' and a.set_connection_date <= '"+endcurrent+"' and r.rstatus!=4 LIMIT 0,4" ;	
	                                	ResultSet rs=TechDao.get(sql);
	                                    while(rs.next())
	                                    {
	                                    	%>	                                  
	                                            <div class="au-task__item au-task__item--danger">
	                                                <div class="au-task__item-inner">
	                                                    <h5 class="task">
	                                                       <%=rs.getString("cfname")+" "+rs.getString("cmname")+" "+rs.getString("clname") %>
	                                                    </h5>
	                                                    <h6>
	                                                    <%=rs.getString("ccity") %>
	                                                    </h6>
	                                                    <span class="time"><%=rs.getString("a.set_connection_date") %></span>
	                                                </div>
	                                            </div>	                                         
	                                    <%
	                                    }	                                    
	                                    %>
	                                      </div>
	                                        <div class="au-task__footer">
	                                            <button class="au-btn au-btn-load js-load-btn">load more</button>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="col-lg-6">
	                                <div class="au-card au-card--no-shadow au-card--no-pad m-b-40">
	                                    <div class="au-card-title" style="background-image:url('images/bg-title-02.jpg');">
	                                        <div class="bg-overlay bg-overlay--blue"></div>
	                                        <h3>
	                                            <i class="zmdi zmdi-comment-text"></i>Pending Request</h3>
	                                        
	                                    </div>
	                                      <div class="au-inbox-wrap js-inbox-wrap">
	                                        <div class="au-message js-list-load">
	                                    <%
	                                    String sql1="select COUNT(*) as total from request r,allot_technician a, technician t where a.rid=r.rid and t.tid=a.tid and temail='"+email+"' and r.rstatus=1 ";
	                                	String sql2="SELECT c.cid,c.cfname,c.cmname,c.clname,c.cemail,c.cphone,c.ccity,t.tfname,t.tlname,a.set_connection_date from allot_technician a,customer_details c,request r,technician t where a.rid=r.rid and r.cid=c.cid and t.tid=a.tid and t.temail='"+email+"' and r.rstatus=1 LIMIT 0,4" ;	
	                                    ResultSet rs1=TechDao.get(sql1);
	                                    ResultSet rs2=TechDao.get(sql2);
	                                	if(rs1.next()){
	                                		%>
	                                		<div class="au-message__noti">
	                                                <p>You Have
	                                                    <span><%=rs1.getString("total") %></span>	
	                                                   Pending Request
	                                                </p>
	                                            </div>
	                                		<%
	                                	}
	                                	%>
	                                	 <div class="au-message-list">
	                                              
	                                	<%
	                                    while(rs2.next())
	                                    {
	                                    	%>
	                                             <div class="au-message__item unread">
	                                                    <div class="au-message__item-inner">
	                                                        <div class="au-message__item-text">
	                                                            <div class="text">
	                                                                <h5 class="name">  <%=rs2.getString("cfname")+" "+rs2.getString("cmname")+" "+rs2.getString("clname") %></h5>
	                                                                <p> <%=rs2.getString("ccity") %></p>
	                                                            </div>
	                                                        </div>
	                                                        
	                                                    </div>
	                                                </div>
	                                               
	                                                <%
	                                    }
	                                                %>
	                                             </div>    
	                                            <div class="au-message__footer">
	                                                <button class="au-btn au-btn-load js-load-btn">load more</button>
	                                            </div>
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
	        </div>
	        <!-- END PAGE CONTAINER-->
		</div>
		<jsp:include page="script.jsp" />
	</body>
</html>