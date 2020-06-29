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

@WebServlet("/Admin/supportdb")
public class supportdb extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		Connection con=null;
		try
		{
			DbHelper db=new DbHelper();
  			 con=(Connection) db.getConnection();
		Statement st=con.createStatement();
		
		String itemName = "";
		String itemName1 = "";
		String itemName2 = "";
		//out.print("'"+ImageFile5+"'");
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
		
		}
		else
		{

		
		if(item.getFieldName().equals("ImageFile")) {
			
			try
			{
			itemName = item.getName();
			File savedFile = new File(DbHelper.path+"Customer/Support/"+itemName);
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
			File savedFile = new File(DbHelper.path+"Customer/Support/"+itemName1);
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
			File savedFile = new File(DbHelper.path+"Customer/Support/"+itemName2);
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
		st.executeUpdate("insert into supportticket(attachement1,attachment2,attachment3) values ('"+itemName+"','"+itemName1+"','"+itemName2+"')");

		RequestDispatcher rd=request.getRequestDispatcher("imagesupport.jsp");
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
