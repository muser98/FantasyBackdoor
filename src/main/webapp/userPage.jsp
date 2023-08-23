
<%--
  Created by IntelliJ IDEA.
  User: marcoguerrera
  Date: 27/05/22
  Time: 11:39
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
    <title>AccountPage</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script>
        $(document).ready(function(){
            $.ajax({
                url     : 'timestamp',
                method     : 'post',
                success    : function(resultText){
                    $('#logintime').html(resultText);
                }
            });
        });
    </script>
</head>
<body>
    <style>
        body {
            font-family: "Ribbon-condensed", sans-serif;
            background-color: #d1bda1;
        }
        .headerLogo{
            margin-left: 30px;
        }
        .topNavMenu a{
            width: 20%;
            background-color: white;
            resize: both;
            overflow: auto;
            display: flow;
            font-family: "Ribbon-condensed", sans-serif;
            font-size: 18px;
            color: black;
            text-align: center;
            padding: 2px 2px;
            text-decoration: none;
            border-radius: 5px;
        }
        .a1{
            margin-right: 25%;
            margin-left: 5px
        }
        .a2{
            margin-right: 28%;
        }
        .a3{
            margin-right: 25%;
        }
        .topNavMenu a:hover {
            background-color: grey;
            color: white;
        }
        .cartButton{
            position: absolute;
            margin-left: 1150px;
            margin-right: 30px;
            margin-top: 60px;
            margin-bottom: 30px;
            background: none;
            border-style: none;
        }
        .cartButton:hover{
            background-color: lightgrey;
        }
        .intestation_text{
            font-family: "Ribbon-condensed", sans-serif;
            font-stretch: ultra-condensed;
        }
        .title{
            border-bottom: black;
            border-bottom-style: solid;
            font-size: 27px;
        }
        .subtitle{
            font-size: 18px;
            margin-bottom: 5px;
            text-decoration: underline black;
        }
        .value{
            background-color: white;
            background-size: auto;
            color: black;
            font-family: "Ribbon-condensed", sans-serif;
            font-style: italic;
            margin-top: 2px;
        }
        .overview_info{
            max-width: 500px;
        }
        .overview_info p{
            padding: 5px;
            font-style: inherit;
        }

    </style>
    <div class="headerLogo" align="left" >
        <a href="index.jsp"><img src="Img/LogoAllungato.png" alt="FantasyBackdoor" widht="1450" height="200" align="center"></a>
            <% if(session.getAttribute("cart")==null){%>
                <a href="Cart.jsp" class="cartButton"><img src="Img/cart-icon.png" border="0px"  width="100px" height="100px"> </a>
            <%}else{%>
            <a href="Cart.jsp" class="cartButton"><img src="Img/cart-icon-full.png" border="0px"  width="100px" height="100px"> </a>
            <%}%>
        <div>
            <div class="topNavMenu" align="left">
                <a href="showAllM" class="a1" id="listMenuUomo">UOMO</a>
                <a href="showAllW" class="a2" id="listMenuDonna">DONNA</a>
                <a href="showAll" class="a3" id="listMenu">SHOP</a>
                <a href="logout" class="a4" id="accountPage">LOGOUT</a>
            </div>
        </div>
    </div>
    <div align="center" class="intestation_text">
        <h1>Your account</h1>
        <h3 style="display: inline-block"id="logintime"></h3>
        <h3 name="customerID">- CUSTOMER ID: ${user.id} -</h3>
    </div>
    <span class="overview_info" style="top:-20px;display: inline-block;position: relative; left:500px; width: 500px">
            <h3 class="title">OVERVIEW</h3>
            <p class="subtitle" >Username</p>
            <p class="value">${user.email}</p>
            <p class="subtitle">Address</p>
            <p class="value">${user.address1}</p>
            <p class="value">${user.address2}</p>
            <p class="value">${user.zip}</p>
            <p class="value">${user.state}</p>
            <p class="value"> ${user.country}</p>
            <p class="subtitle">Personal Info</p>
            <p class="value">${user.getName()}</p>
            <p class="value">${user.surname}</p>
    </span>
    <span style="display: inline-block;position: relative; top: -330px; left: 550px">
        <h3>Click here to check all your order</h3>
        <form action="listorder" method="get">
            <input type="hidden" name="email" value="'${user.email}'">
            <button style="margin-left: 90px; padding: 5px;font-size: 15px">CHECK ORDER</button></a>
        </form>
    </span>
</body>
</html>
