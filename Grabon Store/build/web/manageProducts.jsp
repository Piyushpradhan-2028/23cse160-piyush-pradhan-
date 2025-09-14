<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.ecommerce.util.DBConnection"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Manage Products - E-Commerce Store</title>
</head>
<body>
    <div class="header">
        <h1>Manage Products</h1>
    </div>
    <div class="nav">
        <a href="admin.jsp">Back to Dashboard</a>
        <a href="AdminController?action=logout">Logout</a>
    </div>
    <div class="container">
        <%
            HttpSession session = request.getSession();
            String adminUser = (String) session.getAttribute("adminUser");
            if (adminUser == null) {
                response.sendRedirect("admin.jsp");
            } else {
                Connection conn = null;
                PreparedStatement stmt = null;
                ResultSet rs = null;
                try {
                    conn = DBConnection.getConnection();
                    String sql = "SELECT id, name, price, description, stock, image FROM products";
                    stmt = conn.prepareStatement(sql);
                    rs = stmt.executeQuery();
        %>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Description</th>
                    <th>Stock</th>
                    <th>Image</th>
                </tr>
            </thead>
            <tbody>
                <% while (rs.next()) { %>
                <tr>
                    <td><%= rs.getInt("id") %></td>
                    <td><%= rs.getString("name") %></td>
                    <td><%= rs.getDouble("price") %></td>
                    <td><%= rs.getString("description") %></td>
                    <td><%= rs.getInt("stock") %></td>
                    <td><%= rs.getString("image") %></td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <% 
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    DBConnection.closeConnection(conn);
                }
            }
        %>
    </div>
</body>
</html>