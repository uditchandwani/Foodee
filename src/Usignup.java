

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Usignup
 */
@WebServlet("/Usignup")
public class Usignup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Usignup() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		String firstName=request.getParameter("firstName");
		String lastName=request.getParameter("lastName");
		String email=request.getParameter("email");
		String pwd=request.getParameter("pwd");
		String con_pwd=request.getParameter("con_pwd");
		if(pwd.equals(con_pwd))
		{
			try
			{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/foodOrder","udit","udit@0309");
				
				String qr="insert into user_login values (?,?,?,?)";
				PreparedStatement ps=con.prepareStatement(qr);
				ps.setString(1, firstName);
				ps.setString(2, lastName);
				ps.setString(3, email);
				ps.setString(4, pwd);
				int rs=ps.executeUpdate();
				if(rs>0)
				{
					response.sendRedirect("login.jsp");
				}
				else
				{
					out.println("somthing went wrong !!");
					out.println("<a href=\"login.jsp\">Click Here to go to the log-in page</a>");
				}
				con.close();
			}catch(Exception e)
			{
				out.println(e);
			}	
		}
		else
		{
			out.print("password does not match");
		}
		
		
	}

}
