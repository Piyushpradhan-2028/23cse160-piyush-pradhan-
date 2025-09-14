<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>E-Commerce Store</title>
    <style>
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            margin: 0;
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: #333;
        }

        /* Header */
        .header {
            background: rgba(0, 0, 0, 0.7);
            color: white;
            padding: 20px;
            text-align: center;
            font-size: 32px;
            font-weight: bold;
            letter-spacing: 1px;
        }

        /* Navigation */
        .nav {
            background: rgba(0, 0, 0, 0.75);
            padding: 14px;
            text-align: center;
        }

        .nav a {
            color: #fff;
            text-decoration: none;
            margin: 0 18px;
            font-weight: 500;
            font-size: 16px;
            transition: color 0.3s;
        }

        .nav a:hover {
            color: #ffcc00;
        }

        /* Main Container */
        .container {
            max-width: 1200px;
            margin: 40px auto;
            padding: 20px;
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.15);
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            font-size: 26px;
            color: #2c3e50;
        }

        /* Product Grid */
        .product-grid { 
            display: grid; 
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); 
            gap: 25px; 
        }

        .product-card { 
            border: 1px solid #ddd; 
            border-radius: 10px; 
            padding: 20px; 
            text-align: center; 
            background: #fff;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .product-card:hover {
            transform: scale(1.07);
            box-shadow: 0 8px 20px rgba(0,0,0,0.25);
        }

        .product-card img { 
            width: 100%; 
            height: 220px; 
            object-fit: contain; 
            border-radius: 8px; 
            background: #f9f9f9; 
            padding: 10px;
            transition: transform 0.3s ease;
        }

        .product-card:hover img {
            transform: scale(1.05);
        }

        .product-card h3 {
            margin-top: 15px;
            font-size: 20px;
            color: #333;
        }

        .price {
            font-size: 18px;
            font-weight: bold;
            margin: 12px 0;
            color: #27ae60;
        }

        /* Buttons */
        .btn { 
            display: inline-block; 
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white; 
            padding: 10px 20px; 
            text-decoration: none; 
            border-radius: 6px; 
            font-weight: bold; 
            transition: transform 0.2s, background 0.3s;
        }

        .btn:hover { 
            transform: scale(1.05);
            background: linear-gradient(135deg, #764ba2, #667eea);
        }

        .view-all {
            text-align: center; 
            margin-top: 40px;
        }
    </style>
</head>
<body>

    <!-- Header -->
    <div class="header">
        <h1>GrabnGo Store✨</h1>
    </div>

    <!-- Navigation -->
    <div class="nav">
        <a href="index.jsp">Home</a>
        <a href="products.jsp">Products</a>
        <a href="cart.jsp">Cart</a>
        <a href="login.jsp">Login</a>
        <a href="register.jsp">Register</a>
        <a href="admin.jsp">Admin</a>
    </div>

    <!-- Main Content -->
    <div class="container">
        <h2>Featured Products</h2>
        
        <div class="product-grid">
            <!-- Product 1 -->
            <div class="product-card">
                <img src="images/phone.jpg" alt="Smartphone">
                <h3>iphone12 mini</h3>
                <p class="price">₹19099</p>
                <a href="ProductController?action=view&id=2" class="btn">View Details</a>
            </div>

            <!-- Product 2 -->
            <div class="product-card">
                <img src="images/laptop.jpeg" alt="Laptop">
                <h3>HP Pavilion</h3>
                <p class="price">₹45999</p>
                <a href="ProductController?action=view&id=1" class="btn">View Details</a>
            </div>
        </div>

        <div class="view-all">
            <a href="products.jsp" class="btn">View All Products</a>
        </div>
    </div>

</body>
</html>
