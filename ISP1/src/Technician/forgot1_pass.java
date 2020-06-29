package Technician;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/Technician/forgot2_pass")
public class forgot1_pass extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String cemail=request.getParameter("temail");
		 try{  
				 ResultSet rs=TechDao.get("select * from technician where temail='"+cemail+"'");
				 if(rs.next()) {
					 Random randomGenerator = new Random();
						int randomInt = randomGenerator.nextInt(1000000);
						
				    		String subject="OTP";
				    		String content="<h1>This  is content </h1> Your OTP is "+randomInt;
				    		TechDao.sendEmail(subject,content,cemail);
				    		
				        HttpSession session2=request.getSession();
						 session2.setAttribute("dotp", randomInt+"");
						 session2.setAttribute("demail", cemail);
						 request.getRequestDispatcher("otp.jsp").forward(request, response);
						
				 }else {
					 request.setAttribute("error", "Invalid Email Address");
					 request.getRequestDispatcher("forgot1.jsp").forward(request, response);
				 }
				rs.close();  
				}catch(Exception e){ System.out.println(e);}

	}

}
