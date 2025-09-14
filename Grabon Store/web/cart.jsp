<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, com.ecommerce.util.DBConnection"%>
<!DOCTYPE html>
<html>
<head>
    <title>Shopping Cart</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: #333;
        }

        .header {
            background: rgba(0,0,0,0.7);
            color: #fff;
            padding: 20px;
            text-align: center;
            font-size: 28px;
            font-weight: bold;
            letter-spacing: 1px;
        }

        .nav {
            background: rgba(0,0,0,0.75);
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
            background: #fff;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0px 8px 20px rgba(0,0,0,0.15);
        }

        table.cart-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        table.cart-table th, table.cart-table td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: center;
        }

        table.cart-table th {
            background: #764ba2;
            color: #fff;
            font-size: 15px;
        }

        table.cart-table td img {
            width: 60px;
            height: 60px;
            object-fit: cover;
            border-radius: 6px;
        }

        .quantity-controls button {
            background: #764ba2;
            color: #fff;
            border: none;
            padding: 5px 10px;
            border-radius: 4px;
            cursor: pointer;
            margin: 0 3px;
            font-weight: bold;
        }

        .quantity-controls button:hover {
            background: #5a3780;
        }

        .remove-btn {
            background: #e74c3c;
            color: #fff;
            border: none;
            padding: 8px 12px;
            border-radius: 6px;
            cursor: pointer;
            transition: background 0.3s;
        }

        .remove-btn:hover {
            background: #c0392b;
        }

        .cart-summary {
            text-align: right;
            margin-top: 20px;
        }

        .cart-summary h3 {
            margin-bottom: 10px;
            color: #2c3e50;
        }

        .total-price {
            font-size: 18px;
            font-weight: bold;
            color: #27ae60;
        }

        .cart-summary a {
            display: inline-block;
            margin-top: 10px;
            padding: 12px 20px;
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: #fff;
            text-decoration: none;
            border-radius: 6px;
            font-weight: bold;
            transition: transform 0.2s, background 0.3s;
        }

        .cart-summary a:hover {
            transform: scale(1.05);
            background: linear-gradient(135deg, #764ba2, #667eea);
        }
    </style>
</head>
<body>
    <div class="header"><h1>Shopping Cart</h1></div>
    <div class="nav">
        <a href="index.jsp">Home</a>
        <a href="products.jsp">Products</a>
        <a href="cart.jsp">Cart</a>
    </div>

    <div class="container">
        <table class="cart-table">
            <thead>
                <tr>
                    <th>Product</th><th>Name</th><th>Price</th><th>Quantity</th><th>Total</th><th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Connection conn = null;
                    double subtotal = 0;
                    try {
                        conn = DBConnection.getConnection();
                        String sql = "SELECT c.product_id, c.quantity, p.name, p.price, p.image " +
                                     "FROM cart c JOIN products p ON c.product_id = p.id";
                        Statement stmt = conn.createStatement();
                        ResultSet rs = stmt.executeQuery(sql);

                        while(rs.next()) {
                            int pid = rs.getInt("product_id");
                            int qty = rs.getInt("quantity");
                            double price = rs.getDouble("price");
                            double total = qty * price;
                            subtotal += total;
                %>
                            <tr class="cart-item">
                                <td><img src="images/<%=rs.getString("image")%>" alt=""></td>
                                <td><%=rs.getString("name")%></td>
                                <td>₹<%=price%></td>
                                <td>
                                    <div class="quantity-controls">
                                        <form action="CartController" method="post" style="display:inline;">
                                            <input type="hidden" name="action" value="updateQuantity">
                                            <input type="hidden" name="productId" value="<%=pid%>">
                                            <input type="hidden" name="change" value="-1">
                                            <button type="submit">-</button>
                                        </form>
                                        <%=qty%>
                                        <form action="CartController" method="post" style="display:inline;">
                                            <input type="hidden" name="action" value="updateQuantity">
                                            <input type="hidden" name="productId" value="<%=pid%>">
                                            <input type="hidden" name="change" value="1">
                                            <button type="submit">+</button>
                                        </form>
                                    </div>
                                </td>
                                <td>₹<%=total%></td>
                                <td>
                                    <form action="CartController" method="post">
                                        <input type="hidden" name="action" value="remove">
                                        <input type="hidden" name="productId" value="<%=pid%>">
                                        <button type="submit" class="remove-btn">Remove</button>
                                    </form>
                                </td>
                            </tr>
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
            </tbody>
        </table>

        <div class="cart-summary">
            <h3>Cart Summary</h3>
            <p class="total-price">Total: ₹<%=subtotal%></p>
            <a href="checkout.jsp">Proceed to Checkout</a>
        </div>
    </div>
</body>
</html>
