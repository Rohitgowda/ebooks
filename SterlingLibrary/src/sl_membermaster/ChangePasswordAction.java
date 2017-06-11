package sl_membermaster;

import sl_membermaster.DBManager;

import java.io.IOException;


import java.security.spec.AlgorithmParameterSpec;  

import javax.crypto.Cipher;  
import javax.crypto.spec.IvParameterSpec;  
import javax.crypto.spec.SecretKeySpec;  

import sun.misc.BASE64Decoder;  
import sun.misc.BASE64Encoder;


import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class ChangePasswordAction
 */
public class ChangePasswordAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
	Cipher cipher;   
	 
	 final static String strPassword = "password12345678";
	 static SecretKeySpec key = new SecretKeySpec(strPassword.getBytes(), "AES");

	 
    public ChangePasswordAction() {
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
	
		String username=request.getParameter("name");
		String OldPassword = request.getParameter("OldPassword");
		String Newpass = request.getParameter("newpassword");
		String conpass = request.getParameter("conpassword");
		
		Statement st = null;
		String pass = "";
		
		try {
			
			Connection conn=null;
			
			conn = DBManager.getConnection();			
			st = conn.createStatement();
		
		     
		ResultSet rs = st.executeQuery("select * from sl_membermaster where mem_username= '"+ username + "' ");
		if (rs.next()) { 
		pass = rs.getString("mem_password");
		} 
		
		String dec =pass;
		 
		 AlgorithmParameterSpec paramSpec = new IvParameterSpec(strPassword.getBytes());   
	     
		    Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");  
		  
		     
		     cipher.init(Cipher.DECRYPT_MODE, key, paramSpec);    
		  
		      
		     byte[] decr =  new BASE64Decoder().decodeBuffer(dec);    
		  
		          
		     byte[] decrypted = cipher.doFinal(decr);      
		    // System.out.println("Decrypted string: " + new String(decrypted));    
		     String passw=new String(decrypted);

		if(Newpass.equals(conpass))
		{
		if (passw.equals(OldPassword)) {
		st = conn.createStatement();
		
		 String input = Newpass;  
		 
			AlgorithmParameterSpec paramSpec1 = new     IvParameterSpec(strPassword.getBytes());   
		     
		    Cipher cipher1 = Cipher.getInstance("AES/CBC/PKCS5Padding");  
		  
		      
		    cipher1.init(Cipher.ENCRYPT_MODE, key, paramSpec1);   
		  
		      
		     byte[] ecrypted = cipher1.doFinal(input.getBytes());  
		  
		     
		     String newpassword =  new BASE64Encoder().encode(ecrypted);

		int i = st.executeUpdate("update sl_membermaster set mem_password='"+ newpassword + "' where mem_username='"+username+"'");
		String message1= "Password is successfully updated";
        request.setAttribute("message1", message1);
		request.getRequestDispatcher("Changepassword.jsp").include(request, response);
	

		} else {
			String message2= "Password Doesn't Match";
	        request.setAttribute("message2", message2);
			request.getRequestDispatcher("Changepassword.jsp").include(request, response);
		}
		}
		conn.commit();
		} 
		catch (Exception e)
		{

		}

	}

}

