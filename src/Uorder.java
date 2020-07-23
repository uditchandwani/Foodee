import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Uorder
 */
@WebServlet("/Uorder")
public class Uorder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Uorder() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		Random rand = new Random();
		int j=1;
		String pincode=request.getParameter("pincode");
		String phone=request.getParameter("phone");
		String address=request.getParameter("address");
		String landmark=request.getParameter("landmark");
		String status = "Pending";
		String num1=Integer.toString(rand.nextInt(100));
		String email="";
		
		//allow access only if session exists
		HttpSession session=request.getSession();;
		if(session.getAttribute("user") == null){
			response.sendRedirect("login.jsp");
		}
		else email = (String) session.getAttribute("user_email");
		 
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/foodOrder","udit","udit@0309");
			do
			{
				j=0;
				String qr1="select order_id from personal_info";
				PreparedStatement ps1=con.prepareStatement(qr1);
				ResultSet rs=ps1.executeQuery();
				if(rs.next())
				{
					//generating random number
					num1 = Integer.toString(rand.nextInt(100));
					
					do
					{
						if(num1.equals(rs.getString(1)))
						{
							j=1;
							break;
						}
					}while(rs.next());
				}
			}while(j==1);
				
			
			String qr="insert into personal_info values (?,?,?,?,?,?,?)";
			PreparedStatement ps=con.prepareStatement(qr);
			ps.setString(1, num1);
			ps.setString(2, pincode);
			ps.setString(3, phone);
			ps.setString(4, address);
			ps.setString(5, landmark);
			ps.setString(6, status);
			ps.setString(7, email);
			int rs=ps.executeUpdate();
			if(rs>0)
			{
//				response.sendRedirect("order_details.jsp");
			}
			else
			{
				out.println("somthing went wrong !!");
				out.println("<a href=\"index2.jsp\">Click Here to go to the home page</a>");
			}
			qr="insert into order_details values (?,?,?,?,?)";
			ps=con.prepareStatement(qr);
			ps.setString(1, num1);
			ps.setString(2, "Freshly Sweet Lime Juice");
			ps.setString(3, "160");
			ps.setString(4, "1");
			ps.setString(5, email);
			rs=ps.executeUpdate();
			if(rs>0)
			{
//				response.sendRedirect("order_details.jsp");
			}
			else
			{
				out.println("somthing went wrong !!");
				out.println("<a href=\"index2.jsp\">Click Here to go to the home page</a>");
			}
			qr="insert into order_details values (?,?,?,?,?)";
			ps=con.prepareStatement(qr);
			ps.setString(1, num1);
			ps.setString(2, "Vegetable Seekh Kebab");
			ps.setString(3, "215");
			ps.setString(4, "1");
			ps.setString(5, email);
			rs=ps.executeUpdate();
			if(rs>0)
			{
//				response.sendRedirect("order_details.jsp");
			}
			else
			{
				out.println("somthing went wrong !!");
				out.println("<a href=\"index2.jsp\">Click Here to go to the home page</a>");
			}
			qr="insert into order_details values (?,?,?,?,?)";
			ps=con.prepareStatement(qr);
			ps.setString(1, num1);
			ps.setString(2, "Soft Drinks");
			ps.setString(3, "100");
			ps.setString(4, "1");
			ps.setString(5, email);
			rs=ps.executeUpdate();
			if(rs>0)
			{
				response.sendRedirect("order_details.jsp");
			}
			else
			{
				out.println("somthing went wrong !!");
				out.println("<a href=\"index2.jsp\">Click Here to go to the home page</a>");
			}
			con.close();
		}catch(Exception e)
		{
			out.println(e);
		}
	}

}
