<%--<%@ page import="java.util.List" %>--%>
<%--<%@ page import="foodapp.dao.model.MenuItem" %>--%>
<%--<%@ page import="foodapp.dao.model.Order" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head><title>Admin Panel</title></head>--%>
<%--<body>--%>
<%--<h2>Admin Dashboard</h2>--%>

<%--<h3>Add Menu Item</h3>--%>
<%--<form action="admin" method="post">--%>
<%--    <input type="hidden" name="action" value="addItem">--%>
<%--    Name: <input type="text" name="name" required><br>--%>
<%--    Description: <input type="text" name="description"><br>--%>
<%--    Price: <input type="number" step="0.01" name="price" required><br>--%>
<%--    Category: <input type="text" name="category"><br>--%>
<%--    <button type="submit">Add Item</button>--%>
<%--</form>--%>

<%--<h3>Current Menu</h3>--%>
<%--<table border="1">--%>
<%--    <tr><th>Name</th><th>Price</th><th>Category</th></tr>--%>
<%--    <%--%>
<%--        List<MenuItem> items = (List<MenuItem>) request.getAttribute("menuItems");--%>
<%--        if (items != null) {--%>
<%--            for (MenuItem item : items) {--%>
<%--    %>--%>
<%--    <tr>--%>
<%--        <td><%= item.getName() %></td>--%>
<%--        <td>₹<%= item.getPrice() %></td>--%>
<%--        <td><%= item.getCategory() %></td>--%>
<%--    </tr>--%>
<%--    <% } } %>--%>
<%--</table>--%>

<%--<h3>Manage Orders</h3>--%>
<%--<table border="1">--%>
<%--    <tr><th>Order ID</th><th>Total</th><th>Status</th><th>Update</th></tr>--%>
<%--    <%--%>
<%--        List<Order> orders = (List<Order>) request.getAttribute("orders");--%>
<%--        if (orders != null) {--%>
<%--            for (Order o : orders) {--%>
<%--    %>--%>
<%--    <tr>--%>
<%--        <td><%= o.getOrderId() %></td>--%>
<%--        <td>₹<%= o.getTotal_amount() %></td>--%>
<%--        <td><%= o.getStatus() %></td>--%>
<%--        <td>--%>
<%--            <form action="admin" method="post">--%>
<%--                <input type="hidden" name="action" value="updateStatus">--%>
<%--                <input type="hidden" name="orderId" value="<%= o.getOrderId() %>">--%>
<%--                <select name="status">--%>
<%--                    <option value="PLACED">PLACED</option>--%>
<%--                    <option value="PREPARING">PREPARING</option>--%>
<%--                    <option value="OUT_FOR_DELIVERY">OUT_FOR_DELIVERY</option>--%>
<%--                    <option value="DELIVERED">DELIVERED</option>--%>
<%--                    <option value="CANCELLED">CANCELLED</option>--%>
<%--                </select>--%>
<%--                <button type="submit">Update</button>--%>
<%--            </form>--%>
<%--        </td>--%>
<%--    </tr>--%>
<%--    <% } } %>--%>
<%--</table>--%>
<%--</body>--%>
<%--</html>--%>









<%@ page import="java.util.List" %>
<%@ page import="foodapp.dao.model.MenuItem" %>
<%@ page import="foodapp.dao.model.Order" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>

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
            background:linear-gradient(135deg,#4facfe,#00f2fe);
            min-height:100vh;
            padding:30px;
        }

        .container{
            max-width:1200px;
            margin:auto;
        }

        h1{
            color:white;
            text-align:center;
            margin-bottom:30px;
        }

        .card{
            background:rgba(255,255,255,.18);
            backdrop-filter:blur(15px);
            border-radius:20px;
            padding:25px;
            margin-bottom:30px;
            box-shadow:0 10px 25px rgba(0,0,0,.25);
        }

        .card h2{
            color:white;
            margin-bottom:20px;
        }

        .grid{
            display:grid;
            grid-template-columns:repeat(auto-fit,minmax(250px,1fr));
            gap:15px;
        }

        input,select{
            width:100%;
            padding:12px;
            border:none;
            border-radius:10px;
            outline:none;
            font-size:15px;
        }

        button{
            background:#2196F3;
            color:white;
            border:none;
            padding:12px 25px;
            border-radius:10px;
            cursor:pointer;
            font-size:16px;
            transition:.3s;
        }

        button:hover{
            background:#1565C0;
            transform:translateY(-2px);
        }

        table{
            width:100%;
            border-collapse:collapse;
            margin-top:15px;
            background:white;
            border-radius:10px;
            overflow:hidden;
        }

        th{
            background:#2196F3;
            color:white;
            padding:12px;
        }

        td{
            padding:12px;
            text-align:center;
            border-bottom:1px solid #ddd;
        }

        tr:hover{
            background:#f5f5f5;
        }

        .update-form{
            display:flex;
            gap:10px;
            justify-content:center;
        }

        .update-form select{
            width:180px;
        }

        @media(max-width:768px){

            .update-form{
                flex-direction:column;
            }

            .update-form select{
                width:100%;
            }

            table{
                display:block;
                overflow-x:auto;
            }

        }

    </style>

</head>
<body>

<div class="container">

    <h1><i class="fa-solid fa-user-shield"></i> Admin Dashboard</h1>

    <!-- Add Menu -->

    <div class="card">

        <h2><i class="fa-solid fa-utensils"></i> Add Menu Item</h2>

        <form action="admin" method="post">

            <input type="hidden" name="action" value="addItem">

            <div class="grid">

                <input type="text" name="name" placeholder="Food Name" required>

                <input type="text" name="description" placeholder="Description">

                <input type="number" step="0.01" name="price" placeholder="Price" required>

                <input type="text" name="category" placeholder="Category">

            </div>

            <br>

            <button type="submit">
                <i class="fa-solid fa-plus"></i> Add Item
            </button>

        </form>

    </div>

    <!-- Menu -->

    <div class="card">

        <h2><i class="fa-solid fa-bowl-food"></i> Current Menu</h2>

        <table>

            <tr>
                <th>Name</th>
                <th>Price</th>
                <th>Category</th>
            </tr>

            <%
                List<MenuItem> items=(List<MenuItem>)request.getAttribute("menuItems");

                if(items!=null){
                    for(MenuItem item:items){
            %>

            <tr>
                <td><%= item.getName() %></td>
                <td>₹<%= item.getPrice() %></td>
                <td><%= item.getCategory() %></td>
            </tr>

            <%
                    }
                }
            %>

        </table>

    </div>

    <!-- Orders -->

    <div class="card">

        <h2><i class="fa-solid fa-cart-shopping"></i> Manage Orders</h2>

        <table>

            <tr>
                <th>Order ID</th>
                <th>Total</th>
                <th>Status</th>
                <th>Action</th>
            </tr>

            <%
                List<Order> orders=(List<Order>)request.getAttribute("orders");

                if(orders!=null){
                    for(Order o:orders){
            %>

            <tr>

                <td><%= o.getOrderId() %></td>

                <td>₹<%= o.getTotal_amount() %></td>

                <td><strong><%= o.getStatus() %></strong></td>

                <td>

                    <form action="admin" method="post" class="update-form">

                        <input type="hidden" name="action" value="updateStatus">

                        <input type="hidden" name="orderId"
                               value="<%= o.getOrderId() %>">

                        <select name="status">

                            <option value="PLACED">PLACED</option>

                            <option value="PREPARING">PREPARING</option>

                            <option value="OUT_FOR_DELIVERY">OUT FOR DELIVERY</option>

                            <option value="DELIVERED">DELIVERED</option>

                            <option value="CANCELLED">CANCELLED</option>

                        </select>

                        <button type="submit">
                            Update
                        </button>

                    </form>

                </td>

            </tr>

            <%
                    }
                }
            %>

        </table>

    </div>

</div>

</body>
</html>