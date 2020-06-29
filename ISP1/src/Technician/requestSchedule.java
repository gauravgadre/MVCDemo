package Technician;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Technician/requestSchedule")
public class requestSchedule extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cid=Integer.parseInt(request.getParameter("cid")); 
		String setdate=(String)request.getParameter("setdate");
		String settime=(String)request.getParameter("settime");
		String setdatetime=setdate+" "+settime+":00";
		try{
			System.out.println("update allot_technician set set_connection_date='"+setdatetime+"' where rid=(select rid from request where cid="+cid+")");
	        int i=TechDao.insertData("update allot_technician set set_connection_date='"+setdatetime+"' where rid=(select rid from request where cid="+cid+")");  
	        if(i>0){   
	        	 RequestDispatcher rd=request.getRequestDispatcher("index.jsp");  
			        rd.forward(request, response);	        	        	
	        }else{  
	        	request.setAttribute("error", "Unable to upload Status.");
	        	 RequestDispatcher rd=request.getRequestDispatcher("requestStatus.jsp");  
			        rd.include(request, response);
	        }               
	        }catch(Exception ex){ex.printStackTrace();} 
	}

}
