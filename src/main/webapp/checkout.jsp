<%--<%@ page import="java.util.List" %>--%>
<%--<%@ page import="foodapp.dao.model.CartItem" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head><title>Checkout</title></head>--%>
<%--<body>--%>
<%--<h2>Order Summary</h2>--%>
<%--<%--%>
<%--    List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");--%>
<%--    double total = 0;--%>
<%--%>--%>
<%--<ul>--%>
<%--    <%--%>
<%--        if (cart != null) {--%>
<%--            for (CartItem ci : cart) {--%>
<%--                total += ci.getLineTotal();--%>
<%--    %>--%>
<%--    <li><%= ci.getMenuItem().getName() %> x <%= ci.getQuantity() %> = ₹<%= ci.getLineTotal() %></li>--%>
<%--    <% } } %>--%>
<%--</ul>--%>
<%--<h3>Total Payable: ₹<%= total %></h3>--%>

<%--<% if (request.getAttribute("error") != null) { %>--%>
<%--<p style="color:red;"><%= request.getAttribute("error") %></p>--%>
<%--<% } %>--%>

<%--<form action="checkout" method="post">--%>
<%--    Payment Method:--%>
<%--    <select name="paymentMethod">--%>
<%--        <option value="COD">Cash on Delivery</option>--%>
<%--        <option value="CARD">Card</option>--%>
<%--        <option value="UPI">UPI</option>--%>
<%--    </select><br><br>--%>
<%--    <button type="submit">Confirm Order</button>--%>
<%--</form>--%>
<%--</body>--%>
<%--</html>--%>














<%@ page import="java.util.List" %>
<%@ page import="foodapp.dao.model.CartItem" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout</title>

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
            background:linear-gradient(135deg,#6a11cb,#2575fc);
            min-height:100vh;
            display:flex;
            justify-content:center;
            align-items:center;
            padding:30px;
        }

        .container{
            width:700px;
            background:rgba(255,255,255,.18);
            backdrop-filter:blur(15px);
            border-radius:20px;
            padding:35px;
            color:white;
            box-shadow:0 15px 35px rgba(0,0,0,.3);
        }

        h2{
            text-align:center;
            margin-bottom:25px;
            font-size:34px;
        }

        .summary{
            background:white;
            color:#333;
            border-radius:15px;
            padding:20px;
            margin-bottom:25px;
        }

        .summary h3{
            margin-bottom:15px;
            color:#2575fc;
        }

        .summary ul{
            list-style:none;
        }

        .summary li{
            display:flex;
            justify-content:space-between;
            padding:10px 0;
            border-bottom:1px solid #ddd;
        }

        .total{
            margin-top:20px;
            text-align:right;
            font-size:24px;
            color:#FFD54F;
            font-weight:bold;
        }

        .error{
            background:#ffebee;
            color:#d32f2f;
            padding:12px;
            border-radius:10px;
            margin-bottom:20px;
            text-align:center;
        }

        label{
            font-size:18px;
            display:block;
            margin-bottom:10px;
        }

        select{
            width:100%;
            padding:12px;
            border:none;
            border-radius:10px;
            font-size:16px;
            outline:none;
            margin-bottom:25px;
        }

        button{
            width:100%;
            padding:15px;
            border:none;
            border-radius:30px;
            background:#4CAF50;
            color:white;
            font-size:18px;
            cursor:pointer;
            transition:.3s;
        }

        button:hover{
            background:#388E3C;
            transform:translateY(-3px);
        }

        .back{
            display:block;
            text-align:center;
            margin-top:20px;
            color:white;
            text-decoration:none;
            font-weight:bold;
        }

        .back:hover{
            text-decoration:underline;
        }

        @media(max-width:768px){

            .container{
                width:100%;
            }

            .summary li{
                flex-direction:column;
                gap:5px;
            }

        }

    </style>

</head>
<body>

<div class="container">

    <h2>
        <i class="fa-solid fa-credit-card"></i>
        Checkout
    </h2>

    <%
        List<CartItem> cart=(List<CartItem>)session.getAttribute("cart");
        double total=0;
    %>

    <div class="summary">

        <h3>Order Summary</h3>

        <ul>

            <%
                if(cart!=null){
                    for(CartItem ci:cart){
                        total+=ci.getLineTotal();
            %>

            <li>
<span>
    <%= ci.getMenuItem().getName() %> <p>-</p><%= ci.getQuantity() %>
</span>

                <span>
&#8377;<%= ci.getLineTotal() %>
</span>
            </li>

            <%
                    }
                }
            %>

        </ul>

    </div>

    <div class="total">
        Total Payable : &#8377;<%= total %>
    </div>

    <br>

    <%
        if(request.getAttribute("error")!=null){
    %>

    <div class="error">
        <%= request.getAttribute("error") %>
    </div>

    <%
        }
    %>

    <form action="checkout" method="post">

        <label>
            <i class="fa-solid fa-wallet"></i>
            Select Payment Method
        </label>

        <select name="paymentMethod">

            <option value="COD">Cash on Delivery</option>

            <option value="CARD">Credit / Debit Card</option>

            <option value="UPI">UPI</option>

        </select>

        <button type="submit">
            <i class="fa-solid fa-circle-check"></i>
            Confirm Order
        </button>

    </form>

    <a href="cart.jsp" class="back">
        <i class="fa-solid fa-arrow-left"></i>
        Back to Cart
    </a>

</div>

</body>
</html>