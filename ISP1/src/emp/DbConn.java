package emp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import com.email.durgesh.Email;





public class DbConn {
	public static String path="C:/Users/Vikas Sonawane/eclipse-workspace/ISP/WebContent/images/";
	 public static Connection createConnection()
	 {
	     Connection con = null;
	     String url = "jdbc:mysql://localhost:3306/isp_project"; //MySQL URL and followed by the database name
	     String username = "root"; //MySQL username
	     String password = "root"; //MySQL password   
	     try 
	     {
	         try 
	         {
	            Class.forName("com.mysql.jdbc.Driver"); //loading mysql driver 
	         } 
	         catch (ClassNotFoundException e)
	         {
	            e.printStackTrace();
	         } 
	         con = DriverManager.getConnection(url, username, password); //attempting to connect to MySQL database
	     } 
	     catch (Exception e) 
	     {
	        e.printStackTrace();
	     }
	     return con; 
	 }
	 
	 
	  public static ResultSet get(String qry) {
	    	 ResultSet rs=null;
	    	try {
	    		 Connection con=DbConn.createConnection();  
	             Statement ps=con.createStatement();  
	            rs=ps.executeQuery(qry);  
	        
	    	}
	    	catch(Exception e) {
	    		e.printStackTrace();
	    	}
	    	return rs;
	    	
	    }
	  
	  public static String emplogin(String qry) {
		   	 String returnval="";
		   	try {
		   		 Connection con=DbConn.createConnection();  
		   		 System.out.println(qry);
		            Statement stmt=con.createStatement();  
		         ResultSet rs=stmt.executeQuery(qry);
		          
		       if(rs.next()) {
		    	   returnval="Found";
		       }
		       else {
		    	   returnval="Not Found";
		       }
		   	}
		   	catch(Exception e) {
		   		e.printStackTrace();
		   	}
		   	return returnval;
		   	
		   }
	  public static int insertData(String qry) {
	    	int i=0;
	    	try {
	    		Connection con=DbConn.createConnection(); 
	    		Statement stmt=con.createStatement();
	    		i=stmt.executeUpdate(qry);    	
	    	}
	    	catch(Exception e)
	    	{
	    		e.printStackTrace();
	    	}
	  		return i;
	    }
	  
	  public static void sendMail(String subject,String content,String emailid) {
		  try {
	    		
	    		Email email=new Email("suchetads911@gmail.com","Suchi@911");
	    		email.setFrom("suchetads911@gmail.com", "fun");
	    		email.setSubject(subject);
	    		email.setContent(content, "text/html");
	    		email.addRecipient(emailid);
	    		email.send();   	
	    	}
	    	catch(Exception e)
	    	{
	    		e.printStackTrace();
	    	}	
	  }
	}


