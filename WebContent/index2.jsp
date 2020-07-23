<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Food Order</title>
<link rel="stylesheet" href="style.css">	
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css2?family=Jost&display=swap" rel="stylesheet">
<script src="foodorder2.js" async></script>
<link rel="stylesheet" href="home.css">	


</head>
<body >
	
	<div class="header">
	<div class="container">
		<h1 style="line-height: 20px;font-size: 50px;">Foodee</h1>
		<h2 style="line-height: 20px;"><i>Deliciousness Jumping Into The Mouth</i></h2>
		<center>
		<table style="width: 30%;border: none;cellspacing: 20px;">
			<tr>
				<td style="width: 50%;text-align: center;background-color: rgb(255, 255, 255);border-radius: .5em;border: none;"><a href="#" style="text-decoration: none;">Home</a></td>
				<td style="width: 50%;text-align: center;background-color: rgb(255, 255, 255);border-radius: .5em;border: none;"><a href="order_details.jsp" style="text-decoration: none;">Order Details</a></td>
			</tr>
		</table>
		</center>
		<div class="log-in-link">
			<%
				//allow access only if session exists
				String user = null;
				if(session.getAttribute("user") == null){
					response.sendRedirect("login.jsp");
				}
				else user = (String) session.getAttribute("user");
				out.println("<span>Hello "+user+"</span>");
				out.println("<br><a href=\"index.jsp\">Log out</a>");
			%>
		</div>
	</div>
	</div>
	
	<div class="container">
	<div class="menu-start">
			<div class="menu-head">
				Menu
			</div>
			<table style="width: 100%;border: none;padding-left: 110px;">
			<tr>
			<td style="border: none;">
			<div class="menu-item">
				<div style="float: left;"><img class="item-img" src="res_img_5.jpg"></div>
				<div>
					<div class="item-title">Pineapple Juice</div>
					<div class="item-price">130 Rs</div>
					<div class="btn-add-to-cart"><button class="btn-add">Add to cart</button></div>
				</div>
			</div>
			<br>
			<div class="menu-item">
				<div style="float: left;"><img class="item-img" src="res_img_5.jpg"></div>
				<div>
					<div class="item-title">Freshly Sweet Lime Juice</div>
					<div class="item-price">160 Rs</div>
					<div class="btn-add-to-cart"><button class="btn-add">Add to cart</button></div>
				</div>
			</div>
			<br>
			<div class="menu-item">
				<div style="float: left;"><img class="item-img" src="res_img_5.jpg"></div>
				<div>
					<div class="item-title">Soft Drinks</div>
					<div class="item-price">100 Rs</div>
					<div class="btn-add-to-cart"><button class="btn-add">Add to cart</button></div>
				</div>
			</div>
			<br>
			<div class="menu-item">
				<div style="float: left;"><img class="item-img" src="res_img_5.jpg"></div>
				<div>
					<div class="item-title">Vegetable Seekh Kebab</div>
					<div class="item-price">215 Rs</div>
					<div class="btn-add-to-cart"><button class="btn-add">Add to cart</button></div>
				</div>
			</div>
			</td>
			<td style="border: none;">
			<div class="menu-item">
				<div style="float: left;"><img class="item-img" src="res_img_5.jpg"></div>
				<div>
					<div class="item-title">Veg Noodles</div>
					<div class="item-price">150 Rs</div>
					<div class="btn-add-to-cart"><button class="btn-add">Add to cart</button></div>
				</div>
			</div>
			<br>
			<div class="menu-item">
				<div style="float: left;"><img class="item-img" src="res_img_5.jpg"></div>
				<div>
					<div class="item-title">Kadai Paneer</div>
					<div class="item-price">250 Rs</div>
					<div class="btn-add-to-cart"><button class="btn-add">Add to cart</button></div>
				</div>
			</div>
			<br>
			<div class="menu-item">
				<div style="float: left;"><img class="item-img" src="res_img_5.jpg"></div>
				<div>
					<div class="item-title">Punjabi Chole</div>
					<div class="item-price">200 Rs</div>
					<div class="btn-add-to-cart"><button class="btn-add">Add to cart</button></div>
				</div>
			</div>
			<br>
			<div class="menu-item">
				<div style="float: left;"><img class="item-img" src="res_img_5.jpg"></div>
				<div>
					<div class="item-title">Rice with Rajma Masala</div>
					<div class="item-price">265 Rs</div>
					<div class="btn-add-to-cart"><button class="btn-add">Add to cart</button></div>
				</div>
			</div>
			</td>
			</tr>
		</table>
	</div>
	
	
	
	<div class="cart-start">
		<div class="cart-head">Cart</div>
		<!-- <div class="cart-row">
			<div style="float: left;width: 40%;border-bottom: 1px solid black;"><span class="cart-item">Item</span></div>
			<div style="float: left;width: 20%;border-bottom: 1px solid black;"><span class="cart-price">Price</span></div>
			<div style="float: left;width: 40%;border-bottom: 1px solid black;"><span class="cart-quantity">Quantity</span></div>
			<br><br>
		</div>
		<div class="cart-items">
			<div class="cart-row">
				<div class="cart-column">
					<img class="cart-item-img" src="res_img_5.jpg" width="100" height="100">
					<span class="cart-item-title">T-shirt</span>
				</div>
				<div class="cart-item-price">215 Rs</div>
				<div class="cart-item-quantity">
					<input type="number" value="1" class="cart-quantity-input">
					<button class="cart-remove-btn">Remove</button>
				</div>
			</div>

		</div> -->
		<form action="personalinfo.jsp">
		<table class="cart-table">
			<tr>
				<!-- <th style="width: 20%"></th> -->
				<th style="width: 40%;font-size: 20px;" colspan="2">Item</th>
				<th style="width: 20%;font-size: 20px;">Price</th>
				<th style="width: 40%;font-size: 20px;">Quantity</th>
			</tr>
			
		</table>
		<div class="cart-total">
            <span class="cart-total-title">Total</span>
            <span class="cart-total-price">0 Rs</span>
        </div>
        <input class="btn-purchase" type="submit" value="CHECK OUT">
		</form>
	</div>

</div>

<footer class="footer-distributed">
 
			<div class="footer-left">
				<h3 style="font-size: 55px;font-family: 'Jost', sans-serif;">Foodee</h3>
  			</div>
 
			<div class="footer-center">
				<div>
					<i class="fa fa-map-marker"></i>
					  <p><span>309 - Bhawarkua Road,</span>
						Indore, Madhya Pradesh - 452014</p>
				</div>
 
				<div>
					<i class="fa fa-phone"></i>
					<p>+91 999999999</p>
				</div>
				<div>
					<i class="fa fa-envelope"></i>
					<p><a href="mailto:foodpicky@gmail.com">foodpicky@gmail.com</a></p>
				</div>
			</div>
			<div class="footer-right">
				<p class="footer-company-about">
					<span>About the company</span>
					We deliver the delicious food in the city to your home.</p>
				<div class="footer-icons">
					<a href="#"><i class="fa fa-facebook"></i></a>
					<a href="#"><i class="fa fa-twitter"></i></a>
					<a href="#"><i class="fa fa-instagram"></i></a>
					<a href="#"><i class="fa fa-linkedin"></i></a>
					<a href="#"><i class="fa fa-youtube"></i></a>
				</div>
			</div>
		</footer>

</body>
</html>