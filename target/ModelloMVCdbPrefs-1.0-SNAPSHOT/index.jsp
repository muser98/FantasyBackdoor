<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=10, user-scalable=yes">
    <link rel="stylesheet" href="CSS/Page.css">
<style>
    .container-fluid{
        size: auto;
        all: unset;
    }
        .slideshow-container{
            display:inline-block;
            margin-left: 50px;
            margin-top: -80px;
        }
        .cartButton{
            float: right;
            width: 100%;
            height: auto;
            margin-left: 900px;
            margin-top: -20px;
        }
        .cartButton img{
            width: 100px;
            height: auto;
        }
        .headerLogo{
            width: 100%;
            margin-left: 30px;
        }
        .topNavMenu{
            width: 100%;
        }
        .topNavMenu a{
            width: fit-content;
            background-color: white;
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
            margin-right: 25%;
        }
        .a3{
            margin-top: 20px;
            margin-right: 25%;
        }
        .a4{
            margin-top: 20px;
        }
        .topNavMenu a:hover {
            background-color: grey;
            color: white;
        }
        .searchbar{
            width: 100%;
            margin-top:40px;
            width: 350px;
            box-sizing: border-box;
            border: 2px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
            background-color: white;
            background-image: url('https://cdn.iconscout.com/icon/premium/png-256-thumb/search-find-magnifying-glass-1-38488.png');
            background-size: 20px;
            background-position: 10px;
            background-repeat: no-repeat;
            padding: 12px 20px 12px 40px;
        }
        .ui-corner-right{
            float: left;
            width: 33.33%;
            max-width: 250px;
            margin-top: 10px;
            align-content: center;
            margin-left: 5px;
            font-size: 20px;
        }
        .cartButton{
            position: absolute;
            margin-left: 1150px;
            margin-right: 30px;
            margin-top: 80px;
            background: none;
            border-style: none;
        }

        .homepageTitle h3{
            margin-left: 50px;
        }
        .homepageTitle p{
            margin-left: 50px;
            max-width: 180px;
        }
        .termsBtn{
            border-radius: 4px;
            margin-top:50px;
            margin-left: 50px;
            width: 400px;
            height: 30px;
            font-size: 18px;
        }
</style>
        <title>FantasyBackdoor - Online Shop</title>
    </head>
<body>
<div class="container-fluid" style="border-style: solid; border-width:0px;">
    <div class="headerLogo" align="left" >
        <img class="widelogo" src="Img/LogoAllungato.png" alt="FantasyBackdoor" widht="1450" height="200" align="center">
        <% if(session.getAttribute("cart")==null){%>
        <a href="Cart.jsp" class="cartButton"><img src="Img/cart-icon.png" border="0px"  width="100px" height="100px"> </a>
        <%}else{%>
        <a href="Cart.jsp" class="cartButton"><img src="Img/cart-icon-full.png" border="0px"  width="100px" height="100px"> </a>
        <%}%>
        </div>
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

    <div style="margin-top: 30px; margin-left: 60px">
        <div class="ui-corner-right" >
            <h3 style="font-family: 'Ribbon-condensed', sans-serif">Why FantasyBACKDOOR ?</h3>
            <p style="font-family: 'Ribbon-condensed', sans-serif">
                Fantasy because everyone once in life have dreamed about his sneaker GRAIL*, and our mission is to fulfill our clients whishes.
                Backdoor is a misuse of the term that describes the under-the-counter business of limited edition products that we disapprove of and make fun of.
            </p><br><br><p style="font-family: 'Ribbon-condensed', sans-serif; font-size: 13px">A “grail” is a pair of sneakers that someone wants more than any other pair.</p>
        </div>
        <div class="bar2">
            <form action="search" method="get" style="margin-left:1300px; margin-bottom: -60px">
                <input style=" margin-top: 20px; margin-left: 70px;" id="searchBar" name="searchInput" class="searchbar" type="search" width="100px" height="40px" placeholder="Search...">
                <a href="terms.html"><button type= "button" class="termsBtn" type="submit">Terms and Conditions</button></a>
            </form>
        </div>
        <div class="slideshow-container">
            <img class="mySlides" src="Img/slide1.jpg" style="width:1000px; height: 550px">
            <img class="mySlides" src="Img/slide2.png" style="width:1000px; height: 550px">
            <img class="mySlides" src="Img/slide3.png" style="width:1000px; height: 550px">
        </div>
    </div>
</div>

    <script>
        var myIndex = 0;
        carousel();

        function carousel() {
            var i;
            var x = document.getElementsByClassName("mySlides");
            for (i = 0; i < x.length; i++) {
                x[i].style.display = "none";
            }
            myIndex++;
            if (myIndex > x.length) {myIndex = 1}
            x[myIndex-1].style.display = "block";
            setTimeout(carousel, 2500); // Change image every 2.5 seconds
        }
    </script>


</body>
</html>