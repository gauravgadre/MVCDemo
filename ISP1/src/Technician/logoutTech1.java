package Technician;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Technician/logoutTech1")
public class logoutTech1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession(false);
		String cemail=(String)session.getAttribute("temail");
		
		if(cemail!=null) {
			session.setAttribute("temail",null);
			response.sendRedirect("../login.jsp");
		}
		
	}
}
