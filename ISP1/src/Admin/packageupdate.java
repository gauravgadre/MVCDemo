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


@WebServlet("/Admin/packageupdate")
public class packageupdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		PrintWriter out = response.getWriter();
		Connection con=null;
		try
		{
			DbHelper db=new DbHelper();
			 con=(Connection) db.getConnection(); 
		Statement st=con.createStatement();
		String pid="";
		String pname="";
		String duration="";
		String price="";
		String speed="";
		String description="";
		String nname="";
		
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
		
		if(name.equals("pid"))
		{
		pid=value;
		System.out.println(value);
		}
		if(name.equals("pname"))
		{
		pname=value;
		System.out.println(value);
		}
		if(name.equals("duration"))
		{
		duration=value;
		System.out.println(value);
		}
		if(name.equals("price"))
		{
		price=value;
		System.out.println(value);
		}
		if(name.equals("speed"))
		{
		speed=value;
		System.out.println(value);
		}
		if(name.equals("description"))
		{
		description=value;
		System.out.println(value);
		}
		if(name.equals("nname"))
		{
		nname=value;
		System.out.println(value);
		}
		

		}
		else
		{
				
				if(item.getFieldName().equals("ImageFile")) {			
						try
						{
							itemName = item.getName();
							if(itemName.equals("")) {
								
								
								
								
								
							}
							else {
							attr=attr+",`image`='"+itemName+"' ";
							
						}
						File savedFile = new File(DbHelper.path+"Package/"+itemName);
						item.write(savedFile);
						}
						catch (Exception e)
						{
						out.println("Error"+e.getMessage());
						}			
					}//if
		}//else
		}
			//st.executeUpdate("update emp set ename='"+ImageFile+"',mname='"+ImageFile1+"',lname'"+ImageFile2+"',uname='"+ImageFile3+"',email='"+ImageFile4+"',password='"+ImageFile5+"',address='"+ImageFile6+"',mobile='"+ImageFile7+"',dob='"+ImageFile8+"',gender='"+ImageFile9+"',image='"+itemName+"'  where eid='"+eid+"'");
			//out.print("update emp set ename='"+ImageFile+"', mname='"+ImageFile1+"', lname='"+ImageFile2+"', email='"+ImageFile4+"', password='"+ImageFile5+"', mobile='"+ImageFile7+"', dob='"+ImageFile8+"', gender='"+ImageFile9+"', uname='"+ImageFile3+"', address='"+ImageFile6+"' "+attr+" where eid='"+eid+"'");
					
			st.executeUpdate("update package set pname='"+pname+"', duration='"+duration+"', price='"+price+"', speed='"+speed+"', description='"+description+"', nname='"+nname+"' "+attr+" where pid='"+pid+"'");
			
			request.setAttribute("errormsg","success");
			RequestDispatcher rd=request.getRequestDispatcher("viewpackage.jsp");
			rd.forward(request,response);
				
		}
	catch(Exception e) {
		System.out.println(e);}
	}
}
		
	