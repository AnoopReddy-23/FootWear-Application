<%@ page import="java.sql.*" %>
<%
    // Get the user ID from the session
    String userId = session.getAttribute("userId").toString();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Checkout</title>
    <link rel="stylesheet" href="cbpcart.css">
</head>
<body>
    <header>
        <h1>Previous Orders</h1>
    </header>
    <div class="container">
        <table id="mytable">
            <thead>
                <tr>
                    <th>Product Name</th>
                    <th>Size</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Image</th>
                    <th>Order Date</th>
                </tr>
            </thead>
            <tbody>
                <%
                    // Get the user's order details from the orders table
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/wt_cbp_db","root","root");
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM orders WHERE userid='" + userId + "' ORDER BY orderdate DESC");

                    // Display the order details in the HTML table
                    while (rs.next()) {
                        String productName = rs.getString("productname");
                        String size = rs.getString("size");
                        String price = rs.getString("price");
                        String image = rs.getString("image");
                        String orderdate = rs.getString("orderdate");
                        String quantity = rs.getString("quantity");
                %>
                        <tr>
                            <td><%= productName %></td>
                            <td><%= size %></td>
                            <td>Rs <%= price %></td>
                            <td><%= quantity %></td>
                            <td><img src="<%= image %>" alt="<%= productName %>"></td>
                            <td><%= orderdate %></td>
                        </tr>
                <%
                    }

                    // Close the database connections
                    rs.close();
                    stmt.close();
                    con.close();
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
