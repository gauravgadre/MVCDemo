package emp;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Employee/manage_tech")
public class manage_tech extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String tid =request.getParameter("tid");
		String fname =request.getParameter("fname");
		String mname =request.getParameter("mname");
		String lname =request.getParameter("lname");
		String uname =request.getParameter("uname");
		String email =request.getParameter("email");
		String password =request.getParameter("password");
		String address =request.getParameter("address");
		String mobile =request.getParameter("mobile");
		String dob =request.getParameter("dob");
		String gender =request.getParameter("gender");
		PrintWriter out = response.getWriter();  
        //response.setContentType("text/html");  
		//System.out.println(uname+" "+uemail+" "+upass+" "+uphone);
		//response.getWriter().println(connectionProvider.getConn());
		
		
		Connection con=null;


		
		try {
			 con = (Connection) DbConn.createConnection(); 
        java.sql.PreparedStatement ps=con.prepareStatement("insert into technician values(?,?,?,?,?,?,?,?,?,?,?)");
			  ps.setString(1, tid);
			  ps.setString(2, fname);
			  ps.setString(3, mname);
			  ps.setString(4, lname);
			  ps.setString(5, uname);
			  ps.setString(6, email);
			  ps.setString(7, password);
			  ps.setString(8, address);
			  ps.setString(9, mobile);
			  ps.setString(10, dob);
			  ps.setString(11, gender);
			  int i =ps.executeUpdate();
			  if(i>0) {
				  RequestDispatcher rd=request.getRequestDispatcher("view.jsp");
					rd.forward(request,response);
		
			  }		
			  	else 
			  	{
        response.getWriter().println("Data is NOT inserted");
		}		  		
			
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		}

	}


