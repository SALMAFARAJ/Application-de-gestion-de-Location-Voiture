<%@page import="database.Utilconx"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="database.Utilconx.*" %>
<!doctype html>
<%-- <%

if(request.getParameter("buy")!=null){

          

	Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehiculedb", "root", "");
	    String query = "SELECT id_reservation";
	    PreparedStatement statement = con.prepareStatement(query);
	    String id_client = (String)session.getAttribute("id_client");
	    statement.setString(1, id_client);
	    ResultSet rs = statement.executeQuery(); 
        double prixTotal= rs.getDouble(4);

    	
    	
   	    String query2 = "Select id_compte,solde from compte where id_client=? ";
   	    PreparedStatement statement1 = con.prepareStatement(query2);
   	   
   	    statement1.setString(1, id_client);
   	    ResultSet rst = statement.executeQuery();
   	    while(rst.next()){
   	    String id_compte= rs.getString(1);
    if(id_compte != null){	
	if(prixTotal > rs.getFloat(2)){
		System.out.println("solde insuff");
		RequestDispatcher rd= request.getRequestDispatcher("error_solde.jsp");
		rd.forward(request, response);
		
		}else{

			 Class.forName("com.mysql.cj.jdbc.Driver");
			    Connection conx = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehiculedb", "root", "");
			    PreparedStatement pst;
			    pst = conx.prepareStatement("INSERT INTO facture(`montant_total`, `date_facturation`, `id_compte`) VALUES (?, NOW(), ?)"); 
			    pst.setDouble(1, prixTotal); // Montant total en premier
			    pst.setString(2, rs.getString(1)); // ID du compte en deuxième
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
} }%> --%>
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
    	    String query = "SELECT id_reservation,nom, image,montant, modele,  dateDebut, dateFin FROM reservation, vehicule WHERE reservation.id_client = ? AND vehicule.id_vehicule = reservation.id_vehicule and id_reservation not in (select id_reservation from facture)";

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
					<h2 class="heading-section">VOTRE RESERVATION </h2>
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
						      <th>date Debut </th>
						      <th>date_fin</th>
						      <th></th>
						      <th></th>
						    </tr>
						  </thead>
						  <%while (rs.next()) {
							  
							  %>
						  <tbody>
						    <tr class="alert" role="alert">
						    	<td><%=rs.getString(2) %></td>
						    	<td>
						    		  <img src="<%= rs.getString(3) %>" alt="Product Image" style="max-width: 100px; max-height: 100px;">
						    	</td>
						      <td>
						      	<div class="email">
						      		<span><%=rs.getString(4)%> </span>
						      		
						      	</div>
						      </td>
						      <td><%=rs.getString(5)%></td>
						      <td >
					        
				          	<%=rs.getString(6)%>
				          </td>
				          <td><%=rs.getString(7)%></td>
				          <td><a href="compte.jsp?id_reservation=<%=rs.getString(1)%>&montant=<%=rs.getString(4)%>"><img alt="" src="assets/images/securite-des-paiements.png"></a></td>
						      <td>
						      	<a href="edit.jsp?id_reservation=<%=rs.getString(1)%>"><img alt="" src="assets/images/edit.png"></a>
				         
				        	</td>
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

