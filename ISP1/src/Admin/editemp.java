package Admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Admin/editemp")
public class editemp extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String id=request.getParameter("eid");
		Connection connection1=null;
		Statement stmt=null;
			try {
				connection1=DbHelper.getConnection();
			 stmt = (Statement) connection1.createStatement();  
		    ResultSet rs = stmt.executeQuery("select * from employeereg where eid='"+id+"'");
		    while(rs.next())
		    {
		out.print("<html>");
		out.print("<center>");
		out.print("<h3>update</h3>");
		out.print("<form method='post' action='editemp'>");
		out.print("<input type='text' name='eid' value='"+rs.getString(1)+"' />");
		out.print("<br><br>");
		out.print("<input type='text' name='ename' value='"+rs.getString(2)+"' />");
		out.print("<br><br>");
		out.print("<input type='password' name='password' value='"+rs.getString(3)+"' />");
		out.print("<br><br>");
		out.print("<input type='text' name='address' value='"+rs.getString(4)+"' />");
		out.print("<br><br>");
		out.print("<input type='text' name='mobile' value='"+rs.getString(5)+"' />");
		out.print("<br><br>");
		out.print("<input type='submit' name='update' value='update' />");
		out.print("</form>");
		out.print("</html>");
	}
			}
catch(Exception e)
			{
				System.out.print(e.toString());
			}
	}
			

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		Connection conn = null;
		 
		String eid= request.getParameter("eid");	
		String ename= request.getParameter("ename");
		String password= request.getParameter("password");
		String address= request.getParameter("address");
		String mobile= request.getParameter("mobile");

		try
		{ 
			conn = DbHelper.getConnection();
			System.out.println("database connected");
			PreparedStatement st=(PreparedStatement) conn.prepareStatement("Update employeereg set ename='"+ename+"' where eid='"+eid+"'");
			out.print(ename);
			int result=st.executeUpdate();
			out.print("updated");
			out.print(ename);
			//out.print(password);
			//out.print(address);
			//out.print(mobile);
			System.out.println(result);
			RequestDispatcher rd=request.getRequestDispatcher("viewemp.jsp");
			rd.forward(request,response);

		}

		catch(Exception cx)
		{
		System.out.println(cx.toString());
		} 


	}

}
