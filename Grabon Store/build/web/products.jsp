<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, com.ecommerce.util.DBConnection"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Products - E-Commerce Store</title>
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

        .container {
            width: 90%;
            margin: 30px auto;
        }

        h2 {
            text-align: center;
            color: #fff;
            margin-bottom: 25px;
        }

        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 20px;
        }

        .product-card {
            background: #fff;
            border-radius: 12px;
            padding: 20px;
            text-align: center;
            box-shadow: 0px 8px 20px rgba(0,0,0,0.15);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0px 12px 25px rgba(0,0,0,0.25);
        }

        .product-card img {
            max-width: 100%;
            height: 180px;
            object-fit: cover;
            border-radius: 8px;
        }

        .product-card h3 {
            margin: 12px 0 8px;
            color: #2c3e50;
        }

        .product-card p {
            font-size: 14px;
            color: #555;
        }

        .price {
            font-weight: bold;
            color: #27ae60;
            margin: 10px 0;
            font-size: 16px;
        }

        .btn {
            display: inline-block;
            margin: 6px;
            padding: 10px 15px;
            background: linear-gradient(135deg, #2575fc, #6a11cb);
            color: #fff;
            text-decoration: none;
            border-radius: 6px;
            font-weight: bold;
            transition: transform 0.2s, background 0.3s;
        }

        .btn:hover {
            transform: scale(1.05);
            background: linear-gradient(135deg, #6a11cb, #2575fc);
        }

        .btn-cart {
            background: linear-gradient(135deg, #27ae60, #219150);
        }

        .btn-cart:hover {
            background: linear-gradient(135deg, #219150, #27ae60);
        }
    </style>
</head>
<body>
    <div class="header"><h1>Our Products</h1></div>
    <div class="nav">
        <a href="index.jsp">Home</a>
        <a href="products.jsp">Products</a>
        <a href="cart.jsp">Cart</a>
        <a href="login.jsp">Login</a>
        <a href="register.jsp">Register</a>
        <a href="admin.jsp">Admin</a>
    </div>

    <div class="container">
        <h2>All Products</h2>
        <div class="product-grid">
            <%
                Connection conn = null;
                try {
                    conn = DBConnection.getConnection();
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM products");
                    while(rs.next()) {
            %>
                        <div class="product-card">
                            <img src="images/<%=rs.getString("image")%>" alt="<%=rs.getString("name")%>">
                            <h3><%=rs.getString("name")%></h3>
                            <p><%=rs.getString("description")%></p>
                            <p class="price">₹<%=rs.getDouble("price")%></p>
                            <a href="ProductController?action=view&id=<%=rs.getInt("id")%>" class="btn">View Details</a>
                            <a href="CartController?action=add&productId=<%=rs.getInt("id")%>" class="btn btn-cart">Add to Cart</a>
                        </div>
            <%
                    }
                    rs.close();
                    stmt.close();
                } catch(Exception e) {
                    e.printStackTrace();
                } finally {
                    DBConnection.closeConnection(conn);
                }
            %>
        </div>
    </div>
</body>
</html>
