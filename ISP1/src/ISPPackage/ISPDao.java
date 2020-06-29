package ISPPackage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import com.email.durgesh.Email;

public class ISPDao {
	public static String Port="http://localhost:8080/ISP";
	public static Connection getConnection(){  
        Connection con=null;  
        try{  
        	  Class.forName("com.mysql.jdbc.Driver");  
      		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ISP_Project","root","root"); 
        }
        catch(Exception e){System.out.println(e);}  
        return con;  
    }  
    
	 public static String getModule(String email,String pass) {
    	
    	 String module="";
    	try {
    		 Connection con=ISPDao.getConnection();  
             Statement ps=con.createStatement();
             Statement ps1=con.createStatement();
             Statement ps2=con.createStatement();
             Statement ps3=con.createStatement();
             ResultSet  rs=ps.executeQuery("select * from adminlogin where email='"+email+"' and password='"+pass+"'");
             ResultSet rs1=ps1.executeQuery("select * from emp where email='"+email+"' and password='"+pass+"'");
             ResultSet rs2=ps2.executeQuery("select * from technician where temail='"+email+"' and tpass='"+pass+"'");
             ResultSet rs3=ps3.executeQuery("select * from customer_details where cemail='"+email+"' and cpass='"+pass+"'");
            if(rs.next()) {
            	module="Admin";
            }
            else if(rs1.next()) {
            	module="Employee";
            }
            else if(rs2.next()) {
            	module="Technician";
            }
            else if(rs3.next()) {
            	module="Customer";
            }
    	}
    	catch(Exception e) {
    		e.printStackTrace();
    	}
    	return module;    	
    }
	
    public static ResultSet get(String table) {
    	 ResultSet rs=null;
    	try {
    		 Connection con=ISPDao.getConnection();  
             Statement ps=con.createStatement();  
            rs=ps.executeQuery("select * from "+table);  
        
    	}
    	catch(Exception e) {
    		e.printStackTrace();
    	}
    	return rs;    	
    }
    
    public static String getId(String table) {
   	 String returnval="";
   	try {
   		 Connection con=ISPDao.getConnection();  
            Statement ps=con.createStatement();  
         ResultSet rs=ps.executeQuery("select * from "+table);
          
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
    
    public static int getcid(String table) {
      	 int returnval=0;
      	try {
      		 Connection con=ISPDao.getConnection();  
               Statement ps=con.createStatement();  
            ResultSet rs=ps.executeQuery("select * from "+table);
             
          if(rs.next()) {
       	   returnval=rs.getInt("cid");
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
    		Connection con=ISPDao.getConnection();
    		Statement stmt=con.createStatement();
    		i=stmt.executeUpdate(qry);    	
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    	}
  		return i;
    	
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
    

	
}
