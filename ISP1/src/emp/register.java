package emp;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Collection;
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

import java.util.Iterator;

 import org.apache.commons.fileupload.*;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Employee/register")
public class register extends HttpServlet
{

	private static final long serialVersionUID = 1L;
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/type");
	    PrintWriter out=response.getWriter();
	   // Blob blob=null;
	    System.out.println("connected");
	    Connection con =null;
	    try
	    {
			 con = (Connection) DbConn.createConnection(); 
        Statement st=con.createStatement();
		System.out.println("connection establish");
		//String tid="";
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
		String jdate="";
		String itemName = "";
		String itemName1 = "";
		String itemName2 = "";
	
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		if (!isMultipart)
		{
		}
		else
		{
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
		
		
		if(name.equals("tfname"))
		{
			tfname=value;
		System.out.println("tfname");
		}
		if(name.equals("tmname"))
		{
			 tmname=value;
		}
		if(name.equals("tlname"))
		{
			tlname=value;
		}
		if(name.equals("uname"))
		{
			uname=value;
		}
		if(name.equals("temail"))
		{
			temail=value;
		}
		
		if(name.equals("tpass"))
		{
			tpass=value;
		}
		if(name.equals("ccity"))
		{
			ccity=value;
		
		}
		if(name.equals("tphone"))
		{
			tphone=value;
		}
		if(name.equals("tdob"))
		{
			tdob=value;
		}
		
		if(name.equals("tgender"))
		{
			tgender=value;
		}
		if(name.equals("jdate"))
		{
			jdate=value;
		}
		
		
				
		}
		else
		{
			//idproof
			if(item.getFieldName().equals("tidproof"))
			{
		try
		{
		itemName = item.getName();
		File savedFile = new File(DbConn.path+"Technician/"+itemName);
		item.write(savedFile);
		}
		catch (Exception e)
		{
		out.println("Error"+e.getMessage());
		}
		}
		//	address proof
		if(item.getFieldName().equals("taddrproof"))
		{
			try
		
		{
				itemName1 = item.getName();
			File savedFile = new File(DbConn.path+"Technician/"+itemName1);
			item.write(savedFile);
		}
		catch (Exception e)
		{
		out.println("Error"+e.getMessage());
		}
		}
		//passport
		if(item.getFieldName().equals("tpassport"))
		{
			try
		{
				itemName2 = item.getName();
			File savedFile = new File(DbConn.path+"Technician/"+itemName2);
			item.write(savedFile);
		}
		catch (Exception e)
		{
		out.println("Error"+e.getMessage());
		}
		}
		}
		}
		try
		{
		st.executeUpdate("insert into technician(tfname,tmname,tlname,uname,tphone,temail, tpass, taddress,tdob, tgender, tidproof, taddrproof, tpassport,tjdate)values('"+tfname+"','"+tmname+"','"+tlname+"','"+uname+"','"+tphone+"','"+temail+"','"+tpass+"','"+ccity+"','"+tdob+"','"+tgender+"','"+itemName+"','"+itemName1+"','"+itemName2+"','"+jdate+"')");
		RequestDispatcher rd=request.getRequestDispatcher("view.jsp");
		rd.forward(request,response);	
	
		}
		
		catch(Exception el)
		{
		out.println("Inserting error"+el.getMessage());
		}
		}
		}
		catch (Exception e){
		out.println(e.getMessage());
		}
	}
	
}	
