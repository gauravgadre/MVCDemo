<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Technician.*"%>

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
                                    <h2 class="title-1">Manage Profile</h2>
                                    <a class="au-btn au-btn-icon au-btn--blue" href="update_Tpassword.jsp"><i class="fa fa-edit (alias)"></i>Update Password</a>
                                 </div>
                            </div>
                        </div>
                    	 <div class="row" style="padding-top:1%;padding-bottom:1%;">
                            <div class="col-lg-12">
                                <div class="au-card recent-report">
                                    <div class="au-card-inner" >                                    
                                    	<%
	              		try{  
	              		String temail=(String)session.getAttribute("temail");
	          			ResultSet rs=TechDao.get("select * from technician where temail='"+temail+"'");
	          			
	          			 if(rs.next()) {
	          				 %>
	          				
	          						<div class="col-md-2">
									  <img height=225px width=225px src="../images/Technician/<% out.print(rs.getString("tidproof")); %>" alt="">
									</div>
									<div class="col-md-4">
									Name :- <% out.print(rs.getString("tfname")+" "+ rs.getString("tmname")+" "+ rs.getString("tlname"));%><br> 
								  	Email :- <% out.print(rs.getString("temail"));%><br> 
								  	Contact No :- <% out.print(rs.getString("tphone"));%><br> 
								  	Gender :- <% out.print(rs.getString("tgender"));%><br>								  	
								  	Address :- <% out.print(rs.getString("taddress"));%><br> 
								  	Birth Date :- <% out.print(rs.getString("tdob"));%><br> 
								  	</div> 
	          				 	
	        				
	          				 <%  				 				
	          			 }
	          			 
	          			rs.close();  
	          			}catch(Exception e){ System.out.println(e);}
	              	 
	              	 
	              	 %>
                                    
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


