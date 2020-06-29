package ISPPackage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/otp1")
public class otp extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int otp=Integer.parseInt(request.getParameter("otp"));
		HttpSession session2=request.getSession();
		int dotp=Integer.parseInt((String) session2.getAttribute("dotp"));
		System.out.println(otp+" "+dotp);
				 if(dotp==otp) {
						 response.sendRedirect("forgot.jsp");
				 }else {
					 request.setAttribute("error", "Invalid OTP");
					 request.getRequestDispatcher("otp.jsp").include(request, response);
				 }
	}
}
