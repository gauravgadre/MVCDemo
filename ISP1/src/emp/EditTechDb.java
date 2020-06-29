package emp;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@WebServlet("/Employee/EditTechDb")
public class EditTechDb extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 PrintWriter out=response.getWriter();
	  Connection conn=null;

	    try
	    {
			 conn = (Connection) DbConn.createConnection(); 

		Statement st=conn.createStatement();
		System.out.println("connection establish");
		String tid="";
		String tfname="";
		String tmname="";
		String tlname="";
		String uname= "";
		String temail="";
		String tpass= "";
		String ccity= "";
		String tphone="";
		String tdob = "";
		String tgender="";
		String itemName="";
		String itemName1="";
		String itemName2="";
		//String date="";
		String attr="";
		
		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		List items = null;
		try
		{
		items = (List) upload.parseRequest(request);
		}
		catch (FileUploadException e)
		{
		e.getMessage();
		}

		Iterator itr = items.iterator();
		while (itr.hasNext())
		{
		FileItem item = (FileItem) itr.next();
		if (item.isFormField())
		{
		String name = item.getFieldName();
		String value = item.getString();
		if(name.equals("tid"))
		{
		tid=value;
		System.out.println(value);
		}
		
		if(name.equals("tfname"))
		{
			tfname=value;
		System.out.println(value);
		}
		if(name.equals("tmname"))
		{
			 tmname=value;
			System.out.println(value);
		}
		if(name.equals("tlname"))
		{
			tlname=value;
			System.out.println(value);
		}
		if(name.equals("uname"))
		{
			uname=value;
			System.out.println(value);
		}
		if(name.equals("temail"))
		{
			temail=value;
			System.out.println(value);
		}		
		if(name.equals("tpass"))
		{
			tpass=value;
			System.out.println(value);
		}
		if(name.equals("ccity"))
		{
			ccity=value;
			System.out.println(value);	
		}
		if(name.equals("tphone"))
		{
			tphone=value;
			System.out.println(value);
		}
		if(name.equals("tdob"))
		{
			tdob=value;
			System.out.println(value);
		}		
		if(name.equals("tgender"))
		{
			tgender=value;
			System.out.println(value);
		}			
		}
		else
		{
			if(item.getFieldName().equals("tidproof")) {			
				try
						{
						itemName = item.getName();
						if(!itemName.equals("")) {
							attr=attr+",`tidproof`='"+itemName+"'";
							File savedFile = new File(DbConn.path+"Technician/"+itemName);
							item.write(savedFile);	
						}
						}
					catch (Exception e)
						{
						out.println("Error"+e.getMessage());
						}			
				}//if	
			if(item.getFieldName().equals("taddrproof")) {			
				try
						{
					itemName1= item.getName();
						if(!itemName1.equals("")) {
							attr=attr+",`taddrproof`='"+itemName1+"'";
							File savedFile = new File(DbConn.path+"Technician/"+itemName1);
							item.write(savedFile);
						}
											
						}
					catch (Exception e)
						{
						out.println("Error"+e.getMessage());
						}			
				}//if			}
		//passport
			if(item.getFieldName().equals("tpassport")) {			
				try
						{
					itemName2 = item.getName();
						if(!itemName2.equals("")) {
							attr=attr+",`tpassport`='"+itemName2+"'";
							File savedFile = new File(DbConn.path+"Technician/"+itemName2);
							item.write(savedFile);		
						}
										
						}
					catch (Exception e)
						{
						out.println("Error"+e.getMessage());
						}			
				}//if	
		}
		}
		
		int i=st.executeUpdate("Update technician set tfname='"+tfname+"',tmname='"+tmname+"',tlname='"+tlname+"',uname='"+uname+"',tphone='"+tphone+"',temail='"+temail+"',tpass='"+tpass+"',taddress='"+ccity+"',tdob='"+tdob+"',tgender='"+tgender+"' "+attr+" where tid='"+tid+"'");
		if(i>0)
		{
			request.setAttribute("errormsg","success");
			RequestDispatcher rd=request.getRequestDispatcher("view.jsp");
			rd.include(request,response);	
		}else {
			request.setAttribute("errormsg","error");
			RequestDispatcher rd=request.getRequestDispatcher("EditTech.jsp");
			rd.include(request,response);
		}
		
		
}
		catch(Exception e) {System.out.println(e);
		}
 }


}


