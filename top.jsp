<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %><html>
<head>
    <link rel="stylesheet" href="nav.css">
	  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<style>
.logo{
	display: flex;
	align-items: center;
	justify-content: center;
}
</style>
</head>
<base target="_top">
<body>
    <header class="header">
        <div class="logo">
            <a href="http://localhost:8080/Footwear/home.jsp" target="right"><img  src="logo.png" width="120px" height="45px" alt="OUTFEAT"></a>
            <a href="http://localhost:8080/Footwear/home.jsp" target="right">OUTFEAT</a>
        </div>
        <div class="navbar-links">
            <ul>
                <% if (session.getAttribute("username") == null) { %>
                    <li id="loginLink"><a href="login.html" target="_top">LOGIN <i class="fas fa-sign-in-alt"></i></a></li>
                    <li><a href="registration.html"  target="_top">REGISTRATION</a></li>
                <% } else { %>
                    <li><a href="catalogue.jsp" target="right">CATALOGUE <i class="fas fa-bars"></i></a></li>
                    <li><a href="cart.jsp" target="right">CART<i class="fas fa-shopping-cart"></i></a></li>
                    <li><a href="orders.jsp" target="right">MY ORDERS <i class="far fa-clipboard"></i></a></li>
                    <li id="logoutLink" target="_top"><a href="logout.jsp">LOGOUT <i class="fas fa-sign-out-alt"></i></a></li>
                    <li><a style="color:green; font-size:20px;text-transform: capitalize;font-weight:bold;cursor:pointer;"><%= session.getAttribute("username") %> <i class="fas fa-user-circle"></i></a></li>
                <% } %>
            </ul>
        </div>
    </header>
</body>
</html>
