package Admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Admin/empreports")
public class empreports extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		 Connection connection=null;
		 Statement stmt=null;
		 response.setContentType("text/html;charset=UTF-8");
		 PrintWriter out = response.getWriter();

		  out.println("<table border=1><tr><th>  id </th><th> fname </th><th> mname </th><th> lname </th><th> email </th><th>mobile </th><th>address</th><th>jdate</th></tr>");   

		 try {
		 	Connection connection1=DbHelper.getConnection();
		 	System.out.println("database connected");
		 	 stmt = (Statement) connection1.createStatement();  
		     ResultSet rs = stmt.executeQuery("select * from empreport");
		     while(rs.next())
		     {
		     	
		     	out.print("<tr><td>");
		     	out.println(rs.getInt(1));
		     	out.print("</td>");
		     	
		     	out.print("<td>");
		     	out.println(rs.getString(2));
		     	out.print("</td>");
		     	out.print("<td>");
		     	out.println(rs.getString(3));
		     	out.print("</td>");
		     	out.print("<td>");
		     	out.println(rs.getString(4));
		     	out.print("</td>");
		     	out.print("<td>");
		     	out.println(rs.getString(5));
		     	out.print("</td>");
		     	out.print("<td>");
		     	out.println(rs.getString(6));
		     	out.print("</td>");
		     	out.print("<td>");
		     	out.println(rs.getString(7));
		     	out.print("</td>");
		     	out.print("<td>");
		     	out.println(rs.getString(8));
		     	out.print("</td>");
		 
		     	
		     	
		    
		     	out.print("</tr>");
		     	
		    //	request.getRequestDispatcher("sideNav.jsp").include(request, response);
		     	
		     }
		     rs.close();
		 }
		 catch (Exception e)
		 {
		 	e.printStackTrace();
		     	
		     	
		 }
		 out.print("</table>");
		 	
	}

}
