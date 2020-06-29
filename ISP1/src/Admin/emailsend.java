package Admin;

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

import com.email.durgesh.Email;

 import javax.mail.SendFailedException;

@WebServlet("/Admin/emailsend")
public class emailsend extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		LocalDateTime today = LocalDateTime.now();
		String current= formatter.format(today);
		
		String message="this message using java code ..."+current;
		 String eid=request.getParameter("eid");
		 Connection con=null;
         Statement stmt=null;
         response.setContentType("text/html;charset=UTF-8");

	
try {
	DbHelper db=new DbHelper();
		 con=(Connection) db.getConnection();
	stmt = (Statement) con.createStatement();  
	ResultSet rs = stmt.executeQuery("SELECT * FROM isp_project.emp  where eid="+eid);
	   if(rs.next()) {
		   // create instance of Random class 
	        Random rand = new Random(); 
	  
	        // Generate random integers in range 0 to 999 
	       
	        int rand_int2 = rand.nextInt(1000000);
	        String pass="pass@"+rand_int2;
	        String eemail=rs.getString("email");
		   System.out.println(""+eemail+" update emp set password="+pass+" where eid="+eid+"");
			Email email=new Email("jagruti.chaudhari.178@gmail.com","ram123456");
			email.setFrom("jagruti.chaudhari.178@gmail.com", "fun");
			email.setSubject("Your login credentials ");
			email.setContent("<h1>hello ,  </h1>here is your username and password<br>username="+eemail+"<br>password="+pass, "text/html");
			email.addRecipient(eemail);
			stmt.executeUpdate("update emp set password='"+pass+"' where eid="+eid);
			email.send();
			

	   }
						
		
		}
		catch(Exception e) {
			e.printStackTrace();
		}

	}
}
