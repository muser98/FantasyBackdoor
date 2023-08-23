<%--
  Created by IntelliJ IDEA.
  User: Marco Guerrera
  Date: 16/07/2022
  Time: 10:32
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
    <title>Order Placed - page</title>
    <link rel="stylesheet" href="CSS/Page.css">
    <style>

        body {
            font-family: "Ribbon-condensed", sans-serif;
        }
        @keyframes fade {
            from {opacity: .4}
            to {opacity: 1}
        }
        @media only screen and (max-width: 300px) {
            .text {font-size: 11px}
        }
        .fade {
            animation-name: fade;
            animation-duration: 1.5s;
        }
        .dot {
            height: 15px;
            width: 15px;
            margin: 0 2px;
            background-color: #bbb;
            border-radius: 50%;
            display: inline-block;
            transition: background-color 0.6s ease;
        }
        .cartButton{
            margin-left: 1150px;
            margin-bottom: 40px;

            width: 100px;
            height: 100px;
        }
        .orderinfo{
            margin-top: 50px;
        }
        .homepageicon img:hover{
            color: white;
        }

    </style>
</head>
<body>
    <div class="headerLogo" align="left" >
        <img src="Img/LogoAllungato.png" alt="FantasyBackdoor" widht="1450" height="200" align="center">
        <% if(session.getAttribute("cart")==null){%>
        <a href="Cart.jsp" class="cartButton"><img src="Img/cart-icon.png" border="0px"  width="100px" height="100px"> </a>
        <%}else{%>
        <a href="Cart.jsp" class="cartButton"><img src="Img/cart-icon-full.png" border="0px"  width="100px" height="100px"> </a>
        <%}%>
        <div class="topNavMenu" align="left">
            <a href="showAllM" class="a1" id="listMenuUomo">MAN</a>
            <a href="showAllW" class="a2" id="listMenuDonna">WOMAN</a>
            <a href="showAll" class="a3" id="listMenu">SHOP ALL</a>
            <% if(session.getAttribute("user")==null){%>
            <a href="Registration%20page.jsp" class="a4" id="accountPage">SIGN-UP/LOGIN</a><%
            } else{%>
            <a href="userPage.jsp" class="a4" id="accountPage">ACCOUNT</a>
            <%}%>
        </div>
    </div>
    <div align="center" class="orderinfo">
        <h2>THANK YOU FR YOUR PURCHASE! Here is your order information:</h2>
        <h3 style="text-decoration: underline black">ORDER NUMBER #${orderinfo.getOrderNumber()}</h3>
        <h3> Item ordered</h3>
        <p style="font-size: 17px; background-color: white; padding: 3px; width: fit-content">${orderinfo.getOrderItem()}</p>
        <p style="font-size: 19px;font-weight: bold; display: inline-block">Total price </p><p style="display: inline-block;font-size: 19px;font-weight: bold;"></p>: <p style="font-size: 17px; display: inline-block ;background-color: white; padding: 3px; width: fit-content">${orderinfo.getOrderTotal()}&euro;</p>
        <h3>Check your email confirmation for shipping informations</h3>
        <div class=homepageicon">
        <a  href="index.jsp" style="color: black;"><img src="Img/homepageicon.png" width="50px" height="50px"></a>
        </div>
    </div>
</body>
</html>
