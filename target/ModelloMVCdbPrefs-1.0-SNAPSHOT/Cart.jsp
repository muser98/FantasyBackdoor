<%@ page import="java.util.*" %>
<%@ page import="model.productBean" %>

<%--
  Created by IntelliJ IDEA.
  User: Marco Guerrera
  Date: 09/07/2022
  Time: 16:28
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<html>
<head>
    <title>CART</title>
    <link rel="stylesheet" href="CSS/Page.css">
    <style>

        .imgLink{
            float: left;
            width:220px;
            height: auto;
            background-color: white;
            border-radius: 10px;
        }
        .item p{
            margin-left: -50px;
            font-family: "Ribbon-condensed", sans-serif;
            font-size: 20px;
        }
        td{
            border-left: none;
            border-right: none;
            border-left: none;
            border-bottom: 1px solid;
            border-color: black;
            padding-bottom: 5px;
        }
        h1,h2,h4,h5,h6{
            font-family: "Ribbon-condensed", sans-serif;
        }
        .cartList{
            margin-top: 20px;
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
        <div>
            <div class="topNavMenu" align="left">
                <a href="index.jsp" class="a1" id="listMenuUomo">HOME</a>
                <a href="showAllM" class="a2" id="listMenuDonna">MAN</a>
                <a href="showAllW" class="a3" id="listMenu">WOMAN</a>
                <% if(session.getAttribute("user")==null){%>
                <a href="Registration%20page.jsp" class="a4" id="accountPage">SIGN-UP/LOGIN</a><%
            } else{%>
                <a href="userPage.jsp" class="a4" id="accountPage">ACCOUNT</a>
                <%}%>
            </div>
        </div>
    </div>
    <%if(session.getAttribute("cart")==null){%>
        <h1 style="font-family: 'Ribbon-condensed', sans-serif; margin-left: 700px; margin-top: 300px">THE SHOPPING CART IS EMPTY</h1>
    <%}else{%>
    <div align="center">
        <h1 style="font-family: 'Ribbon-condensed', sans-serif;margin-top: 30px">SHOPPING CART</h1>
        <c:forEach items="${cart}" var="product">
            <table class="cartList" >
                <tr align="center">
                    <td width="800px">
                        <img class="imgLink" type="image" src="${product.img1}" height="auto" background-color="white">
                        <h4 style="float: left; margin-left: 10px; margin-top: 50px">${product.productname} - ${product.size}<br>PRICE: ${product.price}&euro;</h4>
                        <form action="removeItem" method="get">
                            <input type="hidden" name="variant" value=${product.variant}>
                            <input type="hidden" name="size" value=${product.size}>
                            <button type="submit" style="margin-top: 40px">Remove<br>item</button>
                        </form>
                    </td>
                </tr>
            </table>
        </c:forEach>
        <c:forEach var="item" items="${cart }">
            <c:set var="total" value="${total + item.getPrice()}"></c:set>
        </c:forEach>
        <h2 style="float: left; margin-left: 700px">TOTAL: ${total} &euro;</h2>
        <% if(session.getAttribute("user")==null){%>
        <a href="Access%20Page.jsp"><button style="margin-left: -300px;margin-top: 10px;">Login to<br>place order</button></a>
        <%}else{%>
        <a href="placeOrderPage.jsp"><button style="margin-left: -300px; margin-top: 10px;padding: 10px">Place order</button></a>
        <%}%>
    </div>
        <%}%>
</body>
</html>
