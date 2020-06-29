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

@WebServlet("/Admin/servicedb")
public class servicedb extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
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
				out.print("'"+ImageFile2+"'");
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
				if(name.equals("sname"))
				{
				ImageFile=value;
				}
				if(name.equals("sdesc"))
				{
				ImageFile1=value;
				}
				if(name.equals("sprice"))
				{
				ImageFile2=value;
				}
				}
				else
				{
				try
				{
				itemName = item.getName();
				File savedFile = new File(DbHelper.path+"Service/"+itemName);
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
				st.executeUpdate("insert into service(sname,sdesc,simage,sprice) values ('"+ImageFile+"','"+ImageFile1+"','"+itemName+"','"+ImageFile2+"')");
				request.setAttribute("errormsg","success");
				RequestDispatcher rd=request.getRequestDispatcher("viewservice.jsp");
				rd.include(request,response);
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


