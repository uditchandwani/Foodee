<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Home</title>
<link rel="stylesheet" href="style.css">	
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css2?family=Jost&display=swap" rel="stylesheet">
<link rel="stylesheet" href="home.css">	

<style type="text/css">
	.header1
	{
		padding-top: 25px;
	}
	.admin_op
	{
		background-color: rgb(220, 222, 221);
		border-radius: 0.5em;
		font-size: 20px;
		width: 40%;
	}
	.op_link
	{
		text-decoration: none;
	}
	.op_div
	{
		padding-top: 50px;
	}

</style>

</head>
<body>
	<div class="header header1">
	<div class="container">
		<a href="admin_index.jsp" style="text-decoration: none;color: rgb(0,0,0)"><span style="line-height: 20px;font-size: 50px;font-weight: bold;padding-top: 20px;">Foodee</span>
		<span>Admin</span></a>
		<h2 style="line-height: 20px;"><i>Deliciousness Jumping Into The Mouth</i></h2>
		<!--  <center>
		<table style="width: 30%;border: none;cellspacing: 20px;">
			<tr>
				<td style="width: 50%;text-align: center;background-color: rgb(255, 255, 255);border-radius: .5em;border: none;"><a href="#" style="text-decoration: none;">Home</a></td>
				<td style="width: 50%;text-align: center;background-color: rgb(255, 255, 255);border-radius: .5em;border: none;"><a href="order_details.jsp" style="text-decoration: none;">Order Details</a></td>
			</tr>
		</table>
		</center>-->
		<div class="log-in-link">
			<%
				//allow access only if session exists
				String admin = null;
				if(session.getAttribute("admin") == null){
					response.sendRedirect("admin_login.jsp");
				}
				else 
				{
					admin = (String) session.getAttribute("admin");				
					out.println("<span>Hello "+admin+"</span>");
					out.println("<br><a href=\"admin_login.jsp\">Log out</a>");
				}
			%>
		</div>
	</div>
	</div>
	
	
	<div align="center" class="op_div">
		<p class="admin_op"><a class="op_link" href="manage_orders.jsp">Manage Orders</a></p>
		<p class="admin_op"><a class="op_link" href="#">Manage Food Items</a></p>
		<p class="admin_op"><a class="op_link" href="mange_users.jsp">Manage Users</a></p>
		<p class="admin_op"><a class="op_link" href="#">Add Admin</a></p>
	
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