package ISPPackage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class contactForm
 */
@WebServlet("/contactForm1")
public class contactForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public contactForm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		response.setContentType("text/html");  
        PrintWriter out=response.getWriter();
        String cname=request.getParameter("name");
        String cemail=request.getParameter("email");
        String cphone=request.getParameter("mobile");
        String cmsg=request.getParameter("message");
       
		try{  
			
			int i=ISPDao.insertData("INSERT INTO `contact_us`(`cname`,`cemail`,`con_mob`,`cmsg`)VALUES('"+cname+"','"+cemail+"','"+cphone+"','"+cmsg+"')");  
			if(i>0) {
				response.sendRedirect("index.jsp#home");
			}else {
				out.println("Data Not Inserted");
			} 
		}
		catch(Exception e){ out.println(e);}
	}

}
