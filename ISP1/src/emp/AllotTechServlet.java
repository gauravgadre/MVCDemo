package emp;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class AllotTechServlet
 */
@WebServlet("/Employee/AllotTechServlet")
public class AllotTechServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		int rid=Integer.parseInt(request.getParameter("rid"));
		int tid=Integer.parseInt(request.getParameter("tid"));
		Connection conn=null;


	try
		{  
		 conn = (Connection) DbConn.createConnection(); 
       
	        DateTimeFormatter formatter=DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
	        LocalDateTime today =LocalDateTime.now();
	        String current =formatter.format(today);
	        Statement stmt=conn.createStatement();
	        String sql1 =( "UPDATE request  SET  adate='"+current+"' WHERE rid='"+rid+"'");
	        stmt.executeUpdate(sql1);
	        String sql2 =( "UPDATE technician  SET  tstatus = tstatus+1 WHERE tid='"+tid+"'");
	        stmt.executeUpdate(sql2);
		    
		     int i= stmt.executeUpdate("insert into allot_technician (rid,tid,allot_date)values('"+rid+"','"+tid+"','"+current+"')"); 
	        
	       
           	if(i>0)
           			{
           	 RequestDispatcher rd=request.getRequestDispatcher("AllotTech.jsp");
        	 rd.forward(request, response);
           			}
           	
           	else 
           	{
           		request.setAttribute("error", "Data Not Inserted");
           		request.getRequestDispatcher("error.jsp").include(request, response);
           	}
           			conn.close();  
	}
	
	catch(Exception e)
			{ 
				out.println(e);
			}
	}


	

	
}
