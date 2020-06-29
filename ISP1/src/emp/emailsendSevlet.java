package emp;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class emailsendSevlet
 */
@WebServlet("/Employee/emailsendSevlet")
public class emailsendSevlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		LocalDateTime today = LocalDateTime.now();
		String current= formatter.format(today);
		
		String message="this message using java code ..."+current;
		 String tid=request.getParameter("tid");
		 Connection connection=null;
         Statement stmt=null;
         response.setContentType("text/html;charset=UTF-8");

	
try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection connection1=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/isp","root","mysql123");
	System.out.println("database connected");
	stmt = (Statement) connection1.createStatement();  
	ResultSet rs = stmt.executeQuery("SELECT * FROM technician where tid="+tid);
	   if(rs.next()) {
		   // create instance of Random class 
	        Random rand = new Random(); 
	  
	        // Generate random integers in range 0 to 999 
	       
	        int rand_int2 = rand.nextInt(1000000);
	        String password="pass@"+rand_int2;
	        String email=rs.getString("email");
		   System.out.println(""+email+" update technician set password="+password+" where tid="+tid+"");
//			Email email=new email("jagruti.chaudhari.178@gmail.com","ram123456");
//			email.setFrom("jagruti.chaudhari.178@gmail.com", "fun");
//			email.setSubject("Your login credentials ");
//			email.setContent("<h1>hello ,  </h1>here is your username and password<br>username="+email+"<br>password="+password, "text/html");
//			email.addRecipient(email);
//			stmt.executeUpdate("update technician set password='"+password+"' where tid="+tid);
//			email.send();
//			

	   }
						
		
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
