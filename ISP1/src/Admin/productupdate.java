package Admin;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
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


@WebServlet("/Admin/productupdate")
public class productupdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
PrintWriter out = response.getWriter();
		Connection connection=null;
		try
		{
			DbHelper db=new DbHelper();
			  connection=(Connection) db.getConnection(); 
		Statement st=connection.createStatement();
		String prodid="";
		String prodname="";
		String prodprice="";
		
		String proddesc="";
	
		
		String itemName = "";
		//out.print("'"+ImageFile5+"'");
		 String attr="";
		
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
		
		if(name.equals("prodid"))
		{
		prodid=value;
		System.out.println(value);
		}
		if(name.equals("prodname"))
		{
		prodname=value;
		System.out.println(value);
		}
		if(name.equals("prodprice"))
		{
		prodprice=value;
		System.out.println(value);
		}
		if(name.equals("proddesc"))
		{
		proddesc=value;
		System.out.println(value);
		}
		

		}
		else
		{
				
				if(item.getFieldName().equals("ImageFile")) {			
						try
						{
							itemName = item.getName();
						if(!itemName.equals("")) {
							attr=attr+",`prodimage`='"+itemName+"' ";
							File savedFile = new File(DbHelper.path+"Product/"+itemName);
							item.write(savedFile);
						}
						
						}
						catch (Exception e)
						{
						out.println("Error"+e.getMessage());
						}			
					}//if
		}//else
		}
			st.executeUpdate("update product set prodname='"+prodname+"', prodprice='"+prodprice+"', proddesc='"+proddesc+"' "+attr+" where prodid='"+prodid+"'");
			
			request.setAttribute("errormsg","success");
			RequestDispatcher rd=request.getRequestDispatcher("viewproduct.jsp");
			rd.forward(request,response);
				
		}
	catch(Exception e) {
		System.out.println(e);}
	}

		
	
	

}
