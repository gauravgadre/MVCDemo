package ISPPackage;

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

import java.net.URL;
import java.net.URLEncoder;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 * Servlet implementation class SendSms
 */
@WebServlet("/SendSms1")
public class SendSms extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendSms() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		LocalDateTime today = LocalDateTime.now();
		String current= formatter.format(today);
		String message="this message using java code ..."+current;
		String number="9579511846";
		response.setContentType("text/type");
	    PrintWriter out=response.getWriter();
		
		try
		{
		
		String apiKey="irLdxv2THnPa1MZoU7gSOtkwW06Y3q54GhcjBezlKuyDbARJpEA16coeNyVURI0bOihnQasG2u8LZwr3";
		message=URLEncoder.encode(message, "UTF-8");
		String myUrl="https://www.fast2sms.com/dev/bulk?authorization="+apiKey+"&sender_id=FSTSMS&message="+message+"&language=english&route=p&numbers="+number;
		URL url=new URL(myUrl);
		HttpsURLConnection con=(HttpsURLConnection)url.openConnection();
		con.setRequestMethod("GET");
		con.setRequestProperty("User-Agent", "Mozilla/5.0");
		con.setRequestProperty("cache-control", "no-cache");
		out.println("Wait..............");
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
