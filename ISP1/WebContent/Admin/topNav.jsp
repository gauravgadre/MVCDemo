 <%@page import="java.sql.ResultSet"%>
<%@page import="Admin.DbHelper"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%
Connection con=DbHelper.getConnection();
Statement stmt=con.createStatement();
ResultSet rs=stmt.executeQuery("select * from adminlogin where email='"+session.getAttribute("user")+"'");
if(rs.next())
{
%>

  <!-- HEADER DESKTOP-->
            <header class="header-desktop">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="header-wrap">
                            <form class="form-header" action="" method="POST">
                                <input class="au-input au-input--xl" type="hidden" name="search" placeholder="Search for datas &amp; reports..." />                               
                            </form>
                            <div class="header-button">
                               <div class="account-wrap">
                                    <div class="account-item clearfix js-item-menu">
                                        <div class="image">
                                           
                                        </div>
                                        <div class="content">
                                            <a class="js-acc-btn" href="#"><%=rs.getString("aname")%></a>
                                        </div>
                                        <div class="account-dropdown js-dropdown">
                                            <div class="info clearfix">
                                                <div class="image">
                                                    <a href="#">
                                                        
                                                    </a>
                                                </div>
                                                <div class="content">
                                                    <h5 class="name">
                                                        <a href="#"><%=rs.getString("aname")%></a>
                                                    </h5>
                                                    <span class="email"><%=rs.getString("email") %></span>
                                                </div>
                                            </div>    
                                             <div class="account-dropdown__body">
                                                <div class="account-dropdown__item">
                                                    <a href="adminprofile.jsp">
                                                        <i class="zmdi zmdi-account"></i>Profile</a>
                                                </div>
                                            </div>                                   
                                            <div class="account-dropdown__footer">
                                                <a href="adminlogout">
                                                    <i class="zmdi zmdi-power"></i>Logout</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            <!-- HEADER DESKTOP-->
            <%	
}
%>