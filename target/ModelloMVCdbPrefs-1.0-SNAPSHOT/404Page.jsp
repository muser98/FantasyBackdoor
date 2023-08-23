<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Fantasy Backdoor</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=10, user-scalable=yes">
    <link rel="stylesheet" href="CSS/Page.css">

    <style>
        .slideshow-container {
            max-width: 90%;
            position: relative;
            margin: auto;
            margin-top: 30px;
        }
        .active {
            background-color: #717171;
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
        .container-fluid{
            size: auto;
            all: unset;
        }
        .cartButton{
            margin-left: 950px;
            width: 100px;
            height: 100px;
        }
    </style>
    <title>FantasyBackdoor - Online Shop</title>
</head>
<body>
<div class="container-fluid" style="border-style: solid; border-width:0px;">
    <div class="headerLogo" align="left" >
        <img src="Img/LogoAllungato.png" alt="FantasyBackdoor" widht="1450" height="200" align="center">
        <% if(session.getAttribute("cart")==null){%>
            <a href="Cart.jsp" class="cartButton"><img src="Img/cart-icon.png" border="0px"  width="100px" height="100px"> </a>
        <%}else{%>
            <a href="Cart.jsp" class="cartButton"><img src="Img/cart-icon-full.png" border="0px"  width="100px" height="100px"> </a>
        <%}%>
        <div>
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
            <h2 align="center" style="font-family: 'Ribbon-condensed', sans-serif; margin-top: 120px">PRODUCT NOT FOUND RETURN TO THE <a href="index.jsp" style="color: black; text-decoration: underline">HOMEPAGE</a></h2>
            <img align="center" style="margin-top: 40px; margin-left: 830px " src="Img/404.png" alt="404" width=10% height=auto>
</body>
</html>