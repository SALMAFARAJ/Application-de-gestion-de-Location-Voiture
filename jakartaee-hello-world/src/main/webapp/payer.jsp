<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   

<%@page import="java.sql.*" %>
<%@page import="database.Utilconx.*" %>
<!doctype html>
<%

    

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehiculedb", "root", "");
    String query = "SELECT montant from reservation where id_reservation =?";
    
    PreparedStatement statement = con.prepareStatement(query);
    String id_reservation = request.getParameter("id_reservation");
    System.out.println(id_reservation);
    String id_client = (String)session.getAttribute("id_client");
    statement.setString(1, id_reservation);
    ResultSet rs = statement.executeQuery(); 
   
    double prixTotal = 0;
    if (rs.next()) {
        prixTotal = rs.getDouble("montant");
    }

    	
    	
   	    String query2 = "Select id_compte,solde from compte where id_client=? ";
   	    PreparedStatement statement1 = con.prepareStatement(query2);
   	   
   	    statement1.setString(1, id_client);
   	    ResultSet rst = statement1.executeQuery();
   	 while (rst.next()) {
   	    String id_compte = rst.getString("id_compte");
   	
    if(id_compte != null){	
	if(prixTotal > rst.getFloat(2)){
		System.out.println("solde insuff");
		RequestDispatcher rd= request.getRequestDispatcher("error_solde.jsp");
		rd.forward(request, response);
		
		}else{

			 Class.forName("com.mysql.cj.jdbc.Driver");
			    Connection conx = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehiculedb", "root", "");
			    PreparedStatement pst;
			    pst = conx.prepareStatement("INSERT INTO facture(`montant_total`, `date_facturation`, `id_compte`,id_reservation) VALUES (?, NOW(), ?,?)"); 
			    pst.setDouble(1, prixTotal); // Montant total en premier
			    pst.setString(2, rst.getString(1));
			    pst.setString(3, id_reservation);// ID du compte en deuxième
			    System.out.println("solde suff");
			    pst.executeUpdate(); // Exécuter l'insertion
			    RequestDispatcher rd = request.getRequestDispatcher("succes.html");
			    rd.forward(request, response);
			
		}
	}else{
		System.out.println("compte errone");
		RequestDispatcher rd= request.getRequestDispatcher("error_compte.jsp");
		rd.forward(request, response);
	}
} %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Successful</title>
    <!-- FONT AWESOME ICONS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css" integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog==" crossorigin="anonymous" />
    <link rel="stylesheet" href="assets/css/success.css">
</head>
<body>

<div class="bloc">
    <div class="success-logo">
        <img src="assets/images/checked.png">
    </div>
    <h1 class="font-title">Merci pour votre achat !</h1>
    <p>Nous vous avertirons lorsque votre commande sera envoyée. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Eos maxime ducimus ipsam. Consequatur architecto voluptate facere dolore consectetur! Doloribus officiis nesciunt illo praesentium nisi reprehenderit ea maiores laborum molestiae omnis!</p>
    <div class="center">
        <a class="return" href="panier.jsp">Retour à la boutique</a>
    </div>
</div>

</body>
</html>