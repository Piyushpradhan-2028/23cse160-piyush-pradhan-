<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Register - E-Commerce Store</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            background: linear-gradient(135deg, #6a11cb, #2575fc);
            color: #333;
        }

        .header {
            background: rgba(0, 0, 0, 0.6);
            color: #fff;
            padding: 20px;
            text-align: center;
            font-size: 26px;
            font-weight: bold;
            letter-spacing: 1px;
        }

        .nav {
            background: rgba(0, 0, 0, 0.75);
            padding: 12px;
            text-align: center;
        }

        .nav a {
            color: #fff;
            margin: 0 15px;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s;
        }

        .nav a:hover {
            color: #ffcc00;
        }

        .register-container {
            width: 400px;
            margin: 40px auto;
            background: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0px 8px 20px rgba(0,0,0,0.2);
        }

        h2 {
            color: #333;
            text-align: center;
            margin-bottom: 25px;
        }

        .error {
            background: #ffe6e6;
            color: #d63031;
            border: 1px solid #ff7675;
            padding: 10px;
            border-radius: 6px;
            margin-bottom: 15px;
            text-align: center;
            font-weight: bold;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 6px;
            color: #555;
        }

        input[type="text"],
        input[type="email"],
        input[type="tel"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
            outline: none;
            font-size: 14px;
            transition: border-color 0.3s;
        }

        input:focus {
            border-color: #2575fc;
        }

        .btn {
            width: 100%;
            padding: 12px;
            background: linear-gradient(135deg, #2575fc, #6a11cb);
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: transform 0.2s, background 0.3s;
        }

        .btn:hover {
            transform: scale(1.03);
            background: linear-gradient(135deg, #6a11cb, #2575fc);
        }

        .link {
            margin-top: 15px;
            text-align: center;
        }

        .link a {
            color: #2575fc;
            font-weight: 600;
            text-decoration: none;
        }

        .link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Create acount for shopping</h1>
    </div>
    
    <div class="nav">
        <a href="index.jsp">Home</a>
        <a href="products.jsp">Products</a>
        <a href="cart.jsp">Cart</a>
        <a href="login.jsp">Login</a>
        <a href="register.jsp">Register</a>
        <a href="admin.jsp">Admin</a>
    </div>
    
    <div class="register-container">
        <h2>Register</h2>
        
        <% if(request.getParameter("error") != null) { %>
            <div class="error">Registration failed! Email might already exist.</div>
        <% } %>
        
        <form action="UserController" method="post">
            <input type="hidden" name="action" value="register">
            
            <div class="form-group">
                <label for="name">Full Name:</label>
                <input type="text" id="name" name="name" required>
            </div>
            
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
            </div>
            
            <div class="form-group">
                <label for="phone">Phone Number:</label>
                <input type="tel" id="phone" name="phone" required>
            </div>
            
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
            </div>
            
            <div class="form-group">
                <label for="confirmPassword">Confirm Password:</label>
                <input type="password" id="confirmPassword" name="confirmPassword" required>
            </div>
            
            <button type="submit" class="btn">Register</button>
        </form>
        
        <div class="link">
            <p>Already have an account? <a href="login.jsp">Login here</a></p>
        </div>
    </div>
    
    <script>
        document.querySelector('form').addEventListener('submit', function(e) {
            var password = document.getElementById('password').value;
            var confirmPassword = document.getElementById('confirmPassword').value;
            
            if (password !== confirmPassword) {
                e.preventDefault();
                alert('Passwords do not match!');
            }
        });
    </script>
</body>
</html>
