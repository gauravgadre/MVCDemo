package emp;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Employee/sendMail")
public class sendMail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String rid=(String)request.getParameter("rid");
		try {
			Connection con=DbConn.createConnection();
			Statement stmt=con.createStatement();
			ResultSet rs=stmt.executeQuery("select * from customer_details where cid=(select cid from request where rid="+rid+")");
			if(rs.next()) {
				String subject="Mail From ISP about Customer Details";
				String Content="Customer Name:-'"+rs.getString("cfname")+" "+rs.getString("clname")+"' <br> Mobile Number:-'"+rs.getString("cphone")+"' <br> Email:-'"+rs.getString("cemail")+"' Address='"+rs.getString("cflat")+ ", "+rs.getString("cbuilding")+ ", "+rs.getString("cstreet")+ ", "+rs.getString("ccity")+", "+rs.getString("ctaluka")+", "+rs.getString("ccity")+"' <br> LandMark:-'"+rs.getString("clandmark")+"'";
				String cemail=rs.getString("cemail");
				DbConn.sendMail(subject,Content,cemail);
				 RequestDispatcher rd=request.getRequestDispatcher("AllotTech.jsp");
				rd.forward(request,response);
				
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
