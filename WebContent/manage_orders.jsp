<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import = "java.sql.Connection"%>
<%@ page import = "java.sql.DriverManager"%>
<%@ page import = "java.sql.PreparedStatement"%>
<%@ page import = "java.sql.ResultSet"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Home</title>
<link rel="stylesheet" href="style.css">	
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css2?family=Jost&display=swap" rel="stylesheet">
<link rel="stylesheet" href="home.css">	

<script type="text/javascript">

	function stat_changed(event) {
		event.parentElement.getElementsByClassName('submit')[0].style.display="inline";
	}
	
</script>

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
	.order-account
	{
		font-weight: bold;
	}
	.sel
	{
	
	}
	.submit
	{
		display: none;
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
	
	
	<div class="container">
	<div class="order-detail-start">
	
		
	
	<%
	try
	{	
		//JDBC
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/foodOrder","udit","udit@0309");
		//query 1
		String qr="select * from personal_info pi inner join order_details od on pi.order_id=od.order_id";
		PreparedStatement ps=con.prepareStatement(qr);
		ResultSet rs=ps.executeQuery();
		int i=0;
		while(i==0)
		{
			if(rs.next())
			{
				out.print("<div class=\"order-detail-row\">");
				out.print("<form action=\"stat_changed\">");
				out.print("<div class=\"order-detail-left\">");
				String oid = rs.getString(1);
				out.println("<span class=\"order-account\">Account : "+rs.getString(7)+"</span><br>");
				out.println("<span>Order id : "+rs.getString(1)+"</span><br> ");
				out.println("<span>Pincode : "+rs.getString(2)+"</span><br>");
				out.println("<span>Phone No. : "+rs.getString(3)+"</span><br>");
				out.println("<span>Address : "+rs.getString(4)+"</span><br>");
				out.println("<span>Landmark : "+rs.getString(5)+"</span><br>");
				out.println("<span>Order Status : </span> <select name=\"selected\" onchange=\"stat_changed(this)\" class=\"sel\">");
				out.println("<option class=\"res\" value=\""+rs.getString(6)+"\">"+rs.getString(6)+"</option>");
				if(!(rs.getString(6).equals("Pending")))	
					out.println("<option class=\"pen\" value=\"Pending\">Pending</option>");
				if(!(rs.getString(6).equals("Confirmed")))	
					out.println("<option class=\"con\" value=\"Confirmed\">Confirmed</option>");
				if(!(rs.getString(6).equals("On The Way")))	
					out.println("<option class=\"otw\" value=\"On The Way\">On The Way</option>");
				if(!(rs.getString(6).equals("Delivered")))	
					out.println("<option class=\"del\" value=\"Delivered\">Delivered</option>");
				if(!(rs.getString(6).equals("Cancelled")))	
					out.println("<option class=\"can\" value=\"Cancelled\">Cancelled</option>");
				out.println("</select>");
				out.println("<input style=\"display: none;\" value=\""+rs.getString(1)+"\" type=\"text\" name=\"order_id\">");
				out.println("<input class=\"submit\" value=\"Submit\" type=\"submit\">");			
				out.print("</div>");
				out.println("</form>");
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