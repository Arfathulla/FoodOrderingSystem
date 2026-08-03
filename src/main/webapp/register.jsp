<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head><title>Register</title></head>--%>
<%--<body>--%>
<%--<h2>Create an Account</h2>--%>
<%--<% if (request.getAttribute("error") != null) { %>--%>
<%--<p style="color:red;"><%= request.getAttribute("error") %></p>--%>
<%--<% } %>--%>
<%--<form action="register" method="post">--%>
<%--    Name: <input type="text" name="name" required><br>--%>
<%--    Email: <input type="email" name="email" required><br>--%>
<%--    Password: <input type="password" name="password" required><br>--%>
<%--    Phone: <input type="text" name="phone"><br>--%>
<%--    Address: <input type="text" name="address"><br>--%>
<%--    <button type="submit">Register</button>--%>
<%--</form>--%>
<%--<a href="login.jsp">Already have an account? Login</a>--%>
<%--</body>--%>
<%--</html>--%>

















<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>

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
            background:linear-gradient(135deg,#4facfe,#00f2fe);
            overflow:hidden;
        }

        body::before,
        body::after{
            content:"";
            position:absolute;
            border-radius:50%;
            background:rgba(255,255,255,0.15);
            animation:float 8s ease-in-out infinite;
        }

        body::before{
            width:220px;
            height:220px;
            top:5%;
            left:8%;
        }

        body::after{
            width:300px;
            height:300px;
            bottom:5%;
            right:10%;
        }

        @keyframes float{
            50%{
                transform:translateY(-20px);
            }
        }

        .container{
            width:420px;
            background:rgba(255,255,255,0.15);
            backdrop-filter:blur(18px);
            border-radius:20px;
            padding:35px;
            border:1px solid rgba(255,255,255,.3);
            box-shadow:0 15px 35px rgba(0,0,0,.3);
            color:white;
        }

        .container h2{
            text-align:center;
            margin-bottom:25px;
            font-size:32px;
        }

        .input-box{
            position:relative;
            margin-bottom:18px;
        }

        .input-box input{
            width:100%;
            padding:14px 45px;
            border:none;
            outline:none;
            border-radius:30px;
            background:rgba(255,255,255,.2);
            color:white;
            font-size:15px;
        }

        .input-box input::placeholder{
            color:#f2f2f2;
        }

        .input-box i{
            position:absolute;
            left:18px;
            top:50%;
            transform:translateY(-50%);
            color:white;
        }

        .error{
            text-align:center;
            color:#ffdddd;
            margin-bottom:15px;
            font-weight:bold;
        }

        button{
            width:100%;
            padding:14px;
            border:none;
            border-radius:30px;
            background:white;
            color:#2196F3;
            font-size:17px;
            font-weight:bold;
            cursor:pointer;
            transition:.3s;
        }

        button:hover{
            transform:translateY(-3px);
            box-shadow:0 10px 20px rgba(0,0,0,.3);
        }

        .login-link{
            text-align:center;
            margin-top:18px;
        }

        .login-link a{
            color:white;
            font-weight:bold;
            text-decoration:none;
        }

        .login-link a:hover{
            text-decoration:underline;
        }

        @media(max-width:480px){
            .container{
                width:90%;
            }
        }

    </style>

</head>
<body>

<div class="container">

    <h2>Create Account</h2>

    <% if(request.getAttribute("error") != null){ %>
    <div class="error">
        <%= request.getAttribute("error") %>
    </div>
    <% } %>

    <form action="register" method="post">

        <div class="input-box">
            <i class="fa-solid fa-user"></i>
            <input type="text" name="name" placeholder="Full Name" required>
        </div>

        <div class="input-box">
            <i class="fa-solid fa-envelope"></i>
            <input type="email" name="email" placeholder="Email Address" required>
        </div>

        <div class="input-box">
            <i class="fa-solid fa-lock"></i>
            <input type="password" name="password" placeholder="Password" required>
        </div>

        <div class="input-box">
            <i class="fa-solid fa-phone"></i>
            <input type="text" name="phone" placeholder="Phone Number">
        </div>

        <div class="input-box">
            <i class="fa-solid fa-location-dot"></i>
            <input type="text" name="address" placeholder="Address">
        </div>

        <button type="submit">
            <i class="fa-solid fa-user-plus"></i> Register
        </button>

    </form>

    <div class="login-link">
        Already have an account?
        <a href="login.jsp">Login</a>
    </div>

</div>

</body>
</html>