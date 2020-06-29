<!-- HEADER MOBILE-->
        <header class="header-mobile d-block d-lg-none">
            <div class="header-mobile__bar">
                <div class="container-fluid">
                    <div class="header-mobile-inner">
                        <a class="logo" href="index.jsp">
                            <img src="images/icon/logo.png" alt="CoolAdmin" />
                        </a>
                        <button class="hamburger hamburger--slider" type="button">
                            <span class="hamburger-box">
                                <span class="hamburger-inner"></span>
                            </span>
                        </button>
                    </div>
                </div>
            </div>
            <nav class="navbar-mobile">
                <div class="container-fluid">
                    <ul class="navbar-mobile__list list-unstyled">
                        <li class="has-sub">
                            <a class="js-arrow" href="index.jsp">
                                <i class="fas fa-tachometer-alt"></i>Dashboard</a>
                        </li>
                         <li>
                            <a href="viewemp.jsp?page=1">
                               <i class="fas fa-male"></i>Manage Employee</a>
                        </li>                        
                        <li>
                            <a href="viewservice.jsp">
                                <i class="fab fa-servicestack"></i>Manage Services</a>
                        </li>                       
                        <li>
                            <a href="viewpackage.jsp">
                               <i class="fas fa-cube"></i>Manage Packages</a>
                        </li>
                       
                         <li>
                            <a href="technician.jsp?page=1">
                               <i class="fas fa-male"></i>Manage Technician</a>
                        </li>
                         <li>
                            <a href="viewuser.jsp?page=1">
                            <i class="fas fa-male"></i>Manage User</a>
                        </li>
                         <li>
                            <a href="viewproduct.jsp">
                               <i class="fab fa-product-hunt"></i>Manage Product</a>
                        </li>                      
                        <li>
                            <a href="support.jsp?page=1">
                               <i class="fas fa-ticket-alt"></i>Support Ticket</a>
                        </li>
                         <li>
                            <a href="acceptreq.jsp?page=1">
                               <i class="fas fa-envelope"></i>Accepted Request</a>
                        </li>
                        <li class="has-sub">
                            <a class="js-arrow" href="#">
                                <i class="fas fa-envelope-square"></i>Reports</a>
                            <ul class="navbar-mobile-sub__list list-unstyled js-sub-list">
                                <li>
                                    <a href="empreports.jsp">Employee</a>
                                </li>
                                <li>
                                    <a href="techreports.jsp">Technician</a>
                                </li>
                                <li>
                                    <a href="userreports.jsp">User</a>
                                </li>
                                <li>
                                    <a href="paymentreports.jsp">Payment</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        <!-- END HEADER MOBILE-->