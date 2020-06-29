package ISPPackage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Forgot1")
public class Forgot extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public Forgot() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

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
			 request.getRequestDispatcher("forgot.jsp").include(request, response);
		}
		else {
			try{  
				
				int i= ISPDao.insertData("update "+session2.getAttribute("table")+" set "+session2.getAttribute("col2")+"='"+upass+"' where "+session2.getAttribute("col")+"='"+cemail+"'");  
				session2.invalidate();
				if(i>0) {
					response.sendRedirect("login.jsp");
				}else {
					out.println("Data Not Inserted");
				}
				 
				}catch(Exception e){ out.println(e);}	
		}
		
		
	}

}
