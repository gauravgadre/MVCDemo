package Technician;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/Technician/otp1_pass")
public class otp_pass extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int otp=Integer.parseInt(request.getParameter("otp"));
		HttpSession session2=request.getSession();
		int dotp=Integer.parseInt((String) session2.getAttribute("dotp"));
		
				 if(dotp==otp) {
					 request.getRequestDispatcher("forgot.jsp").forward(request, response);
					
				 }else {
					 request.setAttribute("error", "Invalid OTP");
					 request.getRequestDispatcher("otp.jsp").forward(request, response);
				 }
	}

}
