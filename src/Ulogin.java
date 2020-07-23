

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Ulogin
 */
@WebServlet("/Ulogin")
public class Ulogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Ulogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		String email=request.getParameter("email");
		String pwd=request.getParameter("pwd");
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/foodOrder","udit","udit@0309");
			String qr="select F_Name from user_Login where User_Email=? and User_Pwd=?";
			PreparedStatement ps=con.prepareStatement(qr);
			ps.setString(1, email);
			ps.setString(2, pwd);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				String F_Name = rs.getString(1);
				HttpSession session = request.getSession();
				session.setAttribute("user", F_Name);
				session.setAttribute("user_email", email);
//				Cookie loginCookie = new Cookie("user",F_Name);
//				Cookie user_email = new Cookie("user_email",email);
//				//setting cookie to expiry in 30 mins
//				loginCookie.setMaxAge(30*60);
//				user_email.setMaxAge(30*60);
//				response.addCookie(loginCookie);
//				response.addCookie(user_email);
				response.sendRedirect("index2.jsp");
			}
			else
			{
				response.sendRedirect("login.jsp");
			}
			con.close();
		}catch(Exception e)
		{
			out.println(e);
		}
	}

}
