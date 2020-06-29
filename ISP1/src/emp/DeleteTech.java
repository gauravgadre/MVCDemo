package emp;

import java.io.IOException;
import java.io.PrintWriter;
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
 * Servlet implementation class DeleteTech
 */
@WebServlet("/Employee/DeleteTech")
public class DeleteTech extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		Connection con;
		PreparedStatement st;
		ResultSet rs;
		try
		{ 
			 con= (Connection) DbConn.createConnection(); 
			 String tid =request.getParameter("tid");
			 st= con.prepareStatement("delete from technician where tid = '"+tid+"'");
			 st.executeUpdate();
		// System.out.println("DELETE RECORD ");
			 RequestDispatcher rd=request.getRequestDispatcher("view.jsp");
        	 rd.forward(request, response);
		
		}
		catch(Exception cx)
		{
		System.out.println(cx.toString());
		}   
		}
	}
