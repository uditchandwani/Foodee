

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class stat_changed
 */
@WebServlet("/stat_changed")
public class stat_changed extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public stat_changed() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		String order_id=request.getParameter("order_id");
		String selected=request.getParameter("selected");
		
			try
			{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/foodOrder","udit","udit@0309");
				
				String qr="update personal_info set status=? where order_id=?";
				PreparedStatement ps=con.prepareStatement(qr);
				ps.setString(1, selected);
				ps.setString(2, order_id);
				int rs=ps.executeUpdate();
				if(rs>0)
				{
					response.sendRedirect("manage_orders.jsp");
				}
				else
				{
					out.print("something wrong");
				}
				con.close();
			}catch(Exception e)
			{
				out.println(e);
			}	
		}
	}


