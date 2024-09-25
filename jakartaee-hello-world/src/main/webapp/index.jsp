
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<!doctype html>
<html class="no-js" lang="en">

    <head>
        <!-- meta data -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <!--font-family-->
        <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

        <link href="https://fonts.googleapis.com/css?family=Rufina:400,700" rel="stylesheet">
        
        <!-- title of site -->
        <title>FARAJ's cars</title>

        <!-- For favicon png -->
        <link rel="shortcut icon" type="image/icon" href="assets/logo/favicon.png"/>
       
        <!--font-awesome.min.css-->
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">

        <!--linear icon css-->
        <link rel="stylesheet" href="assets/css/linearicons.css">

        <!--flaticon.css-->
        <link rel="stylesheet" href="assets/css/flaticon.css">

        <!--animate.css-->
        <link rel="stylesheet" href="assets/css/animate.css">

        <!--owl.carousel.css-->
        <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
        <link rel="stylesheet" href="assets/css/owl.theme.default.min.css">
        
        <!--bootstrap.min.css-->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        
        <!-- bootsnav -->
        <link rel="stylesheet" href="assets/css/bootsnav.css" > 
        
        <!--style.css-->
        <link rel="stylesheet" href="assets/css/style.css">
        
        <!--responsive.css-->
        <link rel="stylesheet" href="assets/css/responsive.css">
        
        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
            <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>
    
    <body>
        <!--[if lte IE 9]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
        <![endif]-->
    
        <!--welcome-hero start -->
        <section id="home" class="welcome-hero">

            <!-- top-area Start -->
            <div class="top-area">
                <div class="header-area">
                    <!-- Start Navigation -->
                    <nav class="navbar navbar-default bootsnav  navbar-sticky navbar-scrollspy"  data-minus-value-desktop="70" data-minus-value-mobile="55" data-speed="1000">

                        <div class="container">

                            <!-- Start Header Navigation -->
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-menu">
                                    <i class="fa fa-bars"></i>
                                </button>
                                <a class="navbar-brand" href="index.html">FARAJ's cars<span></span></a>

                            </div><!--/.navbar-header-->
                            <!-- End Header Navigation -->

                            <!-- Collect the nav links, forms, and other content for toggling -->
                            <div class="collapse navbar-collapse menu-ui-design" id="navbar-menu">
                                <ul class="nav navbar-nav navbar-right" data-in="fadeInDown" data-out="fadeOutUp">
                                    <li class=" scroll active"><a href="#home">home</a></li>
                                    <li ><a href="Login.jsp">service</a></li>
                                    <li class="scroll"><a href="#featured-cars">featured cars</a></li>
                                    <li class="scroll"><a href="#new-cars">new cars</a></li>
                                    <li class="scroll"><a href="#brand">brands</a></li>
                                    <li class="scroll"><a href="#contact">contact</a></li>
                                </ul><!--/.nav -->
                            </div><!-- /.navbar-collapse -->
                        </div><!--/.container-->
                    </nav><!--/nav-->
                    <!-- End Navigation -->
                </div><!--/.header-area-->
                <div class="clearfix"></div>

            </div><!-- /.top-area-->
            <!-- top-area End -->

            <div class="container">
                <div class="welcome-hero-txt">
                    <h2>get your desired car in resonable price</h2>
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore   magna aliqua. 
                    </p>
                    <button class="welcome-btn" onclick="window.location.href='#'">contact us</button>
                </div>
            </div>


        </section><!--/.welcome-hero-->
        <!--welcome-hero end -->

        
        <!--new-cars start -->
        <section id="new-cars" class="new-cars">
            <div class="container">
                <div class="section-header">
                    <p>checkout <span>the</span> latest cars</p>
                    <h2>newest cars</h2>
                </div><!--/.section-header-->
                <div class="new-cars-content">
                    <div class="owl-carousel owl-theme" id="new-cars-carousel">
                        <div class="new-cars-item">
                            <div class="single-new-cars-item">
                                <div class="row">
                                    <div class="col-md-7 col-sm-12">
                                        <div class="new-cars-img">
                                            <img src="assets/images/new-cars-model/ncm1.png" alt="img"/>
                                        </div><!--/.new-cars-img-->
                                    </div>
                                    <div class="col-md-5 col-sm-12">
                                        <div class="new-cars-txt">
                                            <h2><a href="#">chevrolet camaro <span> za100</span></a></h2>
                                            <p>
                                                Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. 
                                            </p>
                                            <p class="new-cars-para2">
                                                Sed ut pers unde omnis iste natus error sit voluptatem accusantium doloremque laudantium. 
                                            </p>
                                            <button class="welcome-btn new-cars-btn" onclick="window.location.href='#'">
                                                view details
                                            </button>
                                        </div><!--/.new-cars-txt--> 
                                    </div><!--/.col-->
                                </div><!--/.row-->
                            </div><!--/.single-new-cars-item-->
                        </div><!--/.new-cars-item-->
                        <div class="new-cars-item">
                            <div class="single-new-cars-item">
                                <div class="row">
                                    <div class="col-md-7 col-sm-12">
                                        <div class="new-cars-img">
                                            <img src="assets/images/new-cars-model/ncm2.png" alt="img"/>
                                        </div><!--/.new-cars-img-->
                                    </div>
                                    <div class="col-md-5 col-sm-12">
                                        <div class="new-cars-txt">
                                            <h2><a href="#">BMW series-3 wagon</a></h2>
                                            <p>
                                                Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. 
                                            </p>
                                            <p class="new-cars-para2">
                                                Sed ut pers unde omnis iste natus error sit voluptatem accusantium doloremque laudantium. 
                                            </p>
                                            <button class="welcome-btn new-cars-btn" onclick="window.location.href='#'">
                                                view details
                                            </button>
                                        </div><!--/.new-cars-txt--> 
                                    </div><!--/.col-->
                                </div><!--/.row-->  
                            </div><!--/.single-new-cars-item-->
                        </div><!--/.new-cars-item-->
                        <div class="new-cars-item">
                            <div class="single-new-cars-item">
                                <div class="row">
                                    <div class="col-md-7 col-sm-12">
                                        <div class="new-cars-img">
                                            <img src="assets/images/new-cars-model/ncm3.png" alt="img"/>
                                        </div><!--/.new-cars-img-->
                                    </div>
                                    <div class="col-md-5 col-sm-12">
                                        <div class="new-cars-txt">
                                            <h2><a href="#">ferrari 488 superfast</a></h2>
                                            <p>
                                                Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. 
                                            </p>
                                            <p class="new-cars-para2">
                                                Sed ut pers unde omnis iste natus error sit voluptatem accusantium doloremque laudantium. 
                                            </p>
                                            <button class="welcome-btn new-cars-btn" onclick="window.location.href='#'">
                                                view details
                                            </button>
                                        </div><!--/.new-cars-txt--> 
                                    </div><!--/.col-->
                                </div><!--/.row-->
                            </div><!--/.single-new-cars-item-->
                        </div><!--/.new-cars-item-->
                    </div><!--/#new-cars-carousel-->
                </div><!--/.new-cars-content-->
            </div><!--/.container-->

        </section><!--/.new-cars-->
        <!--new-cars end -->

        <!--featured-cars start -->
        <section id="featured-cars" class="featured-cars">
            <div class="container">
                <div class="section-header">
                    <p>checkout <span>the</span> featured cars</p>
                    <h2>featured cars</h2>
                </div><!--/.section-header-->
                <div class="featured-cars-content">
                    <div class="row">
                     <%
               
               
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehiculedb", "root", "");
                ResultSet rs = con.createStatement().executeQuery("SELECT id_vehicule, nom,category,prix,modele,image,type , puissance FROM `vehicule`");
                while (rs.next()) {
                %>
               
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="single-featured-cars">
                                <div class="featured-img-box">
                                    <div class="featured-cars-img">
                                        <img src="<%=rs.getString("image") %>" alt="cars">
                                    </div>
                                    <div class="featured-model-info">
                                        <p>
                                            model:<%=rs.getString("modele") %>
                                            <span class="featured-mi-span"> <%=rs.getString("category") %></span> 
                                            <span class="featured-hp-span"> <%=rs.getString("type") %></span>
                                            <%=rs.getString("modele") %>
                                        </p>
                                    </div>
                                </div>
                                <div class="featured-cars-txt">
                                    <h2><a href="#"><%=rs.getString("nom") %></a></h2>
                                    <h3><%=rs.getString("prix") %></h3>
                                    <p>
                                        
                                    </p>
                                </div>
                            </div>
                        </div>
                        
<%} %>
        </section><!--/.featured-cars-->
        <!--featured-cars end -->

        

        <!--brand strat -->
        <section id="brand"  class="brand">
            <div class="container">
                <div class="brand-area">
                    <div class="owl-carousel owl-theme brand-item">
                        <div class="item">
                            <a href="#">
                                <img src="assets/images/brand/br1.png" alt="brand-image" />
                            </a>
                        </div><!--/.item-->
                        <div class="item">
                            <a href="#">
                                <img src="assets/images/brand/br2.png" alt="brand-image" />
                            </a>
                        </div><!--/.item-->
                        <div class="item">
                            <a href="#">
                                <img src="assets/images/brand/br3.png" alt="brand-image" />
                            </a>
                        </div><!--/.item-->
                        <div class="item">
                            <a href="#">
                                <img src="assets/images/brand/br4.png" alt="brand-image" />
                            </a>
                        </div><!--/.item-->

                        <div class="item">
                            <a href="#">
                                <img src="assets/images/brand/br5.png" alt="brand-image" />
                            </a>
                        </div><!--/.item-->

                        <div class="item">
                            <a href="#">
                                <img src="assets/images/brand/br6.png" alt="brand-image" />
                            </a>
                        </div><!--/.item-->
                    </div><!--/.owl-carousel-->
                </div><!--/.clients-area-->

            </div><!--/.container-->

        </section><!--/brand--> 
        <!--brand end -->

        <!--blog start -->
        <section id="blog" class="blog"></section><!--/.blog-->
        <!--blog end -->

        <!--contact start-->
        

        
        <!-- Include all js compiled plugins (below), or include individual files as needed -->

        <script src="assets/js/jquery.js"></script>
        
        <!--modernizr.min.js-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"></script>
        
        <!--bootstrap.min.js-->
        <script src="assets/js/bootstrap.min.js"></script>
        
        <!-- bootsnav js -->
        <script src="assets/js/bootsnav.js"></script>

        <!--owl.carousel.js-->
        <script src="assets/js/owl.carousel.min.js"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>

        <!--Custom JS-->
        <script src="assets/js/custom.js"></script>
        
    </body>
    
</html>