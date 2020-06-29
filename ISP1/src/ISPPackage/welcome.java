package ISPPackage;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class welcome
 */
@WebServlet("/welcome1")
public class welcome extends HttpServlet implements Servlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public welcome() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		response.setContentType("text/html");  
        PrintWriter out=response.getWriter();
        String str="{BANKNAME=SBI, BANKTXNID=14367430504, CURRENCY=INR, GATEWAYNAME=SBI, MID=MCBczB45104224395594, ORDERID=ORDS_740472, PAYMENTMODE=NB, RESPCODE=01, RESPMSG=Txn Success, STATUS=TXN_SUCCESS, TXNAMOUNT=8040.00, TXNDATE=2020-04-25 15:13:56.0, TXNID=20200425111212800110168293701485871}";
        out.print(str);

	}

}
