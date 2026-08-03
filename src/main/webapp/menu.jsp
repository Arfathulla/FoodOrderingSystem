<%--<%@ page import="java.util.List" %>--%>
<%--<%@ page import="foodapp.dao.model.MenuItem" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Menu</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<h2>Our Menu</h2>--%>

<%--<% if (session.getAttribute("user") == null) { %>--%>
<%--<p><a href="login.jsp">Login</a> to place an order</p>--%>
<%--<% } else { %>--%>
<%--<p>Welcome, <%= ((foodapp.dao.model.User) session.getAttribute("user")).getName() %>!--%>
<%--    <a href="logout">Logout</a> |--%>
<%--    <a href="cart.jsp">View Cart</a> |--%>
<%--    <a href="orderHistory">Order History</a>--%>
<%--</p>--%>
<%--<% } %>--%>

<%--<table border="1" cellpadding="8">--%>
<%--    <tr>--%>
<%--        <th>Item</th>--%>
<%--        <th>Description</th>--%>
<%--        <th>Price</th>--%>
<%--        <th>Category</th>--%>
<%--        <th>Action</th>--%>
<%--    </tr>--%>
<%--    <%--%>
<%--        List<MenuItem> menuItems = (List<MenuItem>) request.getAttribute("menuItems");--%>
<%--        if (menuItems != null) {--%>
<%--            for (MenuItem item : menuItems) {--%>
<%--    %>--%>
<%--    <tr>--%>
<%--        <td><%= item.getName() %></td>--%>
<%--        <td><%= item.getDescription() %></td>--%>
<%--        <td>₹<%= item.getPrice() %></td>--%>
<%--        <td><%= item.getCategory() %></td>--%>
<%--        <td>--%>
<%--            <form action="cart" method="post">--%>
<%--                <input type="hidden" name="itemId" value="<%= item.getItemId() %>">--%>
<%--                <input type="number" name="quantity" value="1" min="1" style="width:50px;">--%>
<%--                <button type="submit">Add to Cart</button>--%>
<%--            </form>--%>
<%--        </td>--%>
<%--    </tr>--%>
<%--    <%--%>
<%--        }--%>
<%--    } else {--%>
<%--    %>--%>
<%--    <tr><td colspan="5">No menu items found. Ask an admin to add some.</td></tr>--%>
<%--    <%--%>
<%--        }--%>
<%--    %>--%>
<%--</table>--%>
<%--</body>--%>
<%--</html>--%>














<%@ page import="java.util.List" %>
<%@ page import="foodapp.dao.model.MenuItem" %>
<%@ page import="foodapp.dao.model.User" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Food Menu</title>

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

    <style>

        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
            font-family:Arial,Helvetica,sans-serif;
        }

        body{
            background:linear-gradient(135deg,#ff9966,#ff5e62);
            min-height:100vh;
        }

        /* Navbar */

        .navbar{
            display:flex;
            justify-content:space-between;
            align-items:center;
            padding:18px 8%;
            background:rgba(255,255,255,.15);
            backdrop-filter:blur(12px);
            color:white;
            box-shadow:0 5px 15px rgba(0,0,0,.2);
        }

        .logo{
            font-size:30px;
            font-weight:bold;
        }

        .logo i{
            color:#FFD54F;
        }

        .nav-links{
            display:flex;
            gap:15px;
            flex-wrap:wrap;
        }

        .nav-links a{
            text-decoration:none;
            color:white;
            font-weight:bold;
            padding:10px 18px;
            border-radius:25px;
            transition:.3s;
        }

        .nav-links a:hover{
            background:white;
            color:#ff5722;
        }

        /* Heading */

        .heading{
            text-align:center;
            color:white;
            margin:35px 0;
        }

        .heading h1{
            font-size:42px;
        }

        .heading p{
            margin-top:10px;
            font-size:18px;
        }

        /* Cards */

        .container{
            width:90%;
            max-width:1200px;
            margin:auto;
            display:grid;
            grid-template-columns:repeat(auto-fit,minmax(320px,1fr));
            gap:25px;
            padding-bottom:40px;
        }

        .card{
            background:rgba(255,255,255,.18);
            backdrop-filter:blur(15px);
            border-radius:20px;
            padding:25px;
            color:white;
            box-shadow:0 10px 25px rgba(0,0,0,.25);
            transition:.3s;
        }

        .card:hover{
            transform:translateY(-8px);
        }

        .card h2{
            margin-bottom:10px;
        }

        .description{
            color:#f5f5f5;
            min-height:50px;
        }

        .price{
            font-size:24px;
            color:#FFD54F;
            font-weight:bold;
            margin:15px 0;
        }

        .category{
            display:inline-block;
            background:white;
            color:#ff5722;
            padding:6px 15px;
            border-radius:20px;
            font-weight:bold;
            margin-bottom:15px;
        }

        form{
            display:flex;
            gap:10px;
            align-items:center;
        }

        input[type=number]{
            width:70px;
            padding:10px;
            border:none;
            border-radius:8px;
            outline:none;
        }

        button{
            flex:1;
            border:none;
            padding:12px;
            background:#4CAF50;
            color:white;
            border-radius:10px;
            cursor:pointer;
            font-size:15px;
            transition:.3s;
        }

        button:hover{
            background:#388E3C;
        }

        .login-box{
            text-align:center;
            margin:25px;
            color:white;
        }

        .login-btn{
            color:white;
            text-decoration:none;
            font-weight:bold;
        }

        .login-btn:hover{
            text-decoration:underline;
        }

        .empty{
            grid-column:1/-1;
            text-align:center;
            color:white;
            font-size:22px;
        }

        @media(max-width:768px){

            .navbar{
                flex-direction:column;
                gap:15px;
            }

            .heading h1{
                font-size:32px;
            }

        }

    </style>

</head>
<body>

<div class="navbar">

    <div class="logo">
        <i class="fa-solid fa-utensils"></i>
        OnlineFood
    </div>

    <% if(session.getAttribute("user")==null){ %>

    <div class="nav-links">
        <a href="login.jsp"><i class="fa-solid fa-right-to-bracket"></i> Login</a>
        <a href="register.jsp"><i class="fa-solid fa-user-plus"></i> Register</a>
    </div>

    <% } else { %>

    <div class="nav-links">

<span style="padding:10px;">
Welcome,
<b><%= ((User)session.getAttribute("user")).getName() %></b>
</span>

        <a href="cart.jsp">
            <i class="fa-solid fa-cart-shopping"></i> Cart
        </a>

        <a href="orderHistory">
            <i class="fa-solid fa-clock-rotate-left"></i> Orders
        </a>

        <a href="logout">
            <i class="fa-solid fa-right-from-bracket"></i> Logout
        </a>

    </div>

    <% } %>

</div>

<div class="heading">

    <h1><i class="fa-solid fa-utensils"></i>Our Delicious Menu</h1>

    <p>Freshly prepared meals made with love.</p>

</div>

<% if(session.getAttribute("user")==null){ %>

<div class="login-box">

    Please
    <a class="login-btn" href="login.jsp">Login</a>
    to order your favorite food.

</div>

<% } %>

<div class="container">

    <%

        List<MenuItem> menuItems=(List<MenuItem>)request.getAttribute("menuItems");

        if(menuItems!=null){

            for(MenuItem item:menuItems){

    %>

    <div class="card">

        <h2>
            <%= item.getName() %>
        </h2>

        <p class="description">
            <%= item.getDescription() %>
        </p>

        <div class="price">
            &#8377;<%= item.getPrice() %>
        </div>

        <div class="category">
            <%= item.getCategory() %>
        </div>

        <form action="cart" method="post">

            <input type="hidden"
                   name="itemId"
                   value="<%= item.getItemId() %>">

            <input type="number"
                   name="quantity"
                   value="1"
                   min="1">

            <button type="submit">

                <i class="fa-solid fa-cart-plus"></i>

                Add to Cart

            </button>

        </form>

    </div>

    <%

        }

    }else{

    %>

    <div class="empty">

        <i class="fa-solid fa-face-frown"
           style="font-size:70px;"></i>

        <br><br>

        No menu items available.

    </div>

    <%

        }

    %>

</div>

</body>
</html>