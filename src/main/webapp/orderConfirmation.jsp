<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head><title>Order Confirmed</title></head>--%>
<%--<body>--%>
<%--<h2>Thank you! Your order has been placed.</h2>--%>
<%--<p>Order ID: #<%= request.getAttribute("orderId") %></p>--%>
<%--<a href="menu">Continue Shopping</a> | <a href="orderHistory">View Order History</a>--%>
<%--</body>--%>
<%--</html>--%>










<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Confirmed</title>

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
            height:100vh;
            display:flex;
            justify-content:center;
            align-items:center;
            background:linear-gradient(135deg,#00c853,#43a047);
        }

        .card{
            width:500px;
            background:rgba(255,255,255,.15);
            backdrop-filter:blur(15px);
            border-radius:20px;
            padding:40px;
            text-align:center;
            color:white;
            box-shadow:0 15px 35px rgba(0,0,0,.3);
        }

        .success-icon{
            font-size:90px;
            color:#fff;
            margin-bottom:20px;
            animation:pop .8s ease;
        }

        @keyframes pop{
            0%{
                transform:scale(0);
            }
            70%{
                transform:scale(1.2);
            }
            100%{
                transform:scale(1);
            }
        }

        h2{
            font-size:32px;
            margin-bottom:15px;
        }

        p{
            font-size:18px;
            margin-bottom:15px;
        }

        .order-id{
            display:inline-block;
            margin:20px 0;
            padding:12px 25px;
            background:white;
            color:#2e7d32;
            border-radius:30px;
            font-size:22px;
            font-weight:bold;
        }

        .buttons{
            margin-top:30px;
            display:flex;
            justify-content:center;
            gap:20px;
            flex-wrap:wrap;
        }

        .btn{
            text-decoration:none;
            padding:14px 25px;
            border-radius:30px;
            font-size:16px;
            font-weight:bold;
            transition:.3s;
        }

        .menu{
            background:#ff9800;
            color:white;
        }

        .history{
            background:#2196F3;
            color:white;
        }

        .btn:hover{
            transform:translateY(-3px);
            box-shadow:0 10px 20px rgba(0,0,0,.3);
        }

        @media(max-width:600px){

            .card{
                width:90%;
            }

            .buttons{
                flex-direction:column;
            }

        }

    </style>

</head>
<body>

<div class="card">

    <i class="fa-solid fa-circle-check success-icon"></i>

    <h2>Order Placed Successfully!</h2>

    <p>
        Thank you for ordering with us.
        Your delicious food is being prepared.
    </p>

    <div class="order-id">
        Order #<%= request.getAttribute("orderId") %>
    </div>

    <div class="buttons">

        <a href="menu" class="btn menu">
            <i class="fa-solid fa-utensils"></i>
            Continue Shopping
        </a>

        <a href="orderHistory" class="btn history">
            <i class="fa-solid fa-clock-rotate-left"></i>
            Order History
        </a>

    </div>

</div>

</body>
</html>