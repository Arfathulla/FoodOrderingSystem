
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head><title>Online Food Ordering</title></head>--%>
<%--<body>--%>
<%--<h1>Welcome to OnlineFood</h1>--%>
<%--<a href="login.jsp">Login</a> | <a href="register.jsp">Register</a>--%>
<%--</body>--%>
<%--</html>--%>








<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Food Ordering</title>

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
            background:
                    linear-gradient(rgba(0,0,0,.55),rgba(0,0,0,.55)),
                    url("https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=1500&q=80");
            background-size:cover;
            background-position:center;
        }

        .container{
            text-align:center;
            color:white;
            padding:50px;
            width:500px;
            background:rgba(255,255,255,.12);
            backdrop-filter:blur(12px);
            border-radius:20px;
            box-shadow:0 15px 35px rgba(0,0,0,.4);
        }

        .container h1{
            font-size:45px;
            margin-bottom:15px;
        }

        .container p{
            font-size:18px;
            margin-bottom:35px;
            color:#f1f1f1;
        }

        .buttons{
            display:flex;
            justify-content:center;
            gap:20px;
        }

        .btn{
            text-decoration:none;
            padding:14px 35px;
            border-radius:30px;
            font-size:18px;
            font-weight:bold;
            transition:.3s;
        }

        .login{
            background:#ff9800;
            color:white;
        }

        .register{
            background:#4CAF50;
            color:white;
        }

        .btn:hover{
            transform:translateY(-5px);
            box-shadow:0 10px 20px rgba(0,0,0,.4);
        }

        .food-icon{
            font-size:70px;
            color:#FFD54F;
            margin-bottom:20px;
        }

        @media(max-width:600px){

            .container{
                width:90%;
                padding:35px;
            }

            .container h1{
                font-size:34px;
            }

            .buttons{
                flex-direction:column;
            }

        }

    </style>

</head>
<body>

<div class="container">

    <i class="fa-solid fa-burger food-icon"></i>

    <h1>Online Food Ordering</h1>

    <p>
        Delicious food delivered to your doorstep.
        Order your favorite meals anytime, anywhere.
    </p>

    <div class="buttons">

        <a href="login.jsp" class="btn login">
            <i class="fa-solid fa-right-to-bracket"></i>
            Login
        </a>

        <a href="register.jsp" class="btn register">
            <i class="fa-solid fa-user-plus"></i>
            Register
        </a>

    </div>

</div>

</body>
</html>




