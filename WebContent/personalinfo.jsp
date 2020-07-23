<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
	<link href="https://fonts.googleapis.com/css2?family=Jost&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="style.css">
	<link rel="stylesheet" href="home.css">	
	<title>Personal Details</title>
	<script src="personaldetails.js" async></script>
	<script src="foodorder2.js" async></script>
	<style>
		
		#d1
		{
			background: white;
		}
		#p1
		{
			padding-top: 1%;
			padding-bottom: 1%;
			font-size: 30px;

		}
		#p2
		{
			
		}
		#i1
		{
			background: rgb(251,82,0);
			color: white;
		}
		.input-pincode
		{
		
		}
		.input-phone
		{
		
		}
		body
		{

		}
		img
		{
			padding-top: 5%;
			
		}
		input
		{
			padding-top: 1.3%;
			padding-bottom: 1.3%;
			font-size: 15px;
			margin-bottom:2.5%;
			width: 41%;
		}
	</style>
</head>
<body>
	
	<div class="header">
	<div class="container">
		<h1 style="line-height: 20px;font-size: 50px;">Foodee</h1>
		<h2 style="line-height: 20px;"><i>Deliciousness Jumping Into The Mouth</i></h2>
		<center>
		<table style="width: 30%;border: none;cellspacing: 20px;">
			<tr>
				<td style="width: 50%;text-align: center;background-color: rgb(255, 255, 255);border-radius: .5em;border: none;"><a href="index2.jsp" style="text-decoration: none;">Home</a></td>
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
	
	
		
	
	
	<center>
	<div id="d1" align="center">
		<form action="Uorder">
			
			<p id="p1">Please enter your Personal Details</p>
			<input type="number" name="pincode" class="input-pincode" value="452001" placeholder="Pincode" title="Please enter your Pincode" required><br>
			<input type="number" name="phone" class="input-phone" placeholder="Phone Number" title="Please enter your Phone Number" required><br>
			<input type="text" name="address" placeholder="Address" title="Please enter your Address" required><br>
			<input type="text" name="landmark" placeholder="Landmark(Optional)" title="Please enter your Landmark"><br>
			<input type="submit" id="i1" value="Enter" name=""><br>
		</form>
	</div><br> <br> <br>
	
	
	
	
	<div class="cart-start" style="width: 95%">
		<div class="cart-head">Cart</div>
	<form action="personalinfo.jsp">
		<table class="cart-table">
			<tr>
				<!-- <th style="width: 20%"></th> -->
				<th style="width: 40%;font-size: 20px;" colspan="2">Item</th>
				<th style="width: 20%;font-size: 20px;">Price</th>
				<th style="width: 40%;font-size: 20px;">Quantity</th>
			</tr>
			<%
				for(int iterator1=1;;iterator1++)
				{
					if(request.getParameter("cart-item-"+iterator1)!=null)
					{
						//out.println(request.getParameter("cart-item-"+iterator1)+"<br>");
						
						out.println(
									"<tr class=\"cart-row\">"+
										"<td class=\"cart-column\"><img class=\"cart-item-img\" src=\"res_img_5.jpg\" width=\"100\" height=\"100\"></td>"+
										"<td class=\"cart-item-title-1\"><span class=\"cart-item-title\">"+request.getParameter("cart-item-"+iterator1)+"</span></td>"+
										"<td class=\"cart-item-price\">100</td>"+
										"<td class=\"cart-item-quantity\"><input type=\"number\" value=\"1\" class=\"cart-quantity-input\">"+
											"<!--<button class=\"cart-remove-btn\">Remove</button>--></td>"+
									"</tr>"
									);
					}
					else
						break;
					 
				}
			%>
			
		</table>
		<div class="cart-total">
            <span class="cart-total-title">Total</span>
            <span class="cart-total-price">0 Rs</span>
        </div>
		</form>
		</div>
	</center>
	
	
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