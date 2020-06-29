package Admin;

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


/**
 * Servlet implementation class forgetpassword
 */
@WebServlet("/Admin/forgetpassword")
public class forgetpassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String email=request.getParameter("email");
		String newpassword=request.getParameter("newpassword");
		String confirmpassword=request.getParameter("confirmpassword");
		
		Connection con=null;
		//String pass="";
		int id=0;
		try{
			Connection con1=DbHelper.getConnection();
			System.out.println("database connected");
		if(newpassword.equals(confirmpassword)){
		Statement st1=(Statement) con1.createStatement();
		
		int i=st1.executeUpdate("update adminlogin set password='"+newpassword+"' where email='"+email+"'");
		if(i>0) {
			request.setAttribute("success","password changed successfully");
			RequestDispatcher rd=request.getRequestDispatcher("Admin/adminlogin.jsp");
			rd.include(request,response);				
		}
		else {
			request.setAttribute("Error","Error");
			RequestDispatcher rd=request.getRequestDispatcher("Admin/forget_password.jsp");
			rd.include(request,response);			
		}
		st1.close();
		
		}
		con1.close();
		}
		catch(Exception e){
		e.printStackTrace();
		}
	}
}
	