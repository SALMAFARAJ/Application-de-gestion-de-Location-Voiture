<%@page import="database.Utilconx"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="database.Utilconx.*" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>FARAJ'S CARS</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.svg" />

<link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

		<link href="https://fonts.googleapis.com/css?family=Rufina:400,700" rel="stylesheet">
        
        
    <!-- ========================= CSS here ========================= -->
    <link rel="stylesheet" href="assets/css/bootstrap.min_1.css" />
    <link rel="stylesheet" href="assets/css/LineIcons.3.0.css" />
    <link rel="stylesheet" href="assets/css/tiny-slider.css" />
    <link rel="stylesheet" href="assets/css/glightbox.min.css" />
    <link rel="stylesheet" href="assets/css/main.css" />
<style>
    .custom-navbar {
      background-color: #5026d8;
    }
 
  </style>

<body>

<nav class="navbar navbar-expand-lg custom-navbar">

  <div class="container-fluid" >
    <a class="navbar-brand" href="#"><img alt="" src="assets/images/profil (3).png"></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="index.jsp"><img alt="" src="assets/images/accueil.png"></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="panier.jsp"><img alt="" src="assets/images/sac-de-courses.png"></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="historique.jsp" >
          <img alt="" src="assets/images/historique-des-transactions (1).png">
          </a>
          </li>
       
       
      </ul>
      <form class="d-flex" role="search">
        <input class="form-control me-2" type="search" placeholder="Search" name="nom"aria-label="Search">
        <input name="search" class="btn btn-outline-success"  type="submit" value="Search" style="background-color: white;">
      </form>
    </div>
  </div>
</nav>
 <section class="trending-product section" style="margin-top: 9px;">
   
   <!--  <div class='panier image-container'>
    <a href="panier.jsp">
        <img class="jj" alt="" src="assets/images/panier (2).png">
    </a>
</div>
<div class='hist image-container'>
    <a href="historique.jsp">
        <img class="jj" alt="" src="assets/images/historique-des-transactions.png">
    </a>
</div> -->
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-title">
                        <h2>Trending Product</h2>
                        <p>There are many variations of passages of Lorem Ipsum available, but the majority have
                            suffered alteration in some form.</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <%
                if(request.getParameter("search")==null){
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehiculedb", "root", "");
                ResultSet rs = con.createStatement().executeQuery("SELECT id_vehicule, nom,category,prix,modele,image,type , puissance FROM `vehicule` where id_vehicule not in(SELECT id_vehicule from reservation)");
                while (rs.next()) {
                %>
                <div class="col-lg-3 col-md-6 col-12">
                    <!-- Start Single Product -->
                    <div class="single-product">
                        <div class="product-image">
                      <%--   <%   String id_vehicule = rs.getString("id_vehicule");
                        session.setAttribute("id_vehicule", id_vehicule); %> --%>
                            <img src="<%= rs.getString("image") %>" alt="Product Image">
                            <div class="button">
                                <a href="reservation.jsp?id_vehicule=<%=rs.getString("id_vehicule") %>" class="btn"><i class="lni lni-cart"></i> Reserve</a>
                            </div>
                        </div>
                        <div class="product-info">
                            <span class="category"><%= rs.getString("category") %></span>
                            <h4 class="title">
                                <a href="product-grids.html"><%= rs.getString("nom") %> <%= rs.getString("id_vehicule") %></a>
                            </h4>
                            <ul class="review">
                                <li><i class="lni lni-star-filled"><%= rs.getString("type") %></i></li>
                                <li><i class="lni lni-star-filled"><%= rs.getString("puissance") %></i></li>
                                <li><i class="lni lni-star-filled"></i></li>
                                <li><i class="lni lni-star-filled"></i></li>
                                <li><i class="lni lni-star"></i></li>
                               
                            </ul>
                            <div class="price">
                                <span><%= rs.getString("prix") %></span>
                            </div>
                        </div>
                    </div>
                    <!-- End Single Product -->
                </div>
                <%
                }
                con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }}else{
                	 try { String nom=request.getParameter("nom");
                         Class.forName("com.mysql.cj.jdbc.Driver");
                         Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehiculedb", "root", "");
                     String sql="SELECT id_vehicule, nom,category,prix,modele,image,type , puissance FROM `vehicule` where id_vehicule not in(SELECT id_vehicule from reservation) and nom=?";
                     PreparedStatement preparedStatement = con.prepareStatement(sql);
                     
                     // Définir la valeur du paramètre pour la recherche
                     preparedStatement.setString(1, nom);

                     // Exécuter la requête préparée
                     ResultSet rs = preparedStatement.executeQuery();
                     while (rs.next()) {
                
               
                %>
                <div class="col-lg-3 col-md-6 col-12">
                    <!-- Start Single Product -->
                    <div class="single-product">
                        <div class="product-image">
                        <%   String id_vehicule = rs.getString("id_vehicule");
                        session.setAttribute("id_vehicule", id_vehicule); %>
                            <img src="<%= rs.getString("image") %>" alt="Product Image">
                            <div class="button">
                                <a href="reservation.jsp?id_vehicule=<%=rs.getString("id_vehicule") %>" class="btn"><i class="lni lni-cart"></i> Reserve</a>
                            </div>
                        </div>
                        <div class="product-info">
                            <span class="category"><%= rs.getString("category") %></span>
                            <h4 class="title">
                                <a href="product-grids.html"><%= rs.getString("nom") %> <%= rs.getString("id_vehicule") %></a>
                            </h4>
                            <ul class="review">
                                <li><i class="lni lni-star-filled"><%= rs.getString("type") %></i></li>
                                <li><i class="lni lni-star-filled"><%= rs.getString("puissance") %></i></li>
                                <li><i class="lni lni-star-filled"></i></li>
                                <li><i class="lni lni-star-filled"></i></li>
                                <li><i class="lni lni-star"></i></li>
                               
                            </ul>
                            <div class="price">
                                <span><%= rs.getString("prix") %></span>
                            </div>
                        </div>
                    </div>
                    <!-- End Single Product -->
                </div>
                <% 
                     } con.close();
                     } catch (Exception e) {
                         e.printStackTrace();
                     }} %>
            </div>
        </div>
    </section>
    <!-- End Trending Product Area -->

    <!-- ========================= JS here ========================= -->
    <script src="assets/js/bootstrap.min_1.js"></script>
    <script src="assets/js/tiny-slider.js"></script>
    <script src="assets/js/glightbox.min.js"></script>
    <script src="assets/js/main.js"></script>
</body>

</html>
