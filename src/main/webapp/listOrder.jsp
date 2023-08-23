<%--
  Created by IntelliJ IDEA.
  User: Marco Guerrera
  Date: 16/07/2022
  Time: 12:28
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

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
  <div class="container-fluid" style="border-style: solid; border-width:0px;">
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
  </div>
  <%if(session.getAttribute("orderList")==null){%>
  <h2 align="center" style="margin-top: 200px">THERE ARE NO ORDER FOR USER: ${user.email}</h2>
  <%}else{%>
  <h3 align="center" style="margin-top: 20px">ALL ORDER FOR USER: ${user.email}</h3>
  <span style="display: inline-block;position: relative;left: 100px; top: 40px">
        <c:forEach items="${orderList}" var="order">
            <h3 style="margin-top: -20px">Order #${order.getOrderNumber()}</h3>
            <h3>Order Items</h3><p>${order.getOrderItem()}</p>
            <h3 style="border-bottom-style: solid">Order total: ${order.getOrderTotal()}</h3>
        </c:forEach>
      </span>
  <%}%>
  </body>
</html>
