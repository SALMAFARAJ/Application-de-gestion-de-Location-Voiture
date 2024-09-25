<%@page import="database.Utilconx"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="database.Utilconx.*" %>
<!doctype html>
<html lang="en">
  <head>
  	<title>Table 06</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<link rel="stylesheet" href="assets/css/style_4.css">
    <%
   
      try {
    	 
    	  Class.forName("com.mysql.cj.jdbc.Driver");
          Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehiculedb", "root", "");
    	    String query = "SELECT nom, image,montant, modele,id_compte,date_facturation,  dateDebut, dateFin FROM reservation,facture, vehicule WHERE reservation.id_client = ? AND vehicule.id_vehicule = reservation.id_vehicule and reservation.id_reservation=facture.id_reservation";

    	    PreparedStatement statement = con.prepareStatement(query);
    	    String id_client = (String)session.getAttribute("id_client");
    	    statement.setString(1, id_client); 
    	    ResultSet rs = statement.executeQuery(); 
    	  
                %> 
	</head>
	<body>
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-4">
					<h2 class="heading-section">VOTRE RESERVATION</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					
					<div class="table-wrap">
						<table class="table">
						  <thead class="thead-primary">
						    <tr>
						    	<th>Voiture</th>
						    	<th>image</th>
						    	<th>prix</th>
						      <th>model</th>
						      <th>id_compte</th>
						      <th>Date facturation</th>
						      <th>date Debut </th>
						      <th>date_fin</th>
						      <th></th>
						    </tr>
						  </thead>
						  <%while (rs.next()) {
							  
							  %>
						  <tbody>
						    <tr class="alert" role="alert">
						    	<td><%=rs.getString(1) %></td>
						    	<td>
						    		  <img src="<%= rs.getString(2) %>" alt="Product Image" style="max-width: 100px; max-height: 100px;">
						    	</td>
						      <td>
						      	
						      		<span><%=rs.getDouble(3)%> </span>
						      		
						    
						      </td>
						      <td><%=rs.getString(4)%></td>
						      <td >
					        
				          	<%=rs.getString(5)%>
				          </td>
				          <td><%=rs.getString(6)%></td>
				          <td><%=rs.getString(7)%></td>
				          <td><%=rs.getString(8)%></td>
				          
						      
						    </tr>
                          <%
    }
                }catch(Exception e){
    	
    }
    %>
    
						  </tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>

	<script src="assets/js/jquery.min_1.js"></script>
  <script src="assets/js/popper.js"></script>
  <script src="assets/js/bootstrap.min_2.js"></script>
  <script src="assets/js/main_2.js"></script>

	</body>
</html>

