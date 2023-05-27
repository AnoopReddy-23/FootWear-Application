<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Shopping Catalogue</title>
	<link rel="stylesheet" href="catalogue.css">
	  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<style>.checked {
  color: orange;
}
</style>
</head>
<body>
	<header>
		<h1>Shopping Catalogue</h1>
	</header>
	<div class="container">
	<%
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/wt_cbp_db","root","root");
		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery("SELECT * FROM products");

		while(rs.next()){
			String productid=rs.getString("productid");
			String productname=rs.getString("productname");
			String color=rs.getString("color");
			String size=rs.getString("size");
			String price=rs.getString("price");
			String type=rs.getString("type");
			String image=rs.getString("image");
			String description=rs.getString("description");
	%>
		<div class="card">
			<img src="<%=image%>" alt="<%=productname%>" >
				<h2><%=productname%></h2>
				<p class="price">Rs <%=price%></p>
				<p>Color: <%=color%></p>
				<p>Size: <%=size%></p>
				<p>Type: <%=type%></p>
				<p class="flex">
				<span class="fa fa-star checked"></span>
				<span class="fa fa-star checked"></span>
				<span class="fa fa-star checked"></span>
				<span class="fa fa-star checked"></span>
				<span class="fa fa-star-half-alt checked"></span>
				</p>
				<form method="post" action="addtocart.jsp">
            			<input type="hidden" name="productid" value="<%=productid%>">
            			<input type="hidden" name="productname" value="<%=productname%>">	
            			<input type="hidden" name="size" value="<%=size%>">
            			<input type="hidden" name="price" value="<%=price%>">
            			<input type="hidden" name="image" value="<%=image%>">
            			<button type="submit">Add to Cart</button>
        			</form>
		</div>
	<%
		}
			rs.close();
			stmt.close();
			con.close();
		}catch(Exception e){
			out.println(e);
		}
	%>
	</div>
</body>
</html>
