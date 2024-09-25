<%@page import="database.Utilconx"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="database.Utilconx.*" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html lang="en" >
<head>
<style type="text/css">@import url('https://fonts.googleapis.com/css2?family=DM+Sans:wght@500&family=Montserrat:wght@600&display=swap');

*,
*::before,
*::after {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}
body {
  background: linear-gradient(to bottom, #3b347e, #302b63, #24243e);
  align-content: center;
  text-align: center;
}
.credit-card-form {
  margin-top: 1%;
  margin-left: 35%;
  max-width: 500px;
  padding: 1em;
  border-radius: 10px;
  box-shadow: 0px 6px 10px rgba(255, 255, 255, 0.1);
  font-family: 'Montserrat', sans-serif;
  background-color: #dbdbdb;
  text-align: center;
  color: #424242;
  align-content: center;
}

.credit-card-form h2 {
  margin-bottom: 10%;
  font-size: 24px;
}

.credit-card-form .form-group {
  margin-bottom: 15px;

}

.credit-card-form label {
  font-weight: bold;
  display: block;
  margin-bottom: 5px;
  color: #777;
}

.credit-card-form input[type="text"],.credit-card-form input[type="password"],
.credit-card-form select {
  width: 100%;
  padding: 12px;
  border: 1px solid #ddd;
  border-radius: 1rem;
  font-size: 16px;
    font-family: 'Montserrat', sans-serif;
}

.credit-card-form .form-row {
  display: flex;
}


.credit-card-form input[type="submit"] {
  width: 100%;
  padding: 14px;
  background-color: #585858;
  color: #fff;
  border: none;
  border-radius: 1rem;
  cursor: pointer;
  font-size: 16px;
  transition: background-color 0.3s ease;
  font-family: 'Montserrat', sans-serif;
}

.credit-card-form input[type="submit"]:hover {
  background-color: #808080;
  color: #424242;
  font-family: 'Montserrat', sans-serif;
  box-shadow: 0px 6px 10px rgba(255, 255, 255, 0.1);
}

.credit-card-form input[type="submit"]:focus {
  outline: none;
  font-family: 'Montserrat', sans-serif;
}

p {
  color: white;
  margin-top: 6%;
  font-family: 'Montserrat', sans-serif;
  text-align: center;
  margin-bottom: 45px;
  font-size: 70%;
  text-shadow: 0 0 5px #cacaca; 
}

.Image1 {
  margin-top: 0;
  width: 220px;
}
.h2 {
  margin: 0px;
}</style>
  <meta charset="UTF-8">
  <title>FARAJ'S CARS</title>
  <link rel="stylesheet" href="./style.css">
<script src="https://www.paypal.com/sdk/js?client-id=AeGg1bP7-HookFrUtnAVy_Qp82dljdvsIaRU5qx-4VkYpObUgSed0d2caxuhxHmk9lhOkWkjlMWdKvtG"></script>
</head>
<body>
<!-- partial:index.partial.html -->
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="styles.css">
  <script type="text/javascript" src="scripts.js"></script>
</head>
<body>
  <div class="credit-card-form">
    <h2>PAYER EN LIGNE</h2>
<img class="Image1" src="https://i.ibb.co/hgJ7z3J/6375aad33dbabc9c424b5713-card-mockup-01.png" alt="6375aad33dbabc9c424b5713-card-mockup-01" border="0">
  
   <form method="post">
    <div class="form-group">
    
<%
String id_reservation = request.getParameter("id_reservation");
String montantStr = request.getParameter("montant");
double montant = 0.0; // Default value in case the parameter is not provided or cannot be parsed.
if (montantStr != null) {
  
        montant = Double.parseDouble(montantStr);
 
if(request.getParameter("payer")!=null){
	 
	
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehiculedb", "root", "");
   
    String id_client = (String)session.getAttribute("id_client");
   
    	String pwd=request.getParameter("password");
   	    String query2 = "Select  * from compte where id_client=? and password=? ";
   	    PreparedStatement statement1 = con.prepareStatement(query2);
   	 statement1.setString(1, id_client);
   	    statement1.setString(2, pwd);
   	    ResultSet rst = statement1.executeQuery();
   	 while (rst.next()) {
   	    String id_compte = rst.getString("id_compte");
   	
    if(id_compte != null){	
	if(montant > rst.getFloat("solde")){
		System.out.println("solde insuff");
		RequestDispatcher rd= request.getRequestDispatcher("error_solde.jsp");
		rd.forward(request, response);
		
		}else{

			    Class.forName("com.mysql.cj.jdbc.Driver");
			    Connection conx = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehiculedb", "root", "");
			    PreparedStatement pst;
			    pst = conx.prepareStatement("INSERT INTO facture(`montant_total`, `date_facturation`, `id_compte`,id_reservation) VALUES (?, NOW(), ?,?)"); 
			    pst.setDouble(1, montant); // Montant total en premier
			    pst.setString(2, rst.getString("id_compte"));
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
} }}
%>

<label for="card-number">password</label>
<input type="password" value="" name="password" id="card-number" placeholder="pwd" >
</div>

      <div class="form-group">
        <label for="card-number">montant </label>
        <input value="<%=montant %>" type="text" name ="montant" id="card-number" placeholder="">
      </div>
      <input  type="submit" name="payer" class="click-button" onclick="showLoading(event, this)" value="payer">
    </form>
  </div>

<!-- partial -->


  <script  src="./script.js"></script>

</body>
</html>
