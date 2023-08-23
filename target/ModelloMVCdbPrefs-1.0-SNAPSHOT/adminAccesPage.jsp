<%--
  Created by IntelliJ IDEA.
  User: Marco Guerrera
  Date: 13/07/2022
  Time: 16:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<style>
    body{
        background-color: #d1bda1;
        margin:0;
    }
    .emailInput input{
        width: 300px;
        height: 30px;
    }
    .emailInput button{
        width: 90px;
        height: 40px;
        font-size: 18px;
        font-family: "Ribbon-condensed", sans-serif;
    }
    .emailInput label{
        font-family: "Ribbon-condensed", sans-serif;
        font-size: 18px;
        font-stretch: condensed;
    }
    .registerBtn{
        width: 420px;
        height: 30px;
        font-size: 18px;
        font-family: "Ribbon-condensed", sans-serif;
    }
</style>
<head>
    <title>FantasyBackdoor - Login</title>
</head>
<body>
<div class="centerLogo" align="center">
    <a href="index.jsp" ><img src="Img/Logo_piccolo%20FB.jpg" width="350" height="350"></a>
</div>
<div class="loginSection" align="center">
    <div class="emailInput">
        <form action="adminlogin" method="post">
            <input name="passcode" type="password" placeholder="Admin PassCode" >
            <h4>${message}</h4>
            <br><br>
            <button type="submit">Login</button>
        </form>
    </div>

</div>
</div>
</body>
</html>
