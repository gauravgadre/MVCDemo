package Technician;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Technician/Forgot1_pass")
public class Forgot_pass extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");  
        PrintWriter out=response.getWriter();
		doGet(request, response);
		HttpSession session2=request.getSession();
		String cemail=(String) session2.getAttribute("demail");
		String upass=request.getParameter("npass");
		String cpass=request.getParameter("cpass");
		if(!upass.equals(cpass)) {
			request.setAttribute("error", "Password Not Match");
			 request.getRequestDispatcher("forgot.jsp").forward(request, response);
		}
		else {
			try{  
				
				int i=TechDao.insertData("update technician set tpass='"+upass+"' where temail='"+cemail+"'");  
			
				if(i>0) {
					request.getRequestDispatcher("../login.jsp").forward(request, response);
					
				}else {
					out.println("Data Not Inserted");
				}
				 
				}catch(Exception e){ out.println(e);}	
		}
		
		
	}

}
