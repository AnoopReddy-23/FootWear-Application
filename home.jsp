<!DOCTYPE html>
<html>
<head>
	<title>Stylish Footwear - Your One-Stop Shop for Fashionable Shoes</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="home.css">
</head>
<body>
	<header>
		<h1>Stylish Footwear</h1>
		<p>Your One-Stop Shop for Fashionable Shoes</p>
	</header>
	
	<main>
		<section class="banner">
			<h2>Step Up Your Style with Our Latest Collection</h2>
			<a class="btn" onclick="checkSession()">Shop Now</a>
		</section>
		
		<section class="featured">
			<h2>Featured Products</h2>
			<div class="products">
				<div class="product">
					<img src="https://images.unsplash.com/photo-1534709646158-7d3b53dcc7da?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTZ8fGZvb3R3ZWFyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60" alt="Product 1">
					<h3>Crocs</h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
					<a class="btn" onclick="checkSession()">Shop Now</a>
				</div>
				<div class="product">
					<img src="https://plus.unsplash.com/premium_photo-1663127206581-d7acd0092e2c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTN8fHJ1bm5pbmclMjBzaG9lfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60" alt="Product 2">
					<h3>Running Shoes</h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
					<a onclick="checkSession()" class="btn">Shop Now</a>
				</div>
				<div class="product">
					<img src="https://images.unsplash.com/photo-1562183241-840b8af0721e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fHJ1bm5pbmclMjBzaG9lfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60" alt="Product 3">
					<h3>Sneakers</h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
					<a onclick="checkSession()" class="btn">Shop Now</a>
				</div>
			</div>
		</section>
	</main>


<script>
    function checkSession() {
  // Check if the session attribute exists
  <% if (session.getAttribute("username") == null) { %>
    // If not, redirect to the login page
    window.open('login.html', '_top', 'fullscreen=yes');
  <% } else { %>
    // If yes, redirect to the catalog page
    window.open('catalogue.jsp', 'right', 'fullscreen=no');
  <% } %>
}
</script>

</body>
</html>
