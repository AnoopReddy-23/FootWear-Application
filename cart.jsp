<%@page import="java.sql.*, javax.servlet.http.*, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Shopping Cart</title>
	<link rel="stylesheet" href="cart.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<link
      href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.css"
      rel="stylesheet"
      />

</head>
<body>
	<header>
		<h1>Shopping Cart</h1>
	</header>
	<div class="container">
			<%
				// Get the cart items for the current user from the database
				String userId = session.getAttribute("userId").toString();
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/wt_cbp_db","root","root");
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery("SELECT * FROM cart WHERE userid='" + userId + "'");

				// Display the cart items in the HTML table
				if (!rs.next()) {
			%>
					<h1 align="center" id="success-msg" style="background-color: #DFF2BF; border: 1px solid #4F8A10; color: #4F8A10; padding: 10px;"> Your Cart is Empty! 
      	  </h1>
      	  <script>
      	      setTimeout(function() {
      	          window.location.href = "cart.jsp";
      	      }, 3000); // redirect after 10 seconds
       	 </script>
				<%
				} else {
			%>
					<table id="mytable">
						<thead>
							<tr>
								<th></th>
								<th>Product Name</th>
								<th>Size</th>
								<th>Price</th>
								<th>Quantity</th>
								<th>SubTotal</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
  							<%
							    do {
							      String productid = rs.getString("productid");
							      String productName = rs.getString("productname");
      							String size = rs.getString("size");
      							String price = rs.getString("price");
      							String image = rs.getString("image");
      							int quantity = rs.getInt("quantity");
      							float subtotal = quantity * Float.parseFloat(price);
  							%>
      							<tr>
      							  <td><img src="<%= image %>" alt="<%= productName %>" ></td>
     								  <td><%= productName %></td>
        							  <td><%= size %></td>
       							  <td>Rs <%= price %></td>
       							  <td>
									<div class="d-flex flex-row m-2 ">
			                                        <button class="btn btn-danger btn-sm m-2 p-2" type="button" onclick="decrement('<%=userId%>','<%=productid%>','<%=quantity%>')"> - </button>
                  			                       <h3 class="m-1"><%=quantity%></h3>
                                    			    <button class="btn btn-success btn-sm m-2 p-2" type="button" onclick="increment('<%=userId%>','<%=productid%>','<%=quantity%>')"> + </button>
                                            
                                    			</div>
								  </td>
							        <td>Rs <span class="total-cell"><%= String.format("%.2f", subtotal) %></span></td>
      							  <td><a href="removefromcart.jsp?productid=<%= productid %>"><i class="fa fa-trash" style="color:red;"></i></a></td>
      							</tr>
  							<%
  							  } while (rs.next());
 							 %>
						</tbody>
					</table>
					<div class="checkout">
						<p id="total"></p>
						<form method="post" action="checkout.jsp">
							<button type="submit">Checkout</button>
						</form>
	<%
		}

		// Close the database connection
		rs.close();
		stmt.close();
		con.close();
	%>
	</div>

<script>
    function increment(userid,productid,quantity){
        window.location.href="http://localhost:8080/Footwear/increment.jsp?userid="+userid+"&productid="+productid+"&quantity="+quantity;
    }

    function decrement(userid,productid,quantity){
        window.location.href="http://localhost:8080/Footwear/decrement.jsp?userid="+userid+"&productid="+productid+"&quantity="+quantity;
    }

    updateCheckoutTotal();

function updateCheckoutTotal() {
    let temp=document.getElementById("mytable");
	let total = 0;
	for (let i = 1; i <= temp.rows.length - 1; i++) {
	  let b = temp.rows[i].cells[5].innerHTML;
	  let brr = (b.split(">"))[1].split("<");
	  let b1 = parseFloat(brr[0]); // Use index 1 to get the numerical value after the currency symbol
	  if (!isNaN(b1)) { // check if b1 is a valid number
    		total += b1;
  	  }
	}
	document.getElementById("total").innerHTML = "Total - Rs " + total.toFixed(2); // Display the total with currency symbol and 2 decimal places

}</script>
</body>
</html>
