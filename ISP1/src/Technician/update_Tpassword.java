package Technician;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Technician/update_Tpassword")
public class update_Tpassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tpass=(String)request.getParameter("newpass");
		HttpSession session = request.getSession(); 
		String temail=(String)session.getAttribute("uemail");
		try{
			System.out.println("update technician set tpass='"+tpass+"' where temail='"+temail+"'");
			int i=TechDao.insertData("update technician set tpass='"+tpass+"' where temail='"+temail+"'");  
	        if(i>0){   
	        	RequestDispatcher rd=request.getRequestDispatcher("manage_profile.jsp");  
		        rd.forward(request, response);
	        }else{  
	        	request.setAttribute("error", "Unable to update Password.");
	            RequestDispatcher rd=request.getRequestDispatcher("updatePassword.jsp");  
		        rd.forward(request, response);
	        }               
	        }catch(Exception ex){ex.printStackTrace();} 
	}

}
