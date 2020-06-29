package Technician;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import com.email.durgesh.Email;

public class TechDao {
	  public static Connection getConnection(){  
	        Connection con=null;  
	        try{  
	        	  Class.forName("com.mysql.jdbc.Driver");  
	      		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ISP_Project","root","root"); 
	        }
	        catch(Exception e){System.out.println(e);}  
	        return con;  
	    }  
	  
	  public static ResultSet get(String qry) {
	    	 ResultSet rs=null;
	    	try {
	    		 Connection con=TechDao.getConnection();  
	             Statement ps=con.createStatement();  
	            rs=ps.executeQuery(qry);  
	        
	    	}
	    	catch(Exception e) {
	    		e.printStackTrace();
	    	}
	    	return rs;
	    	
	    }
	  
	  public static int getId(String qry,String col) {
	    	int id=0;
		  try {
	    		 Connection con=TechDao.getConnection();  
	             Statement ps=con.createStatement();  
	             ResultSet rs=ps.executeQuery(qry);  
	             if(rs.next()) {
	            	 id=rs.getInt(col);
	             }
	    	}
	    	catch(Exception e) {
	    		e.printStackTrace();
	    	}
	    	return id;
	    	
	    }
	  
	  public static void sendEmail(String subject,String content,String emailid) {
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
	  
	  public static String loginTech(String qry) {
		   	 String returnval="";
		   	try {
		   		 Connection con=TechDao.getConnection();  
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
	    		Connection con=TechDao.getConnection();
	    		Statement stmt=con.createStatement();
	    		i=stmt.executeUpdate(qry);    	
	    	}
	    	catch(Exception e)
	    	{
	    		e.printStackTrace();
	    	}
	  		return i;
	    }
	
}
