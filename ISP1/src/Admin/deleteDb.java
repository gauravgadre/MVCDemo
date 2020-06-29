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


/**
 * Servlet implementation class deleteDb
 */
@WebServlet("/Admin/deleteDb")
public class deleteDb extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Connection con;
		PreparedStatement st;
		ResultSet rs;
		try
		{ 
			DbHelper db=new DbHelper();
        	  con=(Connection) db.getConnection(); 
			String eid = request.getParameter("eid");
					System.out.print("hh");
			st = (PreparedStatement) con.prepareStatement("delete from emp where eid='"+eid+"'");
			st.executeUpdate();
			RequestDispatcher rd=request.getRequestDispatcher("viewemp.jsp");
			rd.forward(request,response);
		}

		catch(Exception cx)
		{
			System.out.println(cx.toString());
		}   

	}

}
