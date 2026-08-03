<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Login</title>--%>
<%--    <link rel="stylesheet"--%>
<%--          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">--%>

<%--    <style>--%>
<%--        *{--%>
<%--            margin:0;--%>
<%--            padding:0;--%>
<%--            box-sizing:border-box;--%>
<%--            font-family:'Poppins',sans-serif;--%>
<%--        }--%>

<%--        body{--%>
<%--            height:100vh;--%>
<%--            display:flex;--%>
<%--            justify-content:center;--%>
<%--            align-items:center;--%>
<%--            background:linear-gradient(135deg,#667eea,#764ba2);--%>
<%--            overflow:hidden;--%>
<%--        }--%>

<%--        body::before,--%>
<%--        body::after{--%>
<%--            content:"";--%>
<%--            position:absolute;--%>
<%--            border-radius:50%;--%>
<%--            background:rgba(255,255,255,.15);--%>
<%--            animation:float 8s infinite ease-in-out;--%>
<%--        }--%>

<%--        body::before{--%>
<%--            width:250px;--%>
<%--            height:250px;--%>
<%--            top:5%;--%>
<%--            left:10%;--%>
<%--        }--%>

<%--        body::after{--%>
<%--            width:350px;--%>
<%--            height:350px;--%>
<%--            bottom:5%;--%>
<%--            right:8%;--%>
<%--            animation-delay:2s;--%>
<%--        }--%>

<%--        @keyframes float{--%>
<%--            50%{--%>
<%--                transform:translateY(-20px);--%>
<%--            }--%>
<%--        }--%>
<%--    </style>--%>
<%--        </head>--%>
<%--<body>--%>
<%--<h2>Login</h2>--%>
<%--<% if (request.getAttribute("error") != null) { %>--%>
<%--<p style="color:red;"><%= request.getAttribute("error") %></p>--%>
<%--<% } %>--%>
<%--<% if (request.getAttribute("message") != null) { %>--%>
<%--<p style="color:green;"><%= request.getAttribute("message") %></p>--%>
<%--<% } %>--%>
<%--<form action="login" method="post" style="border: 1px solid black; background: lightgrey;">--%>
<%--    Email: <input type="email" name="email" required><br>--%>
<%--    Password: <input type="password" name="password" required><br>--%>
<%--    <button type="submit" style="background: blue">Login</button>--%>
<%--</form>--%>
<%--<a href="register.jsp">New user? Register</a>--%>
<%--</body>--%>
<%--</html>--%>








<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>

    <!-- Font Awesome -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

    <style>
        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
            font-family:'Poppins',sans-serif;
        }

        body{
            height:100vh;
            display:flex;
            justify-content:center;
            align-items:center;
            background:linear-gradient(135deg,#667eea,#764ba2);
            overflow:hidden;
        }

        body::before,
        body::after{
            content:"";
            position:absolute;
            border-radius:50%;
            background:rgba(255,255,255,.15);
            animation:float 8s infinite ease-in-out;
        }

        body::before{
            width:250px;
            height:250px;
            top:5%;
            left:10%;
        }

        body::after{
            width:350px;
            height:350px;
            bottom:5%;
            right:8%;
            animation-delay:2s;
        }

        @keyframes float{
            50%{
                transform:translateY(-20px);
            }
        }

        .login-box{
            width:380px;
            padding:40px;
            background:rgba(255,255,255,.15);
            backdrop-filter:blur(18px);
            border-radius:20px;
            border:1px solid rgba(255,255,255,.3);
            box-shadow:0 15px 35px rgba(0,0,0,.3);
            color:white;
        }

        .login-box h2{
            text-align:center;
            margin-bottom:30px;
            font-size:32px;
        }

        .input-box{
            position:relative;
            margin-bottom:20px;
        }

        .input-box input{
            width:100%;
            padding:14px 45px;
            border:none;
            outline:none;
            border-radius:30px;
            background:rgba(255,255,255,.2);
            color:white;
            font-size:16px;
        }

        .input-box input::placeholder{
            color:#eee;
        }

        .input-box i{
            position:absolute;
            left:18px;
            top:50%;
            transform:translateY(-50%);
            color:white;
        }

        .remember{
            display:flex;
            justify-content:space-between;
            margin-bottom:20px;
            font-size:14px;
        }

        .remember a{
            color:white;
            text-decoration:none;
        }

        .remember a:hover{
            text-decoration:underline;
        }

        .btn{
            width:100%;
            padding:14px;
            border:none;
            border-radius:30px;
            background:white;
            color:#6a11cb;
            font-size:17px;
            font-weight:bold;
            cursor:pointer;
            transition:.3s;
        }

        .btn:hover{
            transform:translateY(-3px);
            background:#f2f2f2;
        }

        .register{
            text-align:center;
            margin-top:20px;
        }

        .register a{
            color:white;
            text-decoration:none;
            font-weight:bold;
        }

        .register a:hover{
            text-decoration:underline;
        }
    </style>
</head>
<body>

<div class="login-box">

    <h2>Login</h2>

    <% if(request.getAttribute("error") != null){ %>
    <div class="error-msg">
        <%= request.getAttribute("error") %>
    </div>
    <% } %>

    <% if(request.getAttribute("message") != null){ %>
    <div class="success-msg">
        <%= request.getAttribute("message") %>
    </div>
    <% } %>
    <form action="login" method="post">

        <div class="input-box">
            <i class="fa-solid fa-envelope"></i>
            <input type="email" name="email" placeholder="Enter Email" required>
        </div>

        <div class="input-box">
            <i class="fa-solid fa-lock"></i>
            <input type="password" name="password" placeholder="Enter Password" required>
        </div>

        <div class="remember">
            <label>
                <input type="checkbox"> Remember Me
            </label>

            <a href="forgotPassword.jsp">Forgot Password?</a>
        </div>

        <button type="submit" class="btn">Login</button>

        <div class="register">
            Don't have an account?
            <a href="register.jsp">Register</a>
        </div>

    </form>

</div>

</body>
</html>