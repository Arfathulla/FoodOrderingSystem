<%--<%@ page import="java.util.List" %>--%>
<%--<%@ page import="foodapp.dao.model.CartItem" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head><title>Your Cart</title></head>--%>
<%--<body>--%>
<%--<h2>Your Cart</h2>--%>
<%--<%--%>
<%--    List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");--%>
<%--    double total = 0;--%>
<%--%>--%>
<%--<table border="1">--%>
<%--    <tr><th>Item</th><th>Price</th><th>Qty</th><th>Subtotal</th><th>Action</th></tr>--%>
<%--    <%--%>
<%--        if (cart != null) {--%>
<%--            for (CartItem ci : cart) {--%>
<%--                total += ci.getLineTotal();--%>
<%--    %>--%>
<%--    <tr>--%>
<%--        <td><%= ci.getMenuItem().getName() %></td>--%>
<%--        <td>₹<%= ci.getMenuItem().getPrice() %></td>--%>
<%--        <td><%= ci.getQuantity() %></td>--%>
<%--        <td>₹<%= ci.getLineTotal() %></td>--%>
<%--        <td>--%>
<%--            <form action="removeFromCart" method="post" style="display:inline;">--%>
<%--                <input type="hidden" name="itemId" value="<%= ci.getMenuItem().getItemId() %>">--%>
<%--                <button type="submit">Remove</button>--%>
<%--            </form>--%>
<%--        </td>--%>
<%--    </tr>--%>
<%--    <%--%>
<%--            }--%>
<%--        }--%>
<%--    %>--%>
<%--</table>--%>
<%--<h3>Total: ₹<%= total %></h3>--%>
<%--<% if (cart != null && !cart.isEmpty()) { %>--%>
<%--<form action="checkout" method="get">--%>
<%--    <button type="submit">Proceed to Checkout</button>--%>
<%--</form>--%>
<%--<% } %>--%>
<%--<a href="menu">Back to Menu</a>--%>
<%--</body>--%>
<%--</html>--%>



















<%@ page import="java.util.List" %>
<%@ page import="foodapp.dao.model.CartItem" %>
<%@ page import="foodapp.dao.servlet.RemoveFromCartServlet" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Cart</title>

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

    <style>

        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
            font-family:Arial, Helvetica, sans-serif;
        }

        body{
            background:linear-gradient(135deg,#ff9a9e,#fad0c4);
            min-height:100vh;
            padding:30px;
        }

        .container{
            max-width:1100px;
            margin:auto;
        }

        h1{
            text-align:center;
            color:white;
            margin-bottom:30px;
        }

        .card{
            background:rgba(255,255,255,.18);
            backdrop-filter:blur(15px);
            border-radius:20px;
            padding:25px;
            box-shadow:0 10px 25px rgba(0,0,0,.25);
        }

        table{
            width:100%;
            border-collapse:collapse;
            background:white;
            border-radius:15px;
            overflow:hidden;
        }

        th{
            background:#ff5722;
            color:white;
            padding:15px;
        }

        td{
            padding:15px;
            text-align:center;
            border-bottom:1px solid #ddd;
        }

        tr:hover{
            background:#fff5f2;
        }

        .remove-btn{
            background:#f44336;
            color:white;
            border:none;
            padding:8px 16px;
            border-radius:8px;
            cursor:pointer;
            transition:.3s;
        }

        .remove-btn:hover{
            background:#d32f2f;
        }

        .total{
            text-align:right;
            margin-top:20px;
            font-size:24px;
            color:white;
            font-weight:bold;
        }

        .buttons{
            margin-top:30px;
            display:flex;
            justify-content:space-between;
            flex-wrap:wrap;
            gap:15px;
        }

        .btn{
            text-decoration:none;
            padding:14px 25px;
            border-radius:10px;
            font-size:16px;
            font-weight:bold;
            transition:.3s;
            border:none;
            cursor:pointer;
        }

        .checkout{
            background:#4CAF50;
            color:white;
        }

        .checkout:hover{
            background:#388E3C;
        }

        .menu{
            background:#2196F3;
            color:white;
        }

        .menu:hover{
            background:#1565C0;
        }

        .empty{
            text-align:center;
            font-size:20px;
            color:white;
            padding:30px;
        }

        @media(max-width:768px){

            table{
                display:block;
                overflow-x:auto;
            }

            .buttons{
                flex-direction:column;
            }

            .btn{
                width:100%;
            }

        }

    </style>

</head>
<body>

<div class="container">

    <h1>
        <i class="fa-solid fa-cart-shopping"></i>
        Your Shopping Cart
    </h1>

    <div class="card">

        <%
            List<CartItem> cart=(List<CartItem>)session.getAttribute("cart");
            double total=0;
        %>

        <% if(cart!=null && !cart.isEmpty()){ %>

        <table>

            <tr>
                <th>Food Item</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Subtotal</th>
                <th>Action</th>
            </tr>

            <%
                for(CartItem ci:cart){
                    total+=ci.getLineTotal();
            %>

            <tr>

                <td>
                    <%= ci.getMenuItem().getName() %>
                </td>

                <td>
                    &#8377;<%= ci.getMenuItem().getPrice() %>
                </td>

                <td>
                    <%= ci.getQuantity() %>
                </td>

                <td>
                    &#8377;<%= ci.getLineTotal() %>
                </td>

                <td>

                    <form action="removeFromCart" method="post">

                        <input type="hidden"
                               name="itemId"
                               value="<%= ci.getMenuItem().getItemId() %>">

                        <button class="remove-btn" type="submit">
                            <i class="fa-solid fa-trash"></i>
                            Remove
                        </button>

                    </form>

                </td>

            </tr>

            <%
                }
            %>

        </table>

        <div class="total">
            Grand Total : &#8377;<%= total %>
        </div>

        <div class="buttons">

            <form action="checkout" method="get">

                <button class="btn checkout" type="submit">
                    <i class="fa-solid fa-credit-card"></i>
                    Proceed to Checkout
                </button>

            </form>

            <a href="menu" class="btn menu">
                <i class="fa-solid fa-utensils"></i>
                Back to Menu
            </a>

        </div>

        <% } else { %>

        <div class="empty">

            <i class="fa-solid fa-cart-shopping"
               style="font-size:70px;margin-bottom:20px;"></i>

            <h2>Your cart is empty!</h2>

            <br>

            <a href="menu" class="btn menu">
                Start Ordering
            </a>

        </div>

        <% } %>

    </div>

</div>

</body>
</html>