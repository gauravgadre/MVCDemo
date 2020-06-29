package Admin;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
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


@WebServlet("/Admin/editempupdate")
public class editempupdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		Connection con=null;
		try
		{
			DbHelper db=new DbHelper();
        	  con=(Connection) db.getConnection(); 
		Statement st=con.createStatement();
		String eid="";
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
		String itemName = "";
		String itemName1 = "";
		String itemName2 = "";
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
		
		if(name.equals("eid"))
		{
		eid=value;
		System.out.println(value);
		}
		if(name.equals("ename"))
		{
		ImageFile=value;
		System.out.println(value);
		}
		if(name.equals("mname"))
		{
		ImageFile1=value;
		System.out.println(value);
		}
		if(name.equals("lname"))
		{
		ImageFile2=value;
		System.out.println(value);
		}
		if(name.equals("uname"))
		{
		ImageFile3=value;
		System.out.println(value);
		}
		if(name.equals("email"))
		{
		ImageFile4=value;
		System.out.println(value);
		}
		if(name.equals("password"))
		{
		ImageFile5=value;
		System.out.println(value);
		}
		if(name.equals("address"))
		{
		ImageFile6=value;
		System.out.println(value);
		}
		if(name.equals("mobile"))
		{
		ImageFile7=value;
		System.out.println(value);
		}

		if(name.equals("dob"))
		{
		ImageFile8=value;
		System.out.println(value);
		}

		if(name.equals("gender"))
		{
		ImageFile9=value;
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
						attr=attr+",`image`='"+itemName+"' ";	
						File savedFile = new File(DbHelper.path+"Employee/"+itemName);
						item.write(savedFile);					
					}
					}
					catch (Exception e)
					{
					out.println("Error"+e.getMessage());
					}			
				}//if
		
					if(item.getFieldName().equals("ImageFile1")) {			
			try
					{
					itemName1 = item.getName();
					if(!itemName1.equals("")) {
						attr=attr+",`idproof`='"+itemName1+"' ";
						File savedFile = new File(DbHelper.path+"Employee/"+itemName1);
						item.write(savedFile);	
					}				
					}
				catch (Exception e)
					{
					out.println("Error"+e.getMessage());
					}			
			}//if
		
			
			if(item.getFieldName().equals("ImageFile2")) {			
				try
				{
					itemName2 = item.getName();
					if(!itemName2.equals(""))
					{
						attr=attr+",`addrproof`='"+itemName2+"' ";	
						File savedFile = new File(DbHelper.path+"Employee/"+itemName2);
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
	int i=st.executeUpdate("update emp set ename='"+ImageFile+"', mname='"+ImageFile1+"', lname='"+ImageFile2+"', email='"+ImageFile4+"', password='"+ImageFile5+"', mobile='"+ImageFile7+"', dob='"+ImageFile8+"', gender='"+ImageFile9+"', uname='"+ImageFile3+"', address='"+ImageFile6+"' "+attr+" where eid='"+eid+"'");
	if(i>0)
	{
		request.setAttribute("errormsg","success");
		RequestDispatcher rd=request.getRequestDispatcher("viewemp.jsp");
		rd.forward(request,response);
	}else {
		request.setAttribute("errormsg","error");
		RequestDispatcher rd=request.getRequestDispatcher("editemp.jsp");
		rd.forward(request,response);
	}
		
	
}catch(Exception e) {System.out.println(e);}
	}
}