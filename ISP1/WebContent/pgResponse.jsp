<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="ISPPackage.PaytmConstants"%>
<%@page import="ISPPackage.ISPDao" %>
<%@ page import="java.util.*,com.paytm.pg.merchant.CheckSumServiceHelper"%>
 <%@page import="java.util.*" %> 
 <%@page import="java.io.*" %> 
 <%@page import="java.sql.ResultSet" %>
 <%@page import="java.time.LocalDateTime" %>
 <%@page import="java.time.format.DateTimeFormatter" %>
 <%@page import="javax.net.ssl.HttpsURLConnection" %>
 <%@page import="java.net.URL" %>
<%@page import="com.email.durgesh.Email" %> 
 <%@page import="java.net.URLEncoder" %>
<%
Enumeration<String> paramNames = request.getParameterNames();

Map<String, String[]> mapData = request.getParameterMap();
TreeMap<String,String> parameters = new TreeMap<String,String>();
String paytmChecksum =  "";
while(paramNames.hasMoreElements()) {
	String paramName = (String)paramNames.nextElement();
	if(paramName.equals("CHECKSUMHASH")){
		paytmChecksum = mapData.get(paramName)[0];
	}else{
		parameters.put(paramName,mapData.get(paramName)[0]);
	}
}
boolean isValideChecksum = false;
String outputHTML="";
try{
	isValideChecksum = CheckSumServiceHelper.getCheckSumServiceHelper().verifycheckSum(PaytmConstants.MERCHANT_KEY,parameters,paytmChecksum);
	if(isValideChecksum && parameters.containsKey("RESPCODE")){
		if(parameters.get("RESPCODE").equals("01")){
			outputHTML = parameters.toString();
			outputHTML=outputHTML.replace("{", " ");
			outputHTML=outputHTML.replace("}", " ");
			System.out.print(outputHTML);
			Map<String, String> map = new HashMap<String, String>();
			String[] test1 = outputHTML.split(",");
			
			for (String s : test1) {
			    String[] t = s.split("=");
			    map.put(t[0], t[1]);
			}

			String orderid="";
			String transactionid="";
			String bankname="";
			String paymentMode="";
			String currency="";
			String status="";
			String amount="";
			String pdate="";
			
			for (String s : map.keySet()) {
				//s=s.trim();
				if(s.equals(" ORDERID"))  
					orderid= map.get(s);
				else if(s.equals(" TXNID")) transactionid=map.get(s);
				else if(s.equals(" BANKNAME")) bankname=map.get(s);
				else if(s.equals(" PAYMENTMODE")) paymentMode=map.get(s);
				else if(s.equals(" CURRENCY")) currency=map.get(s);
				else if(s.equals(" STATUS")) status=map.get(s);
				else if(s.equals(" TXNDATE")) pdate=map.get(s);
				else if(s.equals(" TXNAMOUNT")) amount=map.get(s);
				 
			}

			if(status.contains("SUCCESS")){
				 HttpSession se=request.getSession(); 
				String p=(String)se.getAttribute("add_to_cart");
				if(p!=null)
			    {
				 String str[] = p.split(" ");
			     List<String> al = new ArrayList<String>();
			     al = Arrays.asList(str);
			     ListIterator<String> listItr = al.listIterator();
			     Double total=0.0;
			     String pid="";
			     String prodid="";
			     String serid="";
			     while(listItr.hasNext()) {
			         String val=(String)listItr.next();        
			         if(val.contains("pid")){
			        	 String[] id=val.split("-");
			        	 pid=id[1];
			         	} 
			         if(val.contains("prod")){
			        	 String[] id=val.split("-");
			        	 if(prodid.equals(""))
			        		 prodid=id[1];
			        	 else
			        	 prodid=prodid+","+id[1];
			       		}
			         if(val.contains("ser")){
			        	 String[] id=val.split("-");
			        	 if(serid.equals(""))
			        		 serid=id[1];
			        	 else
			        	 serid=serid+","+id[1];
			       		}
			     	}
			    
				     try{  
						
						
						 String demail=(String)se.getAttribute("cemail");
						 int cid=ISPDao.getcid("customer_details where cemail='"+demail+"'");
												 
						 DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
						 LocalDateTime today = LocalDateTime.now();
						 String current= formatter.format(today);
												 
						 int i1=ISPDao.insertData("INSERT INTO `request`(`orderid`,`cid`,`pid`,`prodid`,`serid`,`rstatus`,`rdate`)VALUES('"+orderid+"','"+cid+"','"+pid+"','"+prodid+"','"+serid+"','0','"+current+"')");
						 if(i1>0) {
							 int i=ISPDao.insertData("INSERT INTO `payment`(`cid`,`orderid`,`transactionid`,`bankname`,`paymentmode`,`currency`,`status`,`amount`,`pdate`)VALUES('"+cid+"','"+orderid+"','"+transactionid+"','"+bankname+"','"+paymentMode+"','"+currency+"','"+status+"','"+amount+"','"+pdate+"')");
							 if(i>0)
							 {
							 String number="";
							 String cemail="";
							 ResultSet rs3=ISPDao.get("customer_details where cid="+cid);
							 if(rs3.next())
							 {
							 	number=rs3.getString("cphone");
							 	cemail=rs3.getString("cemail");
							 }
						 	String message="Your Plan is selected.Payment is successfully don. You will get technician soon.Thank you."+current;
								
								
								try
								{
								
								String apiKey="irLdxv2THnPa1MZoU7gSOtkwW06Y3q54GhcjBezlKuyDbARJpEA16coeNyVURI0bOihnQasG2u8LZwr3";
								message=URLEncoder.encode(message, "UTF-8");
								String myUrl="https://www.fast2sms.com/dev/bulk?authorization="+apiKey+"&sender_id=FSTSMS&message="+message+"&language=english&route=p&numbers="+number;
								URL url=new URL(myUrl);
								HttpsURLConnection con1=(HttpsURLConnection)url.openConnection();
								con1.setRequestMethod("GET");
								con1.setRequestProperty("User-Agent", "Mozilla/5.0");
								con1.setRequestProperty("cache-control", "no-cache");
								out.println("Wait..............");
								int code=con1.getResponseCode();
								out.println("Response code : "+code);
								StringBuffer r=new StringBuffer();
								BufferedReader br=new BufferedReader(new InputStreamReader(con1.getInputStream()));
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
									e.printStackTrace();
								}	
								try {
									ISPDao.sendEmail("Plan is selected. ", "<h1>Your Plan is selected.</h1><br>Payment is successfully done.<br> You will get technician soon.<br>Thank you."+current+"", cemail);
							}
									catch(Exception e) {
										e.printStackTrace();
									}
							 session.setAttribute("add_to_cart",null);
							response.sendRedirect("invoice.jsp");
							}
						 else {
							request.setAttribute("error", "Data Not Inserted");
							request.getRequestDispatcher("checkout.jsp").include(request, response);
							}
						 }
					}	
					catch(Exception e){ System.out.println(e);}     
			}
			}
	
		}else{
			outputHTML="<b>Payment Failed.</b>";
		}
	}else{
		outputHTML="<b>Checksum mismatched.</b>";
	}
}catch(Exception e){
	outputHTML=e.toString();
}
%>
