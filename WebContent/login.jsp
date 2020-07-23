<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<link href="https://fonts.googleapis.com/css2?family=Jost&display=swap" rel="stylesheet">
	<title>Foodee Log In</title>
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
		<form action="Ulogin">
			<!-- <img src="mi.png" height="50px"><br> -->
			<h2>Foodee</h2>
			<p id="p1">Log in to your Account</p>
			<input type="email" name="email" placeholder="Email" title="Please enter your email id"><br>
			<input type="password" name="pwd" placeholder="Password" title="Please enter your password"><br>
			<input type="submit" id="i1" value="Log in" name=""><br>
			<p id="p2">Don't have an account?<a href="signup.jsp">Create here.</a></p>
			<p id="p2">Have an Admin account?<a href="admin_login.jsp">Log in here</a></p>
		</form>
	</div><br> <br> <br>
	</center>
</body>
</html>