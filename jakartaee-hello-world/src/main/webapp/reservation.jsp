<%@page import="database.Utilconx"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="database.Utilconx.*" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<%

             String id_client= (String)session.getAttribute("id_client");
             String id_vehicule=request.getParameter("id_vehicule");
             if (request.getParameter("register") != null) {
                 try {
                	  Class.forName("com.mysql.cj.jdbc.Driver");
                	    
                	    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehiculedb", "root", "");               
                	PreparedStatement st = con.prepareStatement("SELECT nom,prix FROM `vehicule` WHERE id_vehicule=?");
                	st.setString(1, id_vehicule);
                	ResultSet rst = st.executeQuery();
                	if(rst.next()){
                	String dateDebutStr = request.getParameter("dateDebut");
                	String dateFinStr = request.getParameter("dateFin");
                
                     Class.forName("com.mysql.cj.jdbc.Driver");
                     Connection conx = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehiculedb", "root", "");                 
                     PreparedStatement pst;
                     Double prix =(double) rst.getInt(2);
                     SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); // ou le format que vous utilisez

                     Date dateDebut = dateFormat.parse(dateDebutStr);
                     Date dateFin = dateFormat.parse(dateFinStr);

       
       long differenceEnMillisecondes = dateFin.getTime() - dateDebut.getTime();
       int dureeEnJours = (int) (differenceEnMillisecondes / (24 * 60 * 60 * 1000));

       // Calcul du prix total
      double prixTotal = prix * dureeEnJours;
                     pst = con.prepareStatement("INSERT INTO reservation(`dateFin`, `dateDebut`, `id_vehicule`,  `id_client`,montant) VALUES (?, ?, ?, ?,?)");
                     pst.setString(1, dateFinStr);
                     pst.setString(2, dateDebutStr);
                     pst.setString(3, id_vehicule);
                     pst.setString(4, id_client);
                     pst.setDouble(5, prixTotal );
                     pst.executeUpdate();           
                     response.sendRedirect("louer.jsp");
                	}    } catch (Exception e) {
                     e.printStackTrace();
                 }
             }
             
                %>
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

.credit-card-form input[type="text"],.credit-card-form input[type="date"],
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
    <h2>RESERVER EN LIGNE</h2>
<img class="Image1" src="https://i.ibb.co/hgJ7z3J/6375aad33dbabc9c424b5713-card-mockup-01.png" alt="6375aad33dbabc9c424b5713-card-mockup-01" border="0"></a>
  
    <form method="post">
    <div class="form-group">
   <%
Class.forName("com.mysql.cj.jdbc.Driver");
String id = (String)session.getAttribute("id_vehicule");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehiculedb", "root", "");
PreparedStatement st = con.prepareStatement("SELECT nom, prix FROM `vehicule` WHERE id_vehicule=?");
st.setString(1, id);
ResultSet rs = st.executeQuery();
if (rs.next()) { // Vérifiez si le résultat contient des enregistrements
    String nom = rs.getString("nom");
    double prix = rs.getDouble("prix");
%>
<label for="card-number">Voiture</label>
<input type="text" value="<%= nom %>" name="nom" id="card-number" placeholder="voiture ">
</div>
<div class="form-group">
<label for="card-number">prix</label>
<input type="text" value="<%=prix %>" name="prix" id="card-number" placeholder="prix">
</div>
<%
}
rs.close(); // Fermez le ResultSet après avoir fini de l'utiliser
%>
    <div class="form-row">
      <div class="form-group">
        <label for="card-number">date debut </label>
        <input type="date" name ="dateDebut" id="card-number" placeholder="">
      </div>
      <div class="form-group ">
        <label for="card-holder">date Fin</label>
        <input type="date" name="dateFin" id="card-holder" placeholder="">
      </div>
    </div> 
     <input  type="submit" name="register" class="click-button" onclick="showLoading(event, this)" value="valider">
    </form>
  </div>

<!-- partial -->


  <script  src="./script.js"></script>

</body>
</html>
