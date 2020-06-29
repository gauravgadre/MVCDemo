package emp;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Employee/sendToAdmin")
public class sendToAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sid=(String)request.getParameter("sid");
		try {
			Connection con=DbConn.createConnection();
			Statement stmt =con.createStatement();
			int i=stmt.executeUpdate("update support_ticket set status=2 where sid="+sid);
			if(i>0) {
				RequestDispatcher rd=request.getRequestDispatcher("support.jsp");
				rd.forward(request,response);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}

}
