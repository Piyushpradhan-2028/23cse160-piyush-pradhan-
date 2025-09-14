<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Product Detail</title>
</head>
<body>
    <div class="header"><h1>Product Detail</h1></div>
    <div class="nav">
        <a href="index.jsp">Home</a>
        <a href="products.jsp">Products</a>
        <a href="cart.jsp">Cart</a>
    </div>

    <div class="container">
        <%
            ResultSet product = (ResultSet) request.getAttribute("product");
            if(product != null) {
        %>
            <div class="product-detail">
                <div>
                    <img src="images/<%=product.getString("image")%>" alt="<%=product.getString("name")%>">
                </div>
                <div>
                    <h2><%=product.getString("name")%></h2>
                    <p><%=product.getString("description")%></p>
                    <p class="price">₹<%=product.getDouble("price")%></p>
                    <a href="CartController?action=add&productId=<%=product.getInt("id")%>" class="btn btn-cart">Add to Cart</a>
                </div>
            </div>
        <%
            } else {
        %>
            <p>Product not found.</p>
        <%
            }
        %>
    </div>
</body>
</html>
