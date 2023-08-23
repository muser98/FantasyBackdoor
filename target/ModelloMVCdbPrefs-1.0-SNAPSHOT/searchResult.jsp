<%--
  Created by IntelliJ IDEA.
  User: marcoguerrera
  Date: 03/06/22
  Time: 13:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<html>
<head>
    <link rel="stylesheet" href="CSS/Page.css">
    <title>Shop All</title>
    <style>
        .item{
            float: left;
            width: 25%;
        }
        .itemgallery{
            margin-top: 20px;
            margin-left: 20px;
        }
        .imgLink{
            width:90%;
            background-color: white;
            border-radius: 10px;
        }
        .item p{
            margin-left: -50px;
            font-family: "Ribbon-condensed", sans-serif;
            font-size: 20px;
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
    <%}%>    <div>
        <div class="topNavMenu" align="left">
            <a href="index.jsp" class="a1" id="listMenuUomo">HOME</a>
            <a href="showAllM" class="a2" id="listMenuDonna">UOMO</a>
            <a href="showAllW" class="a3" id="listMenu">DONNA</a>
            <% if(session.getAttribute("user")==null){%>
            <a href="Registration%20page.jsp" class="a4" id="accountPage">SIGN-UP/LOGIN</a><%
        } else{%>
            <a href="userPage.jsp" class="a4" id="accountPage">ACCOUNT</a>
            <%}%>
        </div>
    </div>
</div>
<div class="itemgallery">
    <c:forEach items="${result}" var="product">
        <div class="item">
            <form action="product" method="get" type="hidden">
                <input type="hidden" value="${product.variant}" name="articleId">
                <input class="imgLink" type="image" src="${product.img1}" width="50%" height="auto" background-color="white"></form>
            <p align="center">${product.productname}</p>
        </div>
    </c:forEach>
</div>
</body>
</html>