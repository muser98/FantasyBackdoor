<%--
  Created by IntelliJ IDEA.
  User: Marco Guerrera
  Date: 14/07/2022
  Time: 17:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<html>
<head>
    <title>Product List - page</title>
    <link rel="stylesheet" href="CSS/Page.css">
    <style>
        table{
            margin-left: 70px;
        }
        td{
            overflow: auto;
            border-bottom-style: solid;
            max-height: 200px;
            max-width: 150px;
            font-size: 13px;

        }
        p{
            font-size: 15px;
            font-weight: bold;
            text-decoration: underline;
        }
        body{
            font-family: "Ribbon-condensed", sans-serif;
        }
        .welcome-message{
            margin-top: 40px;
        }
        .admin-action{
            margin-left: 55px;
            margin-top: 50px;
        }
        .admin-action button{
            margin-right: 300px;
            padding: 10px;
        }

    </style>
</head>
<body>
<div class="welcome-message" align="center">
    <h1>Hi ${admin.name} - passcode number: ${admin.passcode} and welcome to product manager section</h1>
    <a href="index.jsp" ><button>CLICK TO HOMEPAGE</button></a>
</div>
<div class="admin-action">
    <a href="AdminPage.jsp"><button style="margin-left: 450px;">Admin Page</button></a>
    <a href="insertProduct.jsp"><button>Add Product</button></a>
    <a href="listUser"><button>User Management</button></a>
</div><br>
<table>
    <c:forEach items="${productlist}" var="product">
        <tr class="item">
            <td><p>PRODUCT NAME:</p>${product.productname}</td>
            <td><p>PRODUCT VARIANT_id:</p>${product.variant}</td>
            <td><p>PRODUCT PRICE:</p>${product.price}</td>
            <td><p>PRODUCT QUANTITY: </p>${product.qty}</td>
            <td><p>PRODUCT BRAND: </p>${product.brand}</td>
            <td><p>PRODUCT CATEGORY:</p>${product.category}</td>
            <td><p>PRODUCT IMG1:</p>${product.img1}</td>
            <td><p>PRODUCT IMG2:</p>${product.img2}</td>
            <td><p>PRODUCT IMG3:</p>${product.img3}</td>
            <td><p>PRODUCT SIZE:</p>${product.size}</td>
            <td><p>PRODUCT DESCRIPTION:</p>${product.description}</td>
            <td>
            <form action="removeListItem" method="get">
                <input type="hidden" name="id" value="${product.variant}">
                <button type="submit">delete<br>product</button></a>
            </form>
            <form action="addqty" method="get">
                <input type="hidden" name="qty" value="${product.qty}">
                <input type="hidden" name="id2" value="${product.variant}">
                <button type="submit">Quantity<br>+1</button></a>
            </form>
            </td>
    </tr>
    </c:forEach>
</body>
</html>
