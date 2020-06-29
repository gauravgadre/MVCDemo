package Admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Admin/deletepackage")
public class deletepackage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		Connection con;
		PreparedStatement st;
		ResultSet rs;
		try
		{ 
			
			
			DbHelper db=new DbHelper();
			 con=(Connection) db.getConnection(); 
			String pid = request.getParameter("pid");
					System.out.print("hh");
			st = (PreparedStatement) con.prepareStatement("delete from package where pid='"+pid+"'");
			st.executeUpdate();
			RequestDispatcher rd=request.getRequestDispatcher("viewpackage.jsp");
			rd.forward(request,response);
		}

		catch(Exception cx)
		{
			System.out.println(cx.toString());
		}   
	}
}
