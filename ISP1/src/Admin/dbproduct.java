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




@WebServlet("/Admin/dbproduct")
public class dbproduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
PrintWriter out = response.getWriter();
		Connection connection=null;
		try
		{
			DbHelper db=new DbHelper();
			  connection=(Connection) db.getConnection(); 
		Statement st=connection.createStatement();
		String ImageFile="";
		String ImageFile1="";
		String ImageFile2="";
		String itemName = "";
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
		if(name.equals("prodname"))
		{
		ImageFile=value;
		}
		if(name.equals("prodprice"))
		{
		ImageFile1=value;
		}
		if(name.equals("proddesc"))
		{
		ImageFile2=value;
		}
		
		}
		else
		{
		try
		{
		itemName = item.getName();
		File savedFile = new File(DbHelper.path+"Product/"+itemName);
		item.write(savedFile);
		}
		catch (Exception e)
		{
		out.println("Error"+e.getMessage());
		}
		}
		}
		try
		{
		int i=st.executeUpdate("insert into product(prodname,prodimage,prodprice,proddesc) values ('"+ImageFile+"','"+itemName+"','"+ImageFile1+"','"+ImageFile2+"')");
		if(i>0) {
			request.setAttribute("errormsg","success");
			RequestDispatcher rd=request.getRequestDispatcher("viewproduct.jsp");
			rd.forward(request,response);
		}else {
			request.setAttribute("errormsg","Error");
			RequestDispatcher rd=request.getRequestDispatcher("product.jsp");
			rd.forward(request,response);
		}
		
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


