<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Forgot Password</title>

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
            position:relative;
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
            width:400px;
            padding:40px;
            background:rgba(255,255,255,.15);
            backdrop-filter:blur(18px);
            border-radius:20px;
            border:1px solid rgba(255,255,255,.30);
            box-shadow:0 15px 35px rgba(0,0,0,.35);
            color:white;
            z-index:1;
        }

        .login-box h2{
            text-align:center;
            font-size:32px;
            margin-bottom:30px;
        }

        .input-box{
            margin-bottom:20px;
        }

        .input-box input{
            width:100%;
            padding:14px 18px;
            border:none;
            outline:none;
            border-radius:30px;
            background:rgba(255,255,255,.20);
            color:white;
            font-size:15px;
        }

        .input-box input::placeholder{
            color:#f1f1f1;
        }

        .input-box input:focus{
            background:rgba(255,255,255,.28);
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
            background:#f2f2f2;
            transform:translateY(-3px);
        }

        .error{
            text-align:center;
            color:#ffd6d6;
            margin-bottom:15px;
        }

        .back{
            text-align:center;
            margin-top:20px;
        }

        .back a{
            color:white;
            text-decoration:none;
            font-size:15px;
        }

        .back a:hover{
            text-decoration:underline;
        }

    </style>
</head>

<body>

<div class="login-box">

    <h2>Reset Password</h2>

    <% if(request.getAttribute("error") != null){ %>
    <p class="error"><%= request.getAttribute("error") %></p>
    <% } %>

    <form action="forgotPassword" method="post">

        <div class="input-box">
            <input
                    type="email"
                    name="email"
                    placeholder="Enter your Email"
                    required>
        </div>

        <div class="input-box">
            <input
                    type="password"
                    name="password"
                    placeholder="Enter New Password"
                    required>
        </div>

        <button class="btn" type="submit">
            Update Password
        </button>

    </form>

    <div class="back">
        <a href="login.jsp">← Back to Login</a>
    </div>

</div>

</body>
</html>