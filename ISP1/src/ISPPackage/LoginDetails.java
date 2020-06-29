package ISPPackage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginDetails")
public class LoginDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 
		String email=request.getParameter("email");
		String upass=request.getParameter("upass");
			String id=request.getParameter("id");
			
			  try{  
				  
				  String module=ISPDao.getModule(email, upass);
				  if(module=="Admin") {
					  HttpSession session=request.getSession();
					  session.setAttribute("user", email);
					  response.sendRedirect("Admin/index.jsp");
				  }
				  else if(module=="Employee") {
					  HttpSession session=request.getSession();
					  session.setAttribute("uemail", email);
					  response.sendRedirect("Employee/index.jsp");
				  }
				  else if(module=="Technician") {
					  HttpSession session=request.getSession();
					  session.setAttribute("temail", email);
					  response.sendRedirect("Technician/index.jsp");
				  }
				  else if(module=="Customer") {
					  HttpSession session=request.getSession();
					  session.setAttribute("cemail", email);
					  if(id=="c") {
					  response.sendRedirect("checkout.jsp");
							}
						 else
						response.sendRedirect("index.jsp");
				  }
				  else {
						 request.setAttribute("error", "Invalid Credentials");
						 request.getRequestDispatcher("login.jsp").include(request, response);
					 }
				  

			}catch(Exception e){ System.out.println(e);}

	}

}
