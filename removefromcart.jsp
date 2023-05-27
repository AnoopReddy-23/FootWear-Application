<%@ page import="java.sql.*" %>

<%
    // Get the product name from the request parameter
    String productid = request.getParameter("productid");
    
    // Get the user ID from the session
    String userId = session.getAttribute("userId").toString();

    // Remove the item from the cart in the database
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/wt_cbp_db","root","root");
    Statement stmt = con.createStatement();
    int result = stmt.executeUpdate("DELETE FROM cart WHERE productid='" + productid + "' AND userid='" + userId + "'");
    if (result >0){
	String message = "Product Removed to Cart Successfully!";
%>
 	       <h1 align="center" id="success-msg" style="background-color: #DFF2BF; border: 1px solid #4F8A10; color: #4F8A10; padding: 10px;">
      	      <%= message %>
			<br><br>
			Redirecting to Cart...
      	  </h1>
      	  <script>
      	      setTimeout(function() {
      	          window.location.href = "cart.jsp";
      	      }, 2000); // redirect after 10 seconds
       	 </script>
<%
    		} else {
      		  String message = "Unable to Remove. Please try again.";
%>
        	<h1 align="center" id="error-msg" style="background-color: #FFBABA; border: 1px solid #D8000C; color: #D8000C; padding: 10px;">
        	    <%= message %>
			<br><br>
			Redirecting to Cart...
      	  </h1>
      	  <script>
      	      setTimeout(function() {
      	          window.location.href = "cart.jsp";
      	      }, 2000); // redirect after 10 seconds
      	  </script>

<%
	}
    // Close the database connection
    stmt.close();
    con.close();

    // Redirect to the cart page
    response.sendRedirect("cart.jsp");
%>
