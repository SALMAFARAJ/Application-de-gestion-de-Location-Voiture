<%@page import="database.Utilconx"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="database.Utilconx.*" %>
<%
    // Créez ou récupérez la session au début de la page
    

    if (request.getParameter("login") != null) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehiculedb", "root", "");
            String email = request.getParameter("email");
            String pwd = request.getParameter("pwd");
            PreparedStatement pst;
            pst = con.prepareStatement("Select * From client where email=? and pwd=?");
            pst.setString(1, email);
            pst.setString(2, pwd);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                String id_client = rs.getString("id_client");
                session.setAttribute("id_client", id_client);
                // Utilisez la redirection pour afficher "index.jsp"
                response.sendRedirect("louer.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    if (request.getParameter("register") != null) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehiculedb", "root", "");
            String nom = request.getParameter("nom");
            String prenom = request.getParameter("prenom");
            String cin = request.getParameter("cin");
            String email = request.getParameter("email");
            String pwd = request.getParameter("pwd");
            PreparedStatement pst;
            pst = con.prepareStatement("INSERT INTO client(`nom`, `prenom`, `cin`,  `email`, `pwd`) VALUES (?, ?, ?, ?, ?)");
            pst.setString(1, nom);
          pst.setString(2, prenom);
            pst.setString(3, cin);
            pst.setString(4, email);
            pst.setString(5, pwd);
            pst.executeUpdate();
            // Utilisez la redirection pour afficher "index.jsp"
            response.sendRedirect("louer.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>

 

<!DOCTYPE html>
<html>
<head>

	<title>Slide Navbar</title>
	<!-- <link rel="stylesheet" type="text/css" href="assets/css/style_1.css"> -->
<link href="https://fonts.googleapis.com/css2?family=Jost:wght@500&display=swap" rel="stylesheet">
<style type="text/css">body{
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
	font-family: 'Jost', sans-serif;
	background: linear-gradient(to bottom, #0f0c29, #302b63, #24243e);
}
.main{
	width: 350px;
	height: 580px;
	background: red;
	overflow: hidden;
	background: url("https://doc-08-2c-docs.googleusercontent.com/docs/securesc/68c90smiglihng9534mvqmq1946dmis5/fo0picsp1nhiucmc0l25s29respgpr4j/1631524275000/03522360960922298374/03522360960922298374/1Sx0jhdpEpnNIydS4rnN4kHSJtU1EyWka?e=view&authuser=0&nonce=gcrocepgbb17m&user=03522360960922298374&hash=tfhgbs86ka6divo3llbvp93mg4csvb38") no-repeat center/ cover;
	border-radius: 10px;
	box-shadow: 5px 20px 50px #000;
}
#chk{
	display: none;
}
.signup{
	position: relative;
	width:100%;
	height: 100%;
}
label{
	color: #fff;
	font-size: 2.3em;
	justify-content: center;
	display: flex;
	margin: 60px;
	font-weight: bold;
	cursor: pointer;
	transition: .5s ease-in-out;
}
input{
	width: 60%;
	height: 20px;
	background: #e0dede;
	justify-content: center;
	display: flex;
	margin: 20px auto;
	padding: 10px;
	border: none;
	outline: none;
	border-radius: 5px;
}
input[type="submit"]{
	width: 60%;
	height: 40px;
	margin: 10px auto;
	justify-content: center;
	display: block;
	color: #fff;
	background: #573b8a;
	font-size: 1em;
	font-weight: bold;
	margin-top: 20px;
	outline: none;
	border: none;
	border-radius: 5px;
	transition: .2s ease-in;
	cursor: pointer;
}
input[type="submit"]:hover{
	background: #6d44b8;
}
.login{
	height: 460px;
	background: #eee;
	border-radius: 60% / 10%;
	transform: translateY(-180px);
	transition: .8s ease-in-out;
}
.login label{
	color: #573b8a;
	transform: scale(.6);
}

#chk:checked ~ .login{
	transform: translateY(-500px);
}
#chk:checked ~ .login label{
	transform: scale(1);	
}
#chk:checked ~ .signup label{
	transform: scale(.6);
}</style>

</head>
<body>

 <div class="main">
    <input type="checkbox" id="chk" aria-hidden="true">

    <div class="signup">
      <form method="post"  action="#">
        <label for="chk" aria-hidden="true">Sign up</label>
        <input type="text" name="prenom" placeholder="First name" required>
        <input type="text" name="nom" placeholder="Last name" required>
       
        <input type="text" name="cin" placeholder="CIN" required> 
        <input type="email" name="email" placeholder="Email" required>
        <input type="password" name="pwd" placeholder="Password" required>
        <input type="submit" value="Sign up" name="register">
      </form>
    </div>

    <div class="login">
      <form method="post" action="#">
        <label for="chk" aria-hidden="true">Login</label>
        <input type="email" name="email" placeholder="Email" required>
        <input type="password" name="pwd" placeholder="Password" required>
        <input type="submit" value="Login"name="login">
      </form>
    </div>
  </div>
</body>
</html>

  