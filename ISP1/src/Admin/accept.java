package Admin;

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

@WebServlet("/Admin/accept")
public class accept extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter out = response.getWriter();
		String id=request.getParameter("sid");
		String reply=request.getParameter("reply");
		Connection con=null;
		
			try {
				DbHelper db=new DbHelper();
      			 con=(Connection) db.getConnection();
			out.print("update supportticket  set status='1',reply='"+reply+"' where sid=?");
			Statement stmt=(Statement) con.createStatement();
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
			 LocalDateTime today = LocalDateTime.now();
			 String current= formatter.format(today); 
			int i=stmt.executeUpdate("update support_ticket  set status='1',reply='"+reply+"',replydate='"+current+"' where sid="+id);
			
		if(i>0)
		{
			RequestDispatcher rd=request.getRequestDispatcher("acceptreq.jsp");
			rd.forward(request,response);
		}
		
			}
			catch(Exception e)
			{
				System.out.println(e.toString());
			}
	}

}
