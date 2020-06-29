package emp;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class view
 */
@WebServlet("/Employee/view")
public class view extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		Connection conn = null;
		   Statement stmt = null;
		   PrintWriter out = response.getWriter();  
       response.setContentType("text/html");  
  out.println("<table border=1><tr><th>tid</th><th>FNAME</th><th>MNAME</th><th>LNAME</th><th>UNAME</th><th>EMAIL</th><th>PASSWORD</th><th>address</th><th>phone</th><th>dob</th><th>gender</th>");  
		   try{
		      Class.forName("com.mysql.jdbc.Driver");
		      System.out.println("Connecting to a selected database...");
		      conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/isp","root","mysql123");
		      System.out.println("Connected database successfully...");
		        System.out.println("SELECTION  PROCESS....");
		      stmt = (Statement) conn.createStatement();
		      String sql = ("SELECT *  FROM technician ");
		      ResultSet rs = stmt.executeQuery(sql);
		      
		      while(rs.next())
		      {
		    	  out.print("<tr><td>");
		    	  out.println(rs.getString(1));
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
		    	  out.print("<td>");
		    	  out.println(rs.getString(9));
		    	  out.print("</td>");
		    	  out.print("<td>");
		    	  out.println(rs.getString(10));
		    	  out.print("</td>");
		    	  out.print("<td>");
		    	  out.println(rs.getString(11));
		    	  out.print("</td>");

    	  out.print("</tr>");
		      }
		      rs.close();
		   }catch(SQLException se){
		      //Handle errors for JDBC
		      se.printStackTrace();
		   }catch(Exception e){
		      //Handle errors for Class.forName
		      e.printStackTrace();
		   }finally{
		      //finally block used to close resources
		      try{
		         if(stmt!=null)
		            conn.close();
		      }catch(SQLException se){
		      }// do nothing
		      try{
		         if(conn!=null)
		            conn.close();
		      }catch(SQLException se){
		         se.printStackTrace();
		      }//end finally try
		   }//end try
		  out.print("</table>");
		}//end main
		//end JDBCExample


}
