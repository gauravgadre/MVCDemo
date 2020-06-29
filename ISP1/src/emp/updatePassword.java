package emp;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class updatePassword
 */
@WebServlet("/Employee/updatePassword")
public class updatePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String password=(String)request.getParameter("newpass");
		HttpSession session = request.getSession(); 
		String email=(String)session.getAttribute("uemail");
		try{
			System.out.println("update emp set password='"+password+"' where email='"+email+"'");
			int i=DbConn.insertData("update emp set password='"+password+"' where email='"+email+"'");  
	        if(i>0){   
	        	RequestDispatcher rd=request.getRequestDispatcher("manageprofile.jsp");
				rd.forward(request,response);
	          }else{  
	        	request.setAttribute("error", "Unable to update Password.");
	            RequestDispatcher rd=request.getRequestDispatcher("updatePassword.jsp");  
		        rd.forward(request, response);
	        }               
	        }catch(Exception ex){ex.printStackTrace();} 
	}

	}
