package Admin;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbHelper {
	Connection con;
	public static String path="C:/Users/Vikas Sonawane/eclipse-workspace/ISP/WebContent/images/"; 
	  public static Connection getConnection(){  
	        Connection con=null;  
	        try{  
	        	  Class.forName("com.mysql.jdbc.Driver");  
	      		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/isp_project","root","root"); 
	        }
	        catch(Exception e){System.out.println(e);}  
	        return con;  
	    }

}
	 
	
	
