<%--
  Created by IntelliJ IDEA.
  User: Marco Guerrera
  Date: 15/07/2022
  Time: 17:54
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<html>
<head>
    <title>Order Confirmation - page</title>
    <link rel="stylesheet" href="CSS/Page.css">
    <style>
        body{
            font-family: "Ribbon-condensed", sans-serif;
        }
        input{
            padding: 3px;
            background-color: white;
            margin-bottom: 2px;
            font-size: 16px;
        }
        .imgLink{
            float: left;
            width:25%;
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
            margin-bottom: -2px;
        }
        .cartList{
            margin-top: 20px;
        }
        .placeorderButton{
            padding: 10px;
        }
    </style>
</head>
<body>
        <a href="index.jsp"><img src="Img/LogoAllungato.png" alt="FantasyBackdoor" widht="1450" height="200" align="center"></a>
        <% if(session.getAttribute("cart")==null){%>
        <a href="Cart.jsp" class="cartButton"><img src="Img/cart-icon.png" border="0px"  width="100px" height="100px"> </a>
        <%}else{%>
        <a href="Cart.jsp" class="cartButton"><img src="Img/cart-icon-full.png" border="0px"  width="100px" height="100px"> </a>
        <%}%>        <div class="topNavMenu" align="left">
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
    <span style="float:left; margin-left: 20px; width: 33%">
        <h1 style="font-family: 'Ribbon-condensed', sans-serif; margin-left: 30px; margin-top: 30px">ORDER SUMMARY</h1>
    <c:forEach items="${cart}" var="product">
        <table class="cartList" >
            <tr align="center">
                <td width="800px">
                    <img class="imgLink" type="image" src="${product.img1}" height="auto" background-color="white">
                    <h4 style="overflow:auto;max-width: 300px; float: left; margin-left: 10px; margin-top: 25px">${product.productname} - ${product.size}<br>PRICE: ${product.price}&euro;</h4>
                </td>
            </tr>
        </table>
        </c:forEach>
        <c:forEach var="item" items="${cart }">
            <c:set var="total" value="${total + item.getPrice()}"></c:set>
        </c:forEach>
        <h2>TOTAL: ${total} &euro;</h2>
    </span>
    <span style="display: inline-block;position: relative;left: 100px; top: 40px">
            <h4 class="subtitle">Email</h4>
            <input type="text" value="${user.email}"><br>
            <h3>SHIPPING INFORMATION</h3>
            <h4 class="subtitle">Address</h4>
            <input type="text"  placeholder="Address1" value="${user.address1}"><br>
            <input type="text"  placeholder="Address2" value="${user.address2}"><br>
            <input type="text" placeholder="Zipcode" value="${user.zip}"><br>
            <input type="text" placeholder="State" value="${user.state}"><br>
            <input type="text" placeholder="Country" value="${user.country}"><br>
            <h4 class="subtitle">Name and Surname</h4>
            <input type="text"  value="${user.getName()}"><br>
            <input type="text"  value="${user.surname}"><br>
    </span>
    <span style="display: inline-block;position: relative;left: 200px;top:-150px">
        <h4>By clicking "Place order" button you confirm that all current<br>information are correct and accept
            all of our terms and condition.<br><br>If your shipping informations are wrong, please<br>
            update right know by overwrite in the shipping information section.</h4><br>
           <form action="placeorder" method="post">
               <form action="minus" method="get">
                <input type="hidden" name="cartTotal" value="${total}">
                <input type="hidden" name="username" value="${user.email}">
                   <button class="placeorderButton">PLACE ORDER</button>
            </form>
        </form>
    </span>

</body>
</html>
