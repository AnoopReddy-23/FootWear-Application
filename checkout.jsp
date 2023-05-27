<%@ page import="java.sql.*" %>
<%
    // Get the user ID from the session
    String userId = session.getAttribute("userId").toString();

    // Get the user's cart items from the database
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/wt_cbp_db","root","root");
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM cart WHERE userid='" + userId + "'");

    // Calculate the total price of the cart items
    float total = 0;
    while (rs.next()) {
        String price = rs.getString("price");
        int quantity = rs.getInt("quantity");
        total += Float.parseFloat(price)*quantity;
    }

    // Insert the cart items into the orders table
    PreparedStatement pstmt = con.prepareStatement("INSERT INTO orders (userid, productid, productname, size, price, image, quantity, orderdate) SELECT userid, productid, productname, size, price, image, quantity, now() FROM cart WHERE userid='" + userId + "'");
    pstmt.executeUpdate();

    // Clear the user's cart
    stmt.executeUpdate("DELETE FROM cart WHERE userid='" + userId + "'");

    // Close the database connections
    pstmt.close();
    rs.close();
    stmt.close();
    con.close();
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
        <h1>Shopping Cart</h1>
    </header>
    <div class="container">
        <h2>Thank you for your order!</h2>
        <p>Your order has been placed and will be shipped soon. Below are the details of your order:</p>
	  <h3>Total Order Price:<span style="color: red;"> Rs <%= String.format("%.2f", total) %></span></h3>
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
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/wt_cbp_db","root","root");
                    stmt = con.createStatement();
                    rs = stmt.executeQuery("SELECT * FROM orders WHERE userid='" + userId + "' and orderdate >= DATE_SUB(NOW(), INTERVAL 30 SECOND) ORDER BY orderdate DESC");

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
