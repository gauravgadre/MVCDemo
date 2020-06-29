package ISPPackage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.email.durgesh.Email;

/**
 * Servlet implementation class forgot1
 */
@WebServlet("/forgot2")
public class forgot1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String cemail=request.getParameter("uemail");
		 try{  
			 	Random randomGenerator = new Random();
				int randomInt = randomGenerator.nextInt(1000000);
	    		String subject="OTP";
	    		String content="<h1>This  is content </h1> Your OTP is "+randomInt;
				 ResultSet rs=ISPDao.get("customer_details where cemail='"+cemail+"'");
				 ResultSet rs1=ISPDao.get("emp where email='"+cemail+"'");
				 ResultSet rs2=ISPDao.get("technician where temail='"+cemail+"'");
				 
				 if(rs.next()) {
					 session.setAttribute("table","customer_details");
					 session.setAttribute("col","cemail");
					 session.setAttribute("col2","cpass");
					 cemail=rs.getString("cemail");
					 ISPDao.sendEmail(subject,content,cemail);
				 }
				 else if(rs1.next()) {
					 session.setAttribute("table","emp");
					 session.setAttribute("col","email");
					 session.setAttribute("col2","password");
					 cemail=rs.getString("email");
					 ISPDao.sendEmail(subject,content,cemail);
				 }
				 else if(rs.next()) {
					 session.setAttribute("table","technician");
					 session.setAttribute("col","temail");
					 session.setAttribute("col2","tpass");
					 cemail=rs.getString("temail");
					 ISPDao.sendEmail(subject,content,cemail);
				 }
				 else {
					 request.setAttribute("error", "Invalid Email Address");
					 request.getRequestDispatcher("forgot1.jsp").include(request, response);
				 }	    		
			    		
					 session.setAttribute("dotp", randomInt+"");
					 session.setAttribute("demail", cemail);
					 response.sendRedirect("otp.jsp");
				  
				}catch(Exception e){ System.out.println(e);}

	}
}
