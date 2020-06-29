
package Technician;

import java.io.IOException;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Technician/requestStatus")
public class requestStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		int Status=Integer.parseInt(request.getParameter("status"));
		int cid=Integer.parseInt(request.getParameter("cid"));     
  	try{
        int i=TechDao.insertData("update request set rstatus="+Status+" where cid="+cid+"");  
        if(i>0){   
        	if(Status==2) {
        		//response.sendRedirect("requestSchedule.jsp?cid="+cid);
        		 RequestDispatcher rd=request.getRequestDispatcher("requestSchedule.jsp?cid="+cid);  
      	        rd.forward(request, response);
        	}
        	else if(Status==4) {
        		 DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
				 LocalDateTime today = LocalDateTime.now();
				 String current= formatter.format(today);
				 String renewdate="";
				 int rid=TechDao.getId("select rid from request where cid="+cid+"","rid");
				 int pid=TechDao.getId("select pid from request where cid="+cid,"pid");
				 int duration=TechDao.getId("select duration from package where pid="+pid,"duration");
				 ResultSet rs =TechDao.get("SELECT ADDDATE('"+current+"', INTERVAL "+duration+" MONTH) as DateAdd ");
				 if(rs.next())
					 renewdate=rs.getString("DateAdd");				 
				TechDao.insertData("INSERT INTO `connection_details`(`rid`,`activation_date`,`renewval_date`,`cid`,`pid`)VALUES("+rid+",'"+current+"','"+renewdate+"','"+cid+"','"+pid+"')");
				 TechDao.insertData("update allot_technician set get_connection_date='"+current+"' where rid="+rid);
				 TechDao.insertData("update technician set tstatus=tstatus-1 where tid=(select tid from allot_technician a where a.rid="+rid+")");
				
			     RequestDispatcher rd=request.getRequestDispatcher("index.jsp");  
	 	        rd.forward(request, response);			      
        	}
        	else
        	{
        		//response.sendRedirect("index.jsp");
        		 RequestDispatcher rd=request.getRequestDispatcher("index.jsp");  
     	        rd.forward(request, response);
        	}
        }else{  
        	request.setAttribute("error", "Unable to upload Status.");
            RequestDispatcher rd=request.getRequestDispatcher("requestStatus.jsp");  
	        rd.forward(request, response);
        }               
        }catch(Exception ex){ex.printStackTrace();} 
  	}
}