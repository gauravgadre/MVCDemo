package emp;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class EmpLogoutServlet
 */
@WebServlet("/Employee/EmpLogoutServlet")
public class EmpLogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession(false);
		String email=(String)session.getAttribute("uemail");
		if(email!=null)
		{
		    session.setAttribute("uemail",null);
		    response.setContentType("text/html");  
	        PrintWriter out=response.getWriter();  
	        request.getRequestDispatcher("index.jsp").include(request, response);  
	       
	        out.close();
		}
	}
}
