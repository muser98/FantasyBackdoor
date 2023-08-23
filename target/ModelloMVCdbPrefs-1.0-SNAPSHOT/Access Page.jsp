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
        <form action="login" method="post">
            <input name="email" type="email" placeholder="Username" >
            <br><br>
            <input name="password" type="password" placeholder="Password">
            <br><br>
            <button type="submit">Login</button>
        </form>
        <h3>______________________</h3>
        <br><p style="font-family: 'Ribbon-condensed', sans-serif; font-size: 17px; color: red; font-weight: bold">${message}</p>
        <br>
        <label>Not registered yet ? Press below to register!</label> <br><br>
        <a href="Registration%20page.jsp"><button class="registerBtn" type="submit">Register</button></a>
        <br><br><br><br><br><br><br><br><br><br><br><br><br>
        <a href="adminAccesPage.jsp">Admin section</a>
    </div>

</div>
</div>
</body>
</html>