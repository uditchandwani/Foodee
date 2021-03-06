<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import = "java.sql.Connection"%>
<%@ page import = "java.sql.DriverManager"%>
<%@ page import = "java.sql.PreparedStatement"%>
<%@ page import = "java.sql.ResultSet"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Order Details</title>
	<link rel="stylesheet" href="style.css">	
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
	<link href="https://fonts.googleapis.com/css2?family=Jost&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="home.css">	
	<style type="text/css">
		.order-detail-start
		{
		
		}
		.order-detail-row
		{
			background-color: rgb(220, 222, 221);
			margin-top: 15px;
			padding: 10px 10px 10px 10px;
			border-radius: 0.5em;
		}
		.order-detail-left
		{
			float: left;
		}
		.order-detail-right
		{
		
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
				String email="";
				//allow access only if session exists
				String user = null;
				if(session.getAttribute("user") == null){
					response.sendRedirect("login.jsp");
				}
				else
				{
					user = (String) session.getAttribute("user");
					out.println("<span>Hello "+user+"</span>");
					out.println("<br><a href=\"index.jsp\">Log out</a>");
					email = (String)session.getAttribute("user_email");
				}
			%>
		</div>
	</div>
	</div>
	<div class="container">
	<div class="order-detail-start">
	<%
	try
	{	
		//JDBC
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/foodOrder","udit","udit@0309");
		//query 1
		String qr="select * from personal_info pi inner join order_details od on pi.order_id=od.order_id where od.email=?";
		PreparedStatement ps=con.prepareStatement(qr);
		ps.setString(1, email);
		ResultSet rs=ps.executeQuery();
		int i=0;
		while(i==0)
		{
			if(rs.next())
			{
				out.print("<div class=\"order-detail-row\">");
				out.print("<div class=\"order-detail-left\">");
				String oid = rs.getString(1);
				out.println("<span>Order id : "+rs.getString(1)+"</span><br> ");
				out.println("<span>Pincode : "+rs.getString(2)+"</span><br>");
				out.println("<span>Phone No. : "+rs.getString(3)+"</span><br>");
				out.println("<span>Address : "+rs.getString(4)+"</span><br>");
				out.println("<span>Landmark : "+rs.getString(5)+"</span><br>");
				out.println("<span>Order Status : "+rs.getString(6)+"</span>");
				out.print("</div>");
				rs.previous();
				out.print("<div class=\"order-detail-right\">");
				out.print("<table align=\"center\" style=\"text-align: center;\">");
				out.print("<tr>");
				out.print("<th>Items</th>");
				out.print("<th>Quantity</th>");
				out.print("<th>Price</th>");
				out.print("</tr>");
				int total=0;
				while(rs.next())
				{
					if(rs.getString(1).equals(oid))
					{
						out.print("<tr>");
						out.print("<td style=\"padding: 5px 5px 5px 5px\">"+rs.getString(9)+"</td>");
						out.print("<td style=\"padding: 5px 5px 5px 5px\">"+rs.getString(11)+"</td>");
						out.print("<td style=\"padding: 5px 5px 5px 5px\">"+rs.getString(10)+" Rs</td>");
						out.print("</tr>");
						total+=((Integer.parseInt(rs.getString(11)) )* (Integer.parseInt(rs.getString(10))));
					}
					else
					{
						rs.previous();
						break;
					}
				}
				out.print("<th></th><th>Total</th><th>"+total+" Rs</th>");
				out.print("</table>");
				out.print("</div>");
				out.print("</div>");
			}
			else
				i=1;
		}
		con.close();
	}catch(Exception e)
	{
		out.println(e);
	}
	%>
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