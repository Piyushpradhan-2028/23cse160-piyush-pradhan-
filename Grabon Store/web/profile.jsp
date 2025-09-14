<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>My Profile - E-Commerce Store</title>
</head>
<body>
    <div class="header">
        <h1>My Profile</h1>
    </div>
    
    <div class="nav">
        <a href="index.jsp">Home</a>
        <a href="products.jsp">Products</a>
        <a href="cart.jsp">Cart</a>
        <a href="profile.jsp">Profile</a>
        <a href="UserController?action=logout">Logout</a>
    </div>
    
    <div class="container">
        <!-- Check if user is logged in -->
        <% 
        String userName = (String) session.getAttribute("userName");
        if(userName == null) { 
            response.sendRedirect("login.jsp");
            return;
        } %>
        
        <div class="profile-container">
            <!-- Sidebar -->
            <div class="profile-sidebar">
                <div class="profile-picture">
                    <img src="https://via.placeholder.com/100x100" alt="Profile Picture">
                    <h4><%= userName %></h4>
                </div>
                
                <ul class="sidebar-menu">
                    <li><a href="#profile-info" class="active" onclick="showSection('profile-info')">Profile Information</a></li>
                    <li><a href="#order-history" onclick="showSection('order-history')">Order History</a></li>
                    <li><a href="#change-password" onclick="showSection('change-password')">Change Password</a></li>
                    <li><a href="#addresses" onclick="showSection('addresses')">My Addresses</a></li>
                </ul>
            </div>
            
            <!-- Main Content -->
            <div class="profile-content">
                <!-- Profile Information Section -->
                <div id="profile-info" class="content-section">
                    <div class="form-section">
                        <h3>Profile Information</h3>
                        <form action="UserController" method="post">
                            <input type="hidden" name="action" value="updateProfile">
                            
                            <div class="form-row">
                                <div class="form-group">
                                    <label for="firstName">First Name:</label>
                                    <input type="text" id="firstName" name="firstName" value="John">
                                </div>
                                <div class="form-group">
                                    <label for="lastName">Last Name:</label>
                                    <input type="text" id="lastName" name="lastName" value="Doe">
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label for="email">Email:</label>
                                <input type="email" id="email" name="email" value="john.doe@email.com" readonly>
                            </div>
                            
                            <div class="form-group">
                                <label for="phone">Phone Number:</label>
                                <input type="tel" id="phone" name="phone" value="+91 9876543210">
                            </div>
                            
                            <button type="submit" class="btn">Update Profile</button>
                        </form>
                    </div>
                </div>
                
                <!-- Order History Section -->
                <div id="order-history" class="content-section" style="display: none;">
                    <div class="form-section">
                        <h3>Order History</h3>
                        <table class="order-table">
                            <thead>
                                <tr>
                                    <th>Order ID</th>
                                    <th>Date</th>
                                    <th>Items</th>
                                    <th>Total</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>#1001</td>
                                    <td>2024-01-15</td>
                                    <td>Gaming Laptop, Smartphone</td>
                                    <td>₹61,998</td>
                                    <td><span class="status-badge status-completed">Delivered</span></td>
                                    <td><a href="OrderController?action=view&id=1001" style="color: #007bff;">View Details</a></td>
                                </tr>
                                <tr>
                                    <td>#1002</td>
                                    <td>2024-01-10</td>
                                    <td>Wireless Headphones</td>
                                    <td>₹2,999</td>
                                    <td><span class="status-badge status-pending">Processing</span></td>
                                    <td><a href="OrderController?action=view&id=1002" style="color: #007bff;">View Details</a></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                
                <!-- Change Password Section -->
                <div id="change-password" class="content-section" style="display: none;">
                    <div class="form-section">
                        <h3>Change Password</h3>
                        <form action="UserController" method="post">
                            <input type="hidden" name="action" value="changePassword">
                            
                            <div class="form-group">
                                <label for="currentPassword">Current Password:</label>
                                <input type="password" id="currentPassword" name="currentPassword" required>
                            </div>
                            
                            <div class="form-group">
                                <label for="newPassword">New Password:</label>
                                <input type="password" id="newPassword" name="newPassword" required>
                            </div>
                            
                            <div class="form-group">
                                <label for="confirmPassword">Confirm New Password:</label>
                                <input type="password" id="confirmPassword" name="confirmPassword" required>
                            </div>
                            
                            <button type="submit" class="btn">Change Password</button>
                        </form>
                    </div>
                </div>
                
                <!-- Addresses Section -->
                <div id="addresses" class="content-section" style="display: none;">
                    <div class="form-section">
                        <h3>My Addresses</h3>
                        <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;">
                            <span>Saved Addresses</span>
                            <button class="btn" onclick="showAddAddressForm()">Add New Address</button>
                        </div>
                        
                        <!-- Existing Addresses -->
                        <div style="border: 1px solid #ddd; padding: 15px; border-radius: 5px; margin-bottom: 15px;">
                            <h4>Home</h4>
                            <p>123 Main Street<br>
                            Gunupur, Odisha 765022<br>
                            India</p>
                            <button class="btn btn-secondary" style="margin-right: 10px;">Edit</button>
                            <button class="btn" style="background: #dc3545;">Delete</button>
                        </div>
                        
                        <!-- Add Address Form (Initially Hidden) -->
                        <div id="add-address-form" style="display: none; border: 1px solid #ddd; padding: 20px; border-radius: 5px; margin-top: 20px;">
                            <h4>Add New Address</h4>
                            <form action="UserController" method="post">
                                <input type="hidden" name="action" value="addAddress">
                                
                                <div class="form-group">
                                    <label for="addressName">Address Name:</label>
                                    <input type="text" id="addressName" name="addressName" placeholder="e.g., Home, Office">
                                </div>
                                
                                <div class="form-group">
                                    <label for="street">Street Address:</label>
                                    <input type="text" id="street" name="street">
                                </div>
                                
                                <div class="form-row">
                                    <div class="form-group">
                                        <label for="city">City:</label>
                                        <input type="text" id="city" name="city">
                                    </div>
                                    <div class="form-group">
                                        <label for="state">State:</label>
                                        <input type="text" id="state" name="state">
                                    </div>
                                </div>
                                
                                <div class="form-row">
                                    <div class="form-group">
                                        <label for="pincode">Pin Code:</label>
                                        <input type="text" id="pincode" name="pincode">
                                    </div>
                                    <div class="form-group">
                                        <label for="country">Country:</label>
                                        <input type="text" id="country" name="country" value="India">
                                    </div>
                                </div>
                                
                                <button type="submit" class="btn">Save Address</button>
                                <button type="button" class="btn btn-secondary" onclick="hideAddAddressForm()" style="margin-left: 10px;">Cancel</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script>
        function showSection(sectionId) {
            // Hide all sections
            var sections = document.querySelectorAll('.content-section');
            sections.forEach(function(section) {
                section.style.display = 'none';
            });
            
            // Show selected section
            document.getElementById(sectionId).style.display = 'block';
            
            // Update active menu item
            var menuItems = document.querySelectorAll('.sidebar-menu a');
            menuItems.forEach(function(item) {
                item.classList.remove('active');
            });
            event.target.classList.add('active');
        }
        
        function showAddAddressForm() {
            document.getElementById('add-address-form').style.display = 'block';
        }
        
        function hideAddAddressForm() {
            document.getElementById('add-address-form').style.display = 'none';
        }
    </script>
</body>
</html>