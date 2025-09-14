<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="com.ecommerce.util.DBConnection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Checkout - E-Commerce Store</title>
</head>
<body>
    <div class="container">
        <h1>Checkout Summary</h1>

        <%
            HttpSession session1 = request.getSession(false);
            Integer userId = (session1 != null) ? (Integer) session1.getAttribute("userId") : null;
            if (userId == null) {
        %>
            <p style="color:red;">⚠️ You must be logged in to checkout.</p>
            <a href="login.jsp">Go to Login</a>
        <%
            } else {
                Connection conn = null;
                PreparedStatement ps = null;
                ResultSet rs = null;
                double subtotal = 0.0;
                try {
                    conn = DBConnection.getConnection();
                    String sql = "SELECT p.id, p.name, p.price, c.quantity FROM cart c JOIN products p ON c.product_id = p.id WHERE c.user_id=?";
                    ps = conn.prepareStatement(sql);
                    ps.setInt(1, userId);
                    rs = ps.executeQuery();
        %>
                    <table>
                        <tr>
                            <th>Product</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Subtotal</th>
                        </tr>
                        <%
                            boolean hasItems = false;
                            while (rs.next()) {
                                hasItems = true;
                                String pname = rs.getString("name");
                                double price = rs.getDouble("price");
                                int qty = rs.getInt("quantity");
                                double itemTotal = price * qty;
                                subtotal += itemTotal;
                        %>
                            <tr>
                                <td><%= pname %></td>
                                <td>₹<%= String.format("%.2f", price) %></td>
                                <td><%= qty %></td>
                                <td>₹<%= String.format("%.2f", itemTotal) %></td>
                            </tr>
                        <%
                            } // end while

                            if (!hasItems) {
                        %>
                            <tr>
                                <td colspan="4">Your cart is empty.</td>
                            </tr>
                        <%
                            }

                            double shipping = (subtotal > 0) ? 50.0 : 0.0;
                            double tax = subtotal * 0.18;
                            double total = subtotal + shipping + tax;
                        %>
                        <tr class="total"><td colspan="3">Subtotal</td><td>₹<%= String.format("%.2f", subtotal) %></td></tr>
                        <tr class="total"><td colspan="3">Shipping</td><td>₹<%= String.format("%.2f", shipping) %></td></tr>
                        <tr class="total"><td colspan="3">Tax (18%)</td><td>₹<%= String.format("%.2f", tax) %></td></tr>
                        <tr class="total"><td colspan="3">Grand Total</td><td>₹<%= String.format("%.2f", total) %></td></tr>
                    </table>

                    <!-- Checkout form: posts to your existing CheckoutController -->
                    <form action="CheckoutController" method="post">
                        <input type="hidden" name="action" value="placeOrder">

                        <div style="background:#fafafa;padding:12px;border-radius:6px;margin-bottom:16px;">
                            <h3>Billing & Shipping</h3>

                            <div class="form-row">
                                <label for="fullName">Full name</label>
                                <input type="text" id="fullName" name="fullName" required>
                            </div>

                            <div class="form-row">
                                <label for="address">Address</label>
                                <textarea id="address" name="address" rows="2" required></textarea>
                            </div>

                            <div class="form-row" style="display:flex;gap:10px;">
                                <div style="flex:2;">
                                    <label for="city">City</label>
                                    <input type="text" id="city" name="city" required>
                                </div>
                                <div style="flex:1;">
                                    <label for="pincode">Pincode</label>
                                    <input type="text" id="pincode" name="pincode" required>
                                </div>
                            </div>

                            <div class="form-row">
                                <label for="phone">Phone</label>
                                <input type="text" id="phone" name="phone" required>
                            </div>

                            <div class="form-row">
                                <label for="paymentMethod">Payment method</label>
                                <select id="paymentMethod" name="paymentMethod" required>
                                    <option value="COD">Cash on Delivery</option>
                                    <option value="UPI">UPI</option>
                                    <option value="CARD">Credit/Debit Card</option>
                                </select>
                            </div>
                        </div>

                        <button type="submit" class="btn">Place Order</button>
                    </form>

        <%
                } catch(Exception e) {
                    out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
                    e.printStackTrace();
                } finally {
                    if (rs != null) try { rs.close(); } catch(Exception ignored) {}
                    if (ps != null) try { ps.close(); } catch(Exception ignored) {}
                    if (conn != null) DBConnection.closeConnection(conn);
                }
            }
        %>
    </div>
</body>
</html>
