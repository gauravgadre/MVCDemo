package Admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.*;
import java.util.*;
import java.io.*;
import java.sql.*;
import java.util.Iterator;
import java.util.List;
import java.io.File;

/**
 * Servlet implementation class employeedb
 */
@WebServlet("/Admin/employeedb")
public class employeedb extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		Connection con=null;
		try
		{
			DbHelper db=new DbHelper();
			  con=(Connection) db.getConnection(); 
		Statement st=con.createStatement();
		String ImageFile="";
		String ImageFile1="";
		String ImageFile2="";
		String ImageFile3="";
		String ImageFile4="";
		String ImageFile5="";
		String ImageFile6="";
		String ImageFile7="";
		String ImageFile8="";
		String ImageFile9="";
		String ImageFile10="";
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
		items = upload.parseRequest(request);
		System.out.println(items);
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
		if(name.equals("ename"))
		{
		ImageFile=value;
		}
		if(name.equals("mname"))
		{
		ImageFile1=value;
		}
		if(name.equals("lname"))
		{
		ImageFile2=value;
		}
		if(name.equals("uname"))
		{
		ImageFile3=value;
		}
		if(name.equals("email"))
		{
		ImageFile4=value;
		}
		if(name.equals("password"))
		{
		ImageFile5=value;
		}
		if(name.equals("address"))
		{
		ImageFile6=value;
		}
		if(name.equals("mobile"))
		{
		ImageFile7=value;
		}

		if(name.equals("dob"))
		{
		ImageFile8=value;
		}

		if(name.equals("gender"))
		{
		ImageFile9=value;
		}
		if(name.equals("jdate"))
		{
		ImageFile10=value;
		}

		}
		else
		{

		
		if(item.getFieldName().equals("ImageFile")) {
			
			try
			{
			itemName = item.getName();
			File savedFile = new File(DbHelper.path+"Employee/"+itemName);
			item.write(savedFile);
			}
			catch (Exception e)
			{
			out.println("Error"+e.getMessage());
			}
			
			}
	
		
		if(item.getFieldName().equals("ImageFile1")) {
			
			try
			{
			itemName1 = item.getName();
			File savedFile = new File(DbHelper.path+"Employee/"+itemName1);
			item.write(savedFile);
			}
			catch (Exception e)
			{
			out.println("Error"+e.getMessage());
			}
			
			}
	
		
		if(item.getFieldName().equals("ImageFile2")) {
			
			try
			{
			itemName2 = item.getName();
			File savedFile = new File(DbHelper.path+"Employee/"+itemName2);
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
		st.executeUpdate("insert into emp(ename,mname,lname,uname,email,password,address,mobile,dob,gender,image,idproof,addproof,jdate) values ('"+ImageFile+"','"+ImageFile1+"','"+ImageFile2+"','"+ImageFile3+"','"+ImageFile4+"','"+ImageFile5+"','"+ImageFile6+"','"+ImageFile7+"','"+ImageFile8+"','"+ImageFile9+"','"+itemName+"','"+itemName1+"','"+itemName2+"','"+ImageFile10+"')");

		RequestDispatcher rd=request.getRequestDispatcher("viewemp.jsp");
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

