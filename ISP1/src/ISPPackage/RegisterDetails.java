package ISPPackage;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

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
import org.apache.commons.fileupload.servlet.ServletRequestContext;



@WebServlet("/RegisterDetails")
public class RegisterDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	        Random randomGenerator = new Random();
    	int cid = randomGenerator.nextInt(1000);
        
    	response.setContentType("text/type");
	    PrintWriter out=response.getWriter();
	
	    try
	    {
		
		String cfname="";
		String cmname="";
		String clname="";
		String motherf="";
		String cemail="";
		String username= "";
		String cpass= "";
		String cdob = "";
		String cphone="";
		String cgender="";
		String cflat="";
		String cbuilding="";
		String cstreet="";
		String cland= "";
		String  cdistrict="";
		String ctaluka="";
		String ccity="";
		String cstate="";
		String ccountry="";
		String cpincode= "";
		String cpassport = "";
		String cidproof = "";
		String caddrproof = "";
		
		
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
		
		items = (List) upload.parseRequest(new ServletRequestContext(request));
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
		if(name.equals("cfname"))
		{
			cfname=value;
		}
		if(name.equals("cmname"))
		{
			cmname=value;
		}
		if(name.equals("clname"))
		{
			clname=value;
		}
		if(name.equals("motherf"))
		{
			motherf=value;
		}
		if(name.equals("cemail"))
		{
			cemail=value;
		}
		if(name.equals("username"))
		{
			username=value;
		
		}
		if(name.equals("cpass"))
		{
			cpass=value;
		}
		if(name.equals("cdob"))
		{
			cdob=value;
		}
		if(name.equals("cphone"))
		{
			cphone=value;
		}
		if(name.equals("cgender"))
		{
			cgender=value;
		}
		if(name.equals("cflat"))
		{
			cflat=value;
		
		}
		if(name.equals("cbuilding"))
		{
			cbuilding=value;
		}
		if(name.equals("cstreet"))
		{
			cstreet=value;
		}
		if(name.equals("clandmark"))
		{
			cland=value;
		}
		if(name.equals("cdistrict"))
		{
			cdistrict=value;
		}
		if(name.equals("ctaluka"))
		{
			ctaluka=value;
		}
		if(name.equals("ccity"))
		{
			ccity=value;
		}
		if(name.equals("cstate"))
		{
			cstate=value;
		}
		
		if(name.equals("ccountry"))
		{
			ccountry=value;
		}
		if(name.equals("cpincode"))
		{
			cpincode=value;
		}
		}
		else
		{
			if(item.getFieldName().equals("passport"))
			{
		try
		{
		cpassport =cid+"_"+ item.getName();
		File savedFile = new File("C:/Users/Vikas Sonawane/eclipse-workspace/ISP_Customer/WebContent/images/"+cpassport);
		item.write(savedFile);
		}
		catch (Exception e)
		{
		out.println("Error"+e.getMessage());
		}
		}
		if(item.getFieldName().equals("idproof"))
		{
			try
		
		{
			cidproof =cid+"_"+ item.getName();
			File savedFile = new File("C:/Users/Vikas Sonawane/eclipse-workspace/ISP_Customer/WebContent/images/"+cidproof);
			item.write(savedFile);
		}
		catch (Exception e)
		{
		out.println("Error"+e.getMessage());
		}
		}
		if(item.getFieldName().equals("addrproof"))
		{
			try
		{
				caddrproof =cid+"_"+ item.getName();
			File savedFile = new File("C:/Users/Vikas Sonawane/eclipse-workspace/ISP_Customer/WebContent/images/"+caddrproof);
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
			
			 int i=ISPDao.insertData("INSERT INTO `customer_details`(`cfname`,`cmname`,`clname`,`motherf`,`cemail`,`cgender`,`cpass`,`cdob`,`cphone`,`username`,`cflat`,`cbuilding`,`cstreet`,`clandmark`,`ccity`,`ctaluka`,`cdistrict`,`cstate`,`ccountry`,`cpincode`,`cpassport`,`cidproof`,`caddrproof`)VALUES('"+cfname+"','"+cmname+"','"+clname+"','"+motherf+"','"+cemail+"','"+cgender+"','"+cpass+"','"+cdob+"',"+cphone+",'"+username+"','"+cflat+"','"+cbuilding+"','"+cstreet+"','"+cland+"','"+ccity+"','"+ctaluka+"','"+cdistrict+"','"+cstate+"','"+ccountry+ "','"+cpincode+"','"+cpassport+"','"+cidproof+"','"+caddrproof+"')");
			  
			if(i>0) {
				response.sendRedirect("index.jsp");
			}else {
			 request.setAttribute("error", "Data Not Inserted");
				 request.getRequestDispatcher("register.jsp").include(request, response);
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
