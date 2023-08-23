<%@ page import="com.oracle.wls.shaded.org.apache.xpath.operations.String" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: marcoguerrera
  Date: 31/05/22
  Time: 12:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${item.productname}</title>
</head>
<body>
    <style>
        body {
            background-color: #d1bda1;
        }
        .headerLogo{
            margin-left: 30px;
        }
        .topNavMenu a{
            width: 20%;
            background-color: white;
            resize: both;
            overflow: auto;
            display: flow;
            font-family: "Ribbon-condensed", sans-serif;
            font-size: 18px;
            color: black;
            text-align: center;
            padding: 2px 2px;
            text-decoration: none;
            border-radius: 5px;
        }
        .a1{
            margin-right: 25%;
            margin-left: 5px
        }
        .a2{
            margin-right: 28%;
        }
        .a3{
            margin-right: 25%;
        }
        .topNavMenu a:hover {
            background-color: grey;
            color: white;
        }
        .cartButton{
            position: absolute;
            margin-left: 1150px;
            margin-right: 30px;
            margin-top: 60px;
            margin-bottom: 30px;
            background: none;
            border-style: none;
        }

        .container {
            position: relative;
        }
        .mySlides {
            display: none;
        }
        .cursor {
            cursor: pointer;
        }
        .prev,
        .next {
            cursor: pointer;
            position: absolute;
            top: 40%;
            width: auto;
            padding: 16px;
            margin-top: -50px;
            color: lightgray;
            font-weight: bold;
            font-size: 40px;
            border-radius: 0 3px 3px 0;
            user-select: none;
            -webkit-user-select: none;
        }
        .prev:hover,
        .next:hover {
            background-color: rgba(0, 0, 0, 0.8);
        }
        .next {
            margin-right: 20px;
            right: 0;
            border-radius: 3px 0 0 3px;
        }.demo {
             opacity: 0.6;
         }
        .active,
        .demo:hover {
            opacity: 1;
        }
        .column {
            float: left;
            width: 16.66%;
            height: 20%;
        }
        .row:after {
            content: "";
            display: table;
            clear: both;
        }
        .sizebutton{
            margin-top: 10px;
            padding: 5px 10px;
            color:black;
            background-color: transparent;
            border-style: none;
            font-size: 25px;
            font-family: 'Ribbon-condensed', sans-serif
        }
        .sizebutton:hover{
            background-color:white;
            padding: 5px 10px;
        }
        .sizebutton:focus{
            background-color: white;
            color: black;
        }
        .atcButton{
            background-color: lightgray;
            font-size: 25px;
            padding: 5px 10px;
            margin-top: -480px;
            margin-left: 1120px;
            width: 400px;
            font-family: 'Ribbon-condensed', sans-serif;
            text-align: center;
        }
        .atcButton:focus{
            background-color: palegreen;
        }
        .description{
            margin-top: -300px;
            margin-left: 920px;
            font-family: "Ribbon-condensed", sans-serif;
        }
        .mySlides img{
            margin-top: 40px;
            margin-left: 85px;
            width:80%;
            background-color: white;
            align-content: center;
            border-radius: 15px;
        }
        .row img{
            width:70%;
            border-radius: 15px;
            background-color: white;
            align-content: center;
            margin-left: 250px;
        }
        .footerbar{
            margin-top: 200px;
            alignment: center;
        }



    </style>
    <div class="headerLogo" align="left" >
        <img src="Img/LogoAllungato.png" alt="FantasyBackdoor" widht="1450" height="200" align="center">
        <% if(session.getAttribute("cart")==null){%>
        <a href="Cart.jsp" class="cartButton"><img src="Img/cart-icon.png" border="0px"  width="100px" height="100px"> </a>
        <%}else{%>
        <a href="Cart.jsp" class="cartButton"><img src="Img/cart-icon-full.png" border="0px"  width="100px" height="100px"> </a>
        <%}%>        <div>
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
    <div class="gallery" style="margin-top: 30px;float: left; width: 50%; margin-left: 30px">
        <div class="container">
            <div class="mySlides">
                <img src="${item.img1}">
            </div>
            <div class="mySlides">
                <img src="${item.img2}">
            </div>
            <div class="mySlides">
                <img src="${item.img3}">
            </div>
            <a class="prev" onclick="plusSlides(-1)">❮</a>
            <a class="next" onclick="plusSlides(1)">❯</a><br>
            <div class="row">
                <div class="column">
                    <img class="demo cursor" src="${item.img1}" onclick="currentSlide(1)">
                </div>
                <div class="column">
                    <img class="demo cursor" src="${item.img2}"  onclick="currentSlide(2)">
                </div>
                <div class="column">
                    <img class="demo cursor" src="${item.img3}"  onclick="currentSlide(3)">
                </div>
            </div>
        </div>

        <script>
            let slideIndex = 1;
            showSlides(slideIndex);

            function plusSlides(n) {
                showSlides(slideIndex += n);
            }

            function currentSlide(n) {
                showSlides(slideIndex = n);
            }

            function showSlides(n) {
                let i;
                let slides = document.getElementsByClassName("mySlides");
                let dots = document.getElementsByClassName("demo");
                let captionText = document.getElementById("caption");
                if (n > slides.length) {slideIndex = 1}
                if (n < 1) {slideIndex = slides.length}
                for (i = 0; i < slides.length; i++) {
                    slides[i].style.display = "none";
                }
                for (i = 0; i < dots.length; i++) {
                    dots[i].className = dots[i].className.replace(" active", "");
                }
                slides[slideIndex-1].style.display = "block";
                dots[slideIndex-1].className += " active";
                captionText.innerHTML = dots[slideIndex-1].alt;
            }
        </script>
        </div>
    <c:if test="${item.category == 'W'}">
            <form action="addToCart" method="get">
                <input type="hidden" name="variant" value=${item.variant}>
                <table style="width:30%; margin-top: 50px; margin-left: 1100px">
                    <tr>
                        <td>
                            <input display="none" type="radio" class="sizebutton" name="size" value="36"><p style="font-family: 'Ribbon-condensed', sans-serif; font-size: 25px">36</p>
                        </td>
                        <td>
                            <input type="radio" class="sizebutton" name="size" value="37"><p style="font-family: 'Ribbon-condensed', sans-serif; font-size: 25px">37</p>
                        </td>
                        <td>
                            <input type="radio" class="sizebutton" name="size" value="38"><p style="font-family: 'Ribbon-condensed', sans-serif; font-size: 25px">38</p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" class="sizebutton" name="size" value="39"><p style="font-family: 'Ribbon-condensed', sans-serif; font-size: 25px">39</p>
                        </td>
                        <td>
                            <input type="radio" class="sizebutton" name="size" value="40"><p style="font-family: 'Ribbon-condensed', sans-serif; font-size: 25px">40</p>
                        </td>
                    </tr>
                </table>
                <h3 style="margin-left: 1130px">________________________________________</h3>
                <button type="submit" class="atcButton">Add to cart</button>
            </form>
    </c:if>
    <c:if test="${item.category == 'M'}">
            <form action="addToCart" method="get">
                <input type="hidden" name="variant" value=${item.variant}>
            <table style="width:30%; margin-top: 50px; margin-left: 1100px">
                <tr>
                    <td>
                        <input display="none" type="radio" class="sizebutton" name="size" value="40"><p style="font-family: 'Ribbon-condensed', sans-serif; font-size: 25px">40</p>
                    </td>
                    <td>
                        <input type="radio" class="sizebutton" name="size" value="41"><p style="font-family: 'Ribbon-condensed', sans-serif; font-size: 25px">41</p>
                    </td>
                    <td>
                        <input type="radio" class="sizebutton" name="size" value="42"><p style="font-family: 'Ribbon-condensed', sans-serif; font-size: 25px">42</p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="radio" class="sizebutton" name="size" value="43"><p style="font-family: 'Ribbon-condensed', sans-serif; font-size: 25px">43</p>
                    </td>
                    <td>
                        <input type="radio" class="sizebutton" name="size" value="44"><p style="font-family: 'Ribbon-condensed', sans-serif; font-size: 25px">44</p>
                    </td>
                    <td>
                        <input type="radio" class="sizebutton" name="size" value="45"><p style="font-family: 'Ribbon-condensed', sans-serif; font-size: 25px">45</p>
                    </td>
                </tr>
            </table>
                <h3 style="margin-left: 1130px">________________________________________</h3>
                <button type="submit" class="atcButton">Add to cart</button>
            </form>
    </c:if>
        <div>
            <div class="description">
                <h2 id="atcmessage" align="left" style="margin-top:-400px;font-weight: bold; text-decoration: underline black;color: black; font-family: 'Ribbon-condensed', sans-serif">${message}</h2>
                <h2 style="font-family: 'Ribbon-condensed', sans-serif">PRICE - ${item.price} €</h2>
                <h3>${item.productname} - ${item.category}</h3>
                <p style="font-size: 15px">${item.description}</p>
            </div>
            </div>
        <div class="footerbar">
            <h5><a href="terms.html">Terms. and conditions</a></h5>
        </div>
</body>
</html>
