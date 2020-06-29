package Admin;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.net.UnknownHostException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
 ;



/**
 * Servlet implementation class smssend
 */
@WebServlet("/Admin/smssend")
public class smssend extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public smssend() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		LocalDateTime today = LocalDateTime.now();
		String current= formatter.format(today);
		
		String message="this message using java code ..."+current;
		String number="";
		response.setContentType("text/type");
	    PrintWriter out=response.getWriter();
	    String eid=request.getParameter("eid");

	String number1=request.getParameter("number");
		String mess =request.getParameter("message");
		
		try
		{
			//String hostname = "http://locaihost";
			//URL url = new URL(hostname);
			//HttpURLConnection con = (HttpURLConnection) url.openConnection();
			//con.getResponseCode();
		String apiKey="1rvUaLiSolFK72CcMZEGxDYz6P94JQRn0jwyOse5fhkqVdbg8A2K9UXPwCWrhlYik7H65I4tTF8gZ3xo";
		message=URLEncoder.encode(message, "UTF-8");
		String myUrl="https://www.fast2sms.com/dev/bulk?authorization="+apiKey+"&sender_id=FSTSMS&message="+mess+"&language=english&route=p&numbers="+number1;
		URL url=new URL(myUrl);
		HttpsURLConnection con=(HttpsURLConnection)url.openConnection();
		con.setRequestMethod("GET");
		con.setRequestProperty("User-Agent", "Mozilla/5.0");
		con.setRequestProperty("cache-control", "no-cache");
		 con.getResponseCode();
		out.println("message send successfully..............");
		int code=con.getResponseCode();
		out.println("Response code : "+code);
		StringBuffer r=new StringBuffer();
		BufferedReader br=new BufferedReader(new InputStreamReader(con.getInputStream()));
		while(true)
		{
			String line=br.readLine();
			if(line==null)
			{
				break;
			}
			r.append(line);
		}
		out.println(response);
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
