<%--
  Created by IntelliJ IDEA.
  User: Marco Guerrera
  Date: 14/07/2022
  Time: 11:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Insert Produce - page</title>
    <link rel="stylesheet" href="CSS/Page.css">
    <style>
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
        .insert-form{
            margin-left: 150px;
            margin-top: 50px;
            font-size: 19px;
            margin-left: -10px;
        }
        .insert-form input{
            margin-bottom: 5px;
            font-size: 15px;
        }
    </style>
</head>
<body>
    <div class="welcome-message" align="center">
        <h1>Hi ${admin.name} - passcode number: ${admin.passcode} and welcome to the adding product section</h1>
        <a href="index.jsp"><button style="padding: 5px">CLICK TO HOMEPAGE</button></a>
    </div>
    <div class="admin-action">
        <a href="AdminPage.jsp"><button style="margin-left: 450px;">Admin Page</button></a>
        <a href="listproduct"><button>List Product</button></a>
        <a href="listUser"><button>User Management</button></a>
    </div>
    <div class="insert-form" align="center">
        <h4>Insert here product information</h4>
        <form action="insertproduct" method="post">
            <input type="text" name="product_name" placeholder="Product Name" onkeyup="this.value = this.value.toUpperCase();"><br>
            <input type="text" name="product_variant" placeholder="Product VariantID"onkeyup="this.value = this.value.toUpperCase();"><br>
            <input type="text" name="product_price" placeholder="Product price" onkeyup="this.value = this.value.toString().replace(',','.');"><br>
            <input type="text" name="product_qty" placeholder="Product Quantity"><br>
            <input type="text" name="product_brand" placeholder="Product Brand"onkeyup="this.value = this.value.toUpperCase();"><br>
            <input type="radio" name="product_category" id="M" value="M"><label for="M">M</label>
            <input type="radio" name="product_category" id="W" value="W"><label for="W">W</label><br>
            <input type="url" name="product_img1" placeholder="Product Image 1 url"><br>
            <input type="url" name="product_img2" placeholder="Product Image 2 url"><br>
            <input type="url" name="product_img3" placeholder="Product Image 3 url"><br>
            <label for="sizes">Choose a size:</label>
            <select name="size" id="sizes">
                <option value="36">36</option>
                <option value="37">37</option>
                <option value="38">38</option>
                <option value="39">39</option>
                <option value="40">40</option>
                <option value="41">41</option>
                <option value="42">42</option>
                <option value="43">43</option>
                <option value="44">44</option>
                <option value="45">45</option>
                <option value="46">46</option>
            </select><br>
            <input type="text" width="50px" height="30px" name="product_description" placeholder="Product Description"><br>
            <input type="submit" value="Add product">
        </form>
    </div>
</body>
</html>
