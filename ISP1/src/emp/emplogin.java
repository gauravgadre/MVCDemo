package emp;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;




/**
 * Servlet implementation class emplogin
 */
@WebServlet("/Employee/emplogin")
public class emplogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("served at").append(request.getContextPath());
   		Connection conn=null;
   		response.setContentType("text/html");
   		PrintWriter out = response.getWriter();  
   		String email =request.getParameter("email");
		String password =request.getParameter("password");
		HttpSession session = request.getSession(); 
		boolean flag=false;
		try {
			
			 conn = (Connection) DbConn.createConnection(); 
			 Statement  stmt = (Statement) ((java.sql.Connection) conn).createStatement();
			 String result=DbConn.emplogin("Select * from emp where email='"+email+"' and password='"+password+"'");
	        System.out.println("SELECTION  PROCESS BEGINSSSS");
	        if(result=="Found") {
				session.setAttribute("uemail", email);
				 RequestDispatcher rd=request.getRequestDispatcher("index.jsp");  
			        rd.include(request, response);
			}
			else {
				request.setAttribute("error", "INVALID Login Credentials");
		        RequestDispatcher rd=request.getRequestDispatcher("login.jsp");  
		        rd.include(request, response);
			}
	   	}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		

	}
