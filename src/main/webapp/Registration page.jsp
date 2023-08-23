<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register on FantasyBackdoor</title>
</head>
<body>
<style>
    body{
        background-color: #d1bda1;
        margin:0;
        font-family: "Ribbon-condensed", sans-serif;
    }
    .userFormInfo {
        margin-left: 720px;
    }
    .userFormInfo label{
        margin-top: 10px;
        font-family: "Ribbon-condensed", sans-serif;
        font-size: 18px;
        text-align: left;
    }
    .userFormInfo input{
        margin: 1px;
        font-size: 15px;
        font-family: "Ribbon-condensed", sans-serif;
    }
</style>

<div class="centerLogo" align="center">
    <a href="index.jsp"><img src="Img/Logo_piccolo%20FB.jpg" width="350" height="350"></a>
</div>
<div class="userFormInfo" align="left">
    <form action="registrazione-utente-servlet" method="post">
        <form action="registrazione-login" method="post">
        <label>Name and Surname</label><label style="margin-left: 70px">Email and Password</label><br>
        <label>*</label><input type="text", id="nome", name="name", placeholder="Name" required><label style="margin-left: 20px">*</label><input name="email" type="email" placeholder="Username" required><br>
        <label>*</label><input type="text", id="cognome", name="surname", placeholder="Surname" required><label style="margin-left: 20px">*</label><input name="password" type="password" placeholder="Password" required><br>
        <label style="margin-left: 229px">*</label><input type="password" placeholder="Confirm Password" required><br>
        <label>Address info</label><br>
        <label>*</label><input type="text", id="address1", name="address1", placeholder="Address line 1" required><br>
        <label>-</label><input type="text", id="address2", name="address2", placeholder="Address line 2"> <label  style="margin-left: 20px">*</label><input style="margin-left: 10px" type="checkbox" value="yes" required><label style="font-size: 14px"> I agree <a href="terms.html">terms and conditions</a></label><br>
        <label>*</label><input type="text", id="city", name="city", placeholder="City" required> <button id="submitRegistration" style="margin-top: 20px; margin-left: 90px; padding: 4px; font-size: 14px; font-family: 'Ribbon-condensed', sans-serif" type="submit">Register me!</button><br>
        <label>*</label><input type="text", id="state", name="state", placeholder="State" required><label style="margin-left: 20px">________________________</label><br>
        <label>*</label><input type="text", id="zip", name="zip", placeholder="ZipCode" required><label style="font-size: 15px;  margin-left: 5px">Already registered? Click <a href="Access%20Page.jsp">HERE</a> to login</label><br>
        <label>*</label><input type="text", id="country", name="country", placeholder="Country" required><br><br>
        <label style="font-size: 12px">*  required fields</label>
        </form>
    </form>
    <h2 style="color: red; margin-left: 90px; text-decoration: underline red">${message}</h2>
</div>

</body>
</html>
