package ISPPackage;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.servlet.ServletRequestContext;


/**
 * Servlet implementation class support_ticket

 */

public class support_ticket extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public support_ticket() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String dept="";
		String subject="";
		String maintext="";
		String attachment1="";
		String attachment2="";
		String attachment3="";		
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		if (!isMultipart)
		{
		}
		else
		{
			try
			{	 
				DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
				 LocalDateTime today = LocalDateTime.now();
				 String current= formatter.format(today); 
				 HttpSession session2=request.getSession();
				 int cid=ISPDao.getcid("customer_details where cemail='"+(String)session2.getAttribute("cemail")+"'");
				 String attr="";
				 String vattr="";
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			List items = null;
			try
			{
				items = upload.parseRequest(new ServletRequestContext(request));
				System.out.println(items);
			}//try
			catch (FileUploadException e)
			{
			e.getMessage();
			}//catch

			Iterator itr = items.iterator();
			while (itr.hasNext())
			{
				FileItem item = (FileItem) itr.next();
				if (item.isFormField())
				{
					String name = item.getFieldName();
					String value = item.getString();
					if(name.equals("dept"))
					{
					dept=value;
					}
					if(name.equals("subject"))
					{
					subject=value;
					}
					if(name.equals("maintext"))
					{
					maintext=value;
					}
				
				}//if
				else
				{		
					if(item.getFieldName().equals("attach1")) {			
							try
							{
							attachment1 = item.getName();
							if(!attachment1.equals("")) {
								attr=attr+",`attachment1`";
								vattr=vattr+",'"+attachment1+"'";
							}
							File savedFile = new File("C:/Users/Vikas Sonawane/eclipse-workspace/ISP_Customer/WebContent/images/"+attachment1);
							item.write(savedFile);
							}
							catch (Exception e)
							{
								e.printStackTrace();
							}			
						}//if
				
					
					if(item.getFieldName().equals("attach2")) {			
							try
							{
							attachment2 = item.getName();
							if(!attachment2.equals("")) {
								attr=attr+",`attachment2`";
								vattr=vattr+",'"+attachment2+"'";
							}
							File savedFile = new File("C:/Users/Vikas Sonawane/eclipse-workspace/ISP_Customer/WebContent/images/"+attachment2);
							item.write(savedFile);
							}
							catch (Exception e)
							{
								e.printStackTrace();
							}			
						}//if
				
					
					if(item.getFieldName().equals("attach3")) {			
							try
							{
							attachment3 = item.getName();
							if(!attachment3.equals(""))
							{
								attr=attr+",`attachment3`";
								vattr=vattr+",'"+attachment3+"'";
							out.print(attr+vattr);
								
							}
							File savedFile = new File("C:/Users/Vikas Sonawane/eclipse-workspace/ISP_Customer/WebContent/images/"+attachment3);
							item.write(savedFile);
							}
							catch (Exception e)
							{
							e.printStackTrace();
							}
						}//if
					}//else
				}//while
			
				
					int i=ISPDao.insertData("INSERT INTO isp_project.`support_ticket`(`sdept`,`subject`,`smaintext`,`cid`,`senddate`,`status`"+attr+")VALUES('"+dept+"','"+subject+"','"+maintext+"',"+cid+",'"+current+"','0'"+vattr+")");
					  
					if(i>0) {
						response.sendRedirect("support_ticket.jsp");
					}else {
					 request.setAttribute("error", "Data Not Inserted");
						 request.getRequestDispatcher("support_ticket.jsp").include(request, response);
					}
				}//try
				catch(Exception el)
				{
					out.println("Inserting error"+el.getMessage());
				}//catch
			}//else
	}//dopost
}//class
		
