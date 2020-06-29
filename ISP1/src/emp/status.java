package emp;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Employee/status")
public class status extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection conn= null;
		Statement stmt = null;
		String cid=request.getParameter("cid");
		
		try {
			 conn = (Connection) DbConn.createConnection(); 

		        stmt = (Statement) conn.createStatement();
		        System.out.println("STATEMENT IS CREATED...1...");
		        String sql =( "UPDATE customer_req  SET  status = '2' WHERE cid='"+cid+"'");
			    System.out.println("......GOING TO UPDATE QUERY......");
			    int i= stmt.executeUpdate(sql);
		         System.out.println("...EXECUTE UPDATION QUERY....");

	        
	        if(i>0)
	        		{
	        	RequestDispatcher rd=request.getRequestDispatcher("search.jsp");
				rd.forward(request,response);
	        	  
	        		}
	        	System.out.println("UPDATION  PROCESS..FINISH....");

		}
		
		catch(Exception e) 
		{
			System.out.println(e.toString());
		}

	

	}
}
