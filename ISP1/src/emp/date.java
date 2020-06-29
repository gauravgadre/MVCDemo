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
 * Servlet implementation class date
 */
@WebServlet("/Employee/date")
public class date extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		String id=request.getParameter("sid");
		String reply=request.getParameter("reply");
		Connection conn =null;
		
			try {
				 conn = (Connection) DbConn.createConnection(); 
          out.print("update supportticket  set status='1',reply='"+reply+"' where sid=?");
			Statement stmt=(Statement) conn.createStatement();
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
			 LocalDateTime today = LocalDateTime.now();
			 String current= formatter.format(today); 
			int i=stmt.executeUpdate("update supportticket  set status='1',reply='"+reply+"',replydate='"+current+"' where sid="+id);
			//PreparedStatement ps=(PreparedStatement) conn1.prepareStatement("update supportticket  set status='1',reply='"+reply+"' where sid=?"); 
		
//		ps.setString(1, id);
		//int i=ps.executeUpdate();
		if(i>0)
		{
			 RequestDispatcher rd=request.getRequestDispatcher("acceptreq.jsp");
        	 rd.forward(request, response);
		}
		
			}
			catch(Exception e)
			{
				System.out.println(e.toString());
			}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
