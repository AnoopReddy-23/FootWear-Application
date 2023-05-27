<%@page import="java.sql.*, javax.servlet.http.*, java.io.*"%>
<%
	// Get the product information from the request parameters
	String productid = request.getParameter("productid");
	String productName = request.getParameter("productname");
	String size = request.getParameter("size");
	String price = request.getParameter("price");
	String image = request.getParameter("image");
	String userid = session.getAttribute("userId").toString();

	// Add the product to the cart table in the database
	try {
	    Class.forName("com.mysql.jdbc.Driver");
	    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/wt_cbp_db","root","root");
	    String query = "INSERT INTO cart (productname, size, price, image,userid,productid,quantity) VALUES (?, ?, ?, ?, ?, ?,1)";
	    PreparedStatement pstmt = con.prepareStatement(query);
	    pstmt.setString(1, productName);
	    pstmt.setString(2, size);
	    pstmt.setString(3, price);
	    pstmt.setString(4, image);
	    pstmt.setString(5, userid);
	    pstmt.setString(6, productid);
	    int numRows=pstmt.executeUpdate();
		if (numRows>0) {
      		  String message = "Product Added to Cart Successfully!";
%>
 	       <h1 align="center" id="success-msg" style="background-color: #DFF2BF; border: 1px solid #4F8A10; color: #4F8A10; padding: 10px;">
      	      <%= message %>
			<br><br>
      	  </h1>
      	  <script>
      	      setTimeout(function() {
      	          window.location.href = "catalogue.jsp";
      	      }, 2000); // redirect after 2 seconds
       	 </script>
<%
    		} else {
      		  String message = "Unable to Add. Please try again.";
%>
        	<h1 align="center" id="error-msg" style="background-color: #FFBABA; border: 1px solid #D8000C; color: #D8000C; padding: 10px;">
        	    <%= message %>
			<br><br>
			Redirecting to catalogue...
      	  </h1>
      	  <script>
      	      setTimeout(function() {
      	          window.location.href = "catalogue.jsp";
      	      }, 2000); // redirect after 2 seconds
      	  </script>

<%
	}
	    pstmt.close();
	    con.close();
	} catch (Exception e) {
	    String message = e+" .";
%>
        	<h1 align="center" id="error-msg" style="background-color: #FFBABA; border: 1px solid #D8000C; color: #D8000C; padding: 10px;">
        	    <%= message %>
			<br><br>
			Redirecting to cart...
      	  </h1>
		<script>
      	      setTimeout(function() {
      	          window.location.href = "cart.jsp";
      	      }, 2000); // redirect after 2 seconds
      	  </script>
<%
	}
	
%>