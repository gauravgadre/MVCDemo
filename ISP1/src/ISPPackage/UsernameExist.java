package ISPPackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UsernameExist1")
public class UsernameExist extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UsernameExist() {
        super();
       }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		String username=request.getParameter("username");
		response.setContentType("text/html");
 	   PrintWriter out=response.getWriter();
		try
		    {
		        Class.forName("com.mysql.cj.jdbc.Driver");
		        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ISP_Customer","root","root");
		        PreparedStatement st = connection.prepareStatement("select * from Customer_details order by username desc");
		        ResultSet r1=st.executeQuery();
		        String usernameCounter;
		         if(r1.next()) 
		         {
		        	 
		           usernameCounter =  r1.getString("username");

		           if(usernameCounter.equals(username)) //this part does not happen even if it should
		           {
		        	   out.print("Already Exist");
		           }
		           else {
		        	   out.print("");
		           }
		         }
		     }
		     catch (Exception e) 
		     {
		        System.out.println("SQL Exception: "+ e.toString());
		     } 
		 


	}

}
