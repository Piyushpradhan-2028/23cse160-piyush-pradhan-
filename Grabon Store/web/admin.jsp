<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Admin Dashboard - E-Commerce Store</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 80%;
            margin: auto;
        }

        .header {
            background-color: #2c3e50;
            color: white;
            padding: 15px;
            text-align: center;
        }

        .nav {
            background-color: #34495e;
            padding: 10px;
            text-align: center;
        }

        .nav a {
            color: white;
            margin: 0 15px;
            text-decoration: none;
        }

        .nav a:hover {
            text-decoration: underline;
        }

        .card-container {
            margin: 20px 0;
            padding: 20px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
        }

        h2, h3 {
            color: #2c3e50;
        }

        .capsule-form {
            margin: 15px 0;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 6px;
            background-color: #fafafa;
        }

        .form-group {
            margin-bottom: 10px;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #bbb;
            border-radius: 4px;
        }

        .btn {
            background-color: #27ae60;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 4px;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #219150;
        }

        .error {
            color: #e74c3c;
            font-weight: bold;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Admin Dashboard</h1>
        </div>
        <div class="nav">
            <a href="index.jsp">Back to Store</a>
            <a href="AdminController?action=logout">Logout</a>
        </div>
        <div class="card-container">
            <%
                String adminUser = (String) session.getAttribute("adminUser");
                if (adminUser == null) {
            %>
                <h2>Admin Login</h2>
                <% if (request.getParameter("error") != null) { %>
                    <div class="error">Invalid username or password!</div>
                <% } %>
                <div class="capsule-form">
                    <form action="AdminController" method="post">
                        <input type="hidden" name="action" value="login">
                        <div class="form-group">
                            <label for="username">Username:</label>
                            <input type="text" id="username" name="username" required>
                        </div>
                        <div class="form-group">
                            <label for="password">Password:</label>
                            <input type="password" id="password" name="password" required>
                        </div>
                        <button type="submit" class="btn">Login</button>
                    </form>
                </div>
            <% } else { %>
                <h2>Welcome, <%= adminUser %>!</h2>
                <h3>Add Product</h3>
                <div class="capsule-form">
                    <form action="AdminController" method="post">
                        <input type="hidden" name="action" value="addProduct">
                        <div class="form-group">
                            <label for="name">Name:</label>
                            <input type="text" id="name" name="name" required>
                        </div>
                        <div class="form-group">
                            <label for="price">Price:</label>
                            <input type="text" id="price" name="price" required>
                        </div>
                        <div class="form-group">
                            <label for="description">Description:</label>
                            <input type="text" id="description" name="description" required>
                        </div>
                        <div class="form-group">
                            <label for="stock">Stock:</label>
                            <input type="text" id="stock" name="stock" required>
                        </div>
                        <button type="submit" class="btn">Add Product</button>
                    </form>
                </div>

                <h3>Edit Product</h3>
                <div class="capsule-form">
                    <form action="AdminController" method="post">
                        <input type="hidden" name="action" value="updateProduct">
                        <div class="form-group">
                            <label for="productId">Product ID:</label>
                            <input type="text" id="productId" name="productId" required>
                        </div>
                        <div class="form-group">
                            <label for="name">Name:</label>
                            <input type="text" id="name" name="name" required>
                        </div>
                        <div class="form-group">
                            <label for="price">Price:</label>
                            <input type="text" id="price" name="price" required>
                        </div>
                        <div class="form-group">
                            <label for="description">Description:</label>
                            <input type="text" id="description" name="description" required>
                        </div>
                        <div class="form-group">
                            <label for="stock">Stock:</label>
                            <input type="text" id="stock" name="stock" required>
                        </div>
                        <button type="submit" class="btn">Update Product</button>
                    </form>
                </div>

                <h3>Delete Product</h3>
                <div class="capsule-form">
                    <form action="AdminController" method="post">
                        <input type="hidden" name="action" value="deleteProduct">
                        <div class="form-group">
                            <label for="productId">Product ID:</label>
                            <input type="text" id="productId" name="productId" required>
                        </div>
                        <button type="submit" class="btn">Delete Product</button>
                    </form>
                </div>
            <% } %>
        </div>
    </div>
</body>
</html>
