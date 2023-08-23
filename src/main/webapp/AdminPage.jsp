<%--
  Created by IntelliJ IDEA.
  User: Marco Guerrera
  Date: 13/07/2022
  Time: 17:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<style>
    body{
        background-color: #d1bda1;
        margin:0;
        font-family: "Ribbon-condensed", sans-serif;
    }
    .welcome-message{
        margin-top: 40px;
    }
    .admin-action{
        margin-left: 30px;
        margin-top: 50px;
    }
    .admin-action button{
        margin-top: 40px;
        margin-right: 300px;
        padding: 10px;
    }

</style>
<head>
    <title>Admin Page</title>
</head>
<body>
    <div class="welcome-message" align="center">
        <h1>Hi ${admin.name} - passcode number: ${admin.passcode} and welcome to site manager section</h1>
        <a href="index.jsp" ><button>CLICK TO HOMEPAGE</button></a>
    </div>
    <div class="admin-action">
        <a href="listUser"><button style="margin-left: 450px;">User Management</button></a>
        <a href="insertProduct.jsp"><button>Add Product</button></a>
        <a href="listproduct"><button>List Database Product</button></a>
    </div>

</body>
</html>
