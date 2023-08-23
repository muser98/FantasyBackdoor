<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%--
  Created by IntelliJ IDEA.
  User: Marco Guerrera
  Date: 13/07/2022
  Time: 17:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin-User Management</title>
    <link rel="stylesheet" href="CSS/Page.css">
    <style>
    body{
    font-family: "Ribbon-condensed", sans-serif;
    }
    td{
        overflow: auto;
        border-bottom-style: solid;
        max-height: 200px;
        max-width: 150px;
        font-size: 13x;
        border-spacing: 10px;
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
    <a href="listproduct"><button>List Product</button></a>
</div><br>
    <table align="center" style="border-spacing: 10px;">
        <tr>
            <th>Name</th>
            <th>Surname</th>
            <th>Address1</th>
            <th>Address2</th>
            <th>City</th>
            <th>State</th>
            <th>ZipCode</th>
            <th>Country</th>
            <th>Email</th>
            <th>Password</th>
            <th>User_ID</th>
        </tr>
        <c:forEach items="${userList}" var="user">
            <tr class="user">
                    <td>${user.name}</td>
                    <td>${user.surname}</td>
                    <td>${user.address1}</td>
                    <td>${user.address2}</td>
                    <td>${user.city}</td>
                    <td>${user.state}</td>
                    <td>${user.zip}</td>
                    <td>${user.country}</td>
                    <td>${user.email}</td>
                    <td>${user.password}</td>
                    <td>${user.id}</td>
                    <td>
                        <form action="deleteuser" method="get">
                            <input type="hidden" name="id" value="${user.id}">
                            <input type="hidden" name="mail" value="${user.email}">
                           <button type="submit">delete<br>user</button></a>
                        </form>
                    </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
