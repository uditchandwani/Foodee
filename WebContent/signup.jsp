<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<link href="https://fonts.googleapis.com/css2?family=Jost&display=swap" rel="stylesheet">
	<title>Foodee Sign Up</title>
	<style>
		*
		{
			font-family: 'Jost', sans-serif;
		}
		h2
		{
			font-size: 40px;
		}
		#d1
		{
			width: 60%;
			height: 80%;
			background: white;
			margin-top: 5%;
			padding-top: 1%;
			padding-bottom: 1%;
		}
		#p1
		{
			
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
		body
		{
			background: rgb(230,230,230);
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
	<center>
	<div id="d1" align="center">
		<form action="Usignup">
			<h2>Foodee</h2>
			<p id="p1">Sign up for your Account</p>
			<input type="text" name="firstName" placeholder="First Name" title="Please enter your First Name"><br>
			<input type="text" name="lastName" placeholder="Last Name" title="Please enter your Last Name"><br>
			<input type="email" name="email" placeholder="Email" title="Please enter your email id"><br>
			<input type="password" name="pwd" placeholder="Password" title="Please enter your password"><br>
			<input type="password" name="con_pwd" placeholder="Confirm Password" title="Please confirm your password"><br>
			<input type="submit" id="i1" value="Sign Up" name=""><br>
			<p id="p2">Already have an account?<a href="login.jsp">Log in here.</a></p>
		</form>
	</div><br> <br> <br>
	</center>
</body>
</html>