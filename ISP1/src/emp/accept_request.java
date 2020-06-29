package emp;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Employee/accept_request")
public class accept_request extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection conn=null;
		Statement stmt = null;
		String rid=request.getParameter("rid");
		
		try {
			 conn = DbConn.createConnection(); 
		     stmt = (Statement) conn.createStatement();
		        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
				 LocalDateTime today = LocalDateTime.now();
				 String current= formatter.format(today); 
		        System.out.println("STATEMENT IS CREATED...1...");
		        String sql =( "UPDATE request  SET  rstatus = '1', rdate='"+current+"' WHERE rid='"+rid+"'");
			    System.out.println("......GOING TO UPDATE QUERY......");
			    int i= stmt.executeUpdate(sql);
		         System.out.println("...EXECUTE UPDATION QUERY....");

//		         String sql1 =( "UPDATE customer SET  status = '1' WHERE cid='"+cid+"'");
//				    System.out.println("......GOING TO UPDATE QUERY......");
//				    int i1= stmt.executeUpdate(sql1);
//			         System.out.println("...EXECUTE UPDATION QUERY....");
	        if(i>0)
	        		{
	        	 System.out.println("...EXECUTE UPDATION QUERY....");
	        	 RequestDispatcher rd=request.getRequestDispatcher("request.jsp");
	        	 rd.forward(request, response);
	        	       // response.sendRedirect("request.jsp");
	        		}
	        	System.out.println("UPDATION  PROCESS..FINISH....");

		}
		
		catch(Exception e) 
		{
			System.out.println(e.toString());
		}

	}

	
	}

