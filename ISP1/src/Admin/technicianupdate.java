package Admin;

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

@WebServlet("/Admin/technicianupdate")
public class technicianupdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		Connection con=null;
		try
		{
			DbHelper db=new DbHelper();
        	  con=(Connection) db.getConnection(); 
		Statement st=con.createStatement();
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
		String itemName = "";
		String itemName1 = "";
		String itemName2 = "";
		 String attr="";
		out.print("'"+tfname+"'");
		
		
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

		if(name.equals("gender"))
		{
		tgender=value;
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
						attr=attr+",`tidproof`='"+itemName+"' ";
						
					}
					File savedFile = new File(DbHelper.path+"Technician/"+itemName);
					item.write(savedFile);
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
						attr=attr+",`tidproof`='"+itemName1+"'";
					}
					File savedFile = new File(DbHelper.path+"Technician/"+itemName1);
					item.write(savedFile);					}
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
						attr=attr+",`tidproof`='"+itemName2+"'";
						
					}
					File savedFile = new File(DbHelper.path+"Technician/"+itemName2);
				item.write(savedFile);
					}
					catch (Exception e)
					{
					out.println("Error"+e.getMessage());
					}			}//if
			}//else
		
		}
		//st.executeUpdate("update emp set ename='"+ImageFile+"',mname='"+ImageFile1+"',lname'"+ImageFile2+"',uname='"+ImageFile3+"',email='"+ImageFile4+"',password='"+ImageFile5+"',address='"+ImageFile6+"',mobile='"+ImageFile7+"',dob='"+ImageFile8+"',gender='"+ImageFile9+"',image='"+itemName+"'  where eid='"+eid+"'");
		//out.print("update emp set ename='"+ImageFile+"', mname='"+ImageFile1+"', lname='"+ImageFile2+"', email='"+ImageFile4+"', password='"+ImageFile5+"', mobile='"+ImageFile7+"', dob='"+ImageFile8+"', gender='"+ImageFile9+"', uname='"+ImageFile3+"', address='"+ImageFile6+"' "+attr+" where eid='"+eid+"'");
				
		st.executeUpdate("update technician set tfname='"+tfname+"', tmname='"+tmname+"', tlname='"+tlname+"',uname='"+uname+"',tphone='"+tphone+"', temail='"+temail+"', tpass='"+tpass+"',taddress='"+ccity+"', tdob='"+tdob+"', tgender='"+tgender+"' "+attr+" where tid='"+tid+"'");
		
		request.setAttribute("errormsg","success");
		RequestDispatcher rd=request.getRequestDispatcher("technician.jsp");
		rd.forward(request,response);
		
	
}catch(Exception e) {System.out.println(e);}
	}

	}


