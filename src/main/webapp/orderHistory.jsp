<%--<%@ page import="java.util.List" %>--%>
<%--<%@ page import="foodapp.dao.model.Order" %>--%>
<%--<%@ page import="foodapp.dao.model.OrderItem" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head><title>Order History</title></head>--%>
<%--<body>--%>
<%--<h2>Your Past Orders</h2>--%>
<%--<%--%>
<%--    List<Order> orders = (List<Order>) request.getAttribute("orders");--%>
<%--    if (orders != null) {--%>
<%--        for (Order o : orders) {--%>
<%--%>--%>
<%--<div style="border:1px solid #ccc; margin:10px; padding:10px;">--%>
<%--    <strong>Order #<%= o.getOrderId() %></strong> — Status: <%= o.getStatus() %><br>--%>
<%--    Date: <%= o.getOrder_date() %><br>--%>
<%--    Total: ₹<%= o.getTotal_amount() %>--%>
<%--    <ul>--%>
<%--        <% for (OrderItem oi : o.getOrderItems()) { %>--%>
<%--        <li><%= oi.getItemName() %> x <%= oi.getQuantity() %> = ₹<%= oi.getLineTotal() %></li>--%>
<%--        <% } %>--%>
<%--    </ul>--%>
<%--</div>--%>
<%--<% } } %>--%>
<%--<a href="menu">Back to Menu</a>--%>
<%--</body>--%>
<%--</html>--%>
















<%@ page import="java.util.List" %>
<%@ page import="foodapp.dao.model.Order" %>
<%@ page import="foodapp.dao.model.OrderItem" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order History</title>

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
            background:linear-gradient(135deg,#ff9966,#ff5e62);
            min-height:100vh;
            padding:30px;
        }

        .container{
            max-width:1000px;
            margin:auto;
        }

        h1{
            text-align:center;
            color:white;
            margin-bottom:30px;
            font-size:38px;
        }

        .order-card{
            background:rgba(255,255,255,.18);
            backdrop-filter:blur(15px);
            border-radius:20px;
            padding:25px;
            margin-bottom:25px;
            color:white;
            box-shadow:0 12px 25px rgba(0,0,0,.25);
        }

        .header{
            display:flex;
            justify-content:space-between;
            align-items:center;
            flex-wrap:wrap;
            margin-bottom:15px;
        }

        .order-id{
            font-size:22px;
            font-weight:bold;
        }

        .status{
            background:#4CAF50;
            padding:8px 18px;
            border-radius:20px;
            font-weight:bold;
        }

        .date,
        .total{
            margin:8px 0;
            font-size:17px;
        }

        .items{
            margin-top:20px;
            background:white;
            color:#333;
            border-radius:12px;
            padding:15px;
        }

        .items h3{
            margin-bottom:10px;
            color:#ff5722;
        }

        .items ul{
            list-style:none;
        }

        .items li{
            display:flex;
            justify-content:space-between;
            padding:10px 0;
            border-bottom:1px solid #ddd;
        }

        .back-btn{
            display:inline-block;
            margin-top:20px;
            text-decoration:none;
            background:#2196F3;
            color:white;
            padding:14px 30px;
            border-radius:30px;
            transition:.3s;
            font-weight:bold;
        }

        .back-btn:hover{
            background:#1565C0;
            transform:translateY(-3px);
        }

        .empty{
            text-align:center;
            color:white;
            font-size:22px;
            margin-top:100px;
        }

        @media(max-width:768px){

            .header{
                flex-direction:column;
                align-items:flex-start;
                gap:10px;
            }

            .items li{
                flex-direction:column;
                gap:5px;
            }

        }

    </style>

</head>
<body>

<div class="container">

    <h1>
        <i class="fa-solid fa-clock-rotate-left"></i>
        Order History
    </h1>

    <%
        List<Order> orders=(List<Order>)request.getAttribute("orders");

        if(orders!=null && !orders.isEmpty()){

            for(Order o:orders){
    %>

    <div class="order-card">

        <div class="header">

            <div class="order-id">
                <i class="fa-solid fa-receipt"></i>
                Order #<%= o.getOrderId() %>
            </div>

            <div class="status">
                <%= o.getStatus() %>
            </div>

        </div>

        <div class="date">
            <i class="fa-solid fa-calendar-days"></i>
            <strong>Date:</strong> <%= o.getOrder_date() %>
        </div>

        <div class="total">
            <i class="fa-solid fa-indian-rupee-sign"></i>
            <strong>Total:</strong> &#8377;<%= o.getTotal_amount() %>
        </div>

        <div class="items">

            <h3>
                <i class="fa-solid fa-utensils"></i>
                Ordered Items
            </h3>

            <ul>

                <%
                    for(OrderItem oi:o.getOrderItems()){
                %>

                <li>

<span>
<%= oi.getItemName() %> - <%= oi.getQuantity() %>
</span>

                    <span>
&#8377;<%= oi.getLineTotal() %>
</span>

                </li>

                <%
                    }
                %>

            </ul>

        </div>

    </div>

    <%
        }

    }else{
    %>

    <div class="empty">

        <i class="fa-solid fa-cart-shopping"
           style="font-size:80px;margin-bottom:20px;"></i>

        <h2>No Orders Found</h2>

        <p>You haven't placed any orders yet.</p>

    </div>

    <%
        }
    %>

    <div style="text-align:center;">

        <a href="menu" class="back-btn">
            <i class="fa-solid fa-arrow-left"></i>
            Back to Menu
        </a>

    </div>

</div>

</body>
</html>