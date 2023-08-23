<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registrazione effettuata</title>
</head>
<body>
<style>
    body{
        background-color: #d1bda1;
        font-family: "Ribbon-condensed", sans-serif;
    }
</style>
<div class="centerLogo" align="center">
    <a href="index.jsp"><img src="Img/Logo_piccolo FB.jpg" width="350" height="350"></a>
</div>
<div class="confirmationBox" align="center">
    <h3>Hi ${user.email}</h3>
    <h3>Your infos are registered press below to login!</h3><br>
    <a href="Access%20Page.jsp"><button type="button" style="width: 80px; height: 25px;">Login</button></a><br>
</div>
</body>
</html>
