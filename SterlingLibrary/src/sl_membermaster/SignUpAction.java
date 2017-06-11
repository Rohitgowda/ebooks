package sl_membermaster;


import sl_membermaster.DBManager;
import sl_membermaster.SendMail;
import java.security.spec.AlgorithmParameterSpec;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import sun.misc.BASE64Encoder;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.security.*;

import javax.crypto.*;


/**
 * Servlet implementation class SignUpAction
 */
public class SignUpAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	/*private static String algorithm = "DESede";
    private static Key key = null;
    private static Cipher cipher = null;
private static byte[] encrypt(String input)throws Exception {
        cipher.init(Cipher.ENCRYPT_MODE, key);
        byte[] inputBytes = input.getBytes();
        return cipher.doFinal(inputBytes);
    }

*/
	Cipher cipher;   
	 
	 final static String strPassword = "password12345678";
	 
	 static SecretKeySpec key = new SecretKeySpec(strPassword.getBytes(), "AES");

	PreparedStatement pstmt=null;
    public SignUpAction() {
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
		//String memoption=request.getParameter("memoption");
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String email=request.getParameter("email");
		String mobile=request.getParameter("mobile");
		String address=request.getParameter("address");
		String city=request.getParameter("city");
		String pn=request.getParameter("pin");		
		response.setContentType("text/html");
		try
		{
			
			/*key = KeyGenerator.getInstance(algorithm).generateKey();
            cipher = Cipher.getInstance(algorithm);
            String input = password;
            System.out.println("Entered: " + input);
            byte[] encryptionBytes = encrypt(input);
            String passw=new String(encryptionBytes);
            System.out.println("Entered: " + passw);*/
			
			String input = password;  
			 
			AlgorithmParameterSpec paramSpec = new     IvParameterSpec(strPassword.getBytes());   
		     
		    Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");  
		  
		      
		    cipher.init(Cipher.ENCRYPT_MODE, key, paramSpec);   
		  
		      
		     byte[] ecrypted = cipher.doFinal(input.getBytes());  
		  
		     
		     String output =  new BASE64Encoder().encode(ecrypted);

			Connection conn=null;
			
			conn = DBManager.getConnection();
			
		
			int j=0;
			Statement st2=conn.createStatement();
			ResultSet rs=st2.executeQuery("Select * from sl_membermaster");
			while(rs.next())
			{
				if(username.equals(rs.getString(2)))
				{
					j=1;
					
					String m2= "Already username Exists";
					//request.setAttribute("m2", m2);
				    request.getSession().setAttribute("m2", m2);
				    response.sendRedirect("Register.jsp");
			    
					//request.getRequestDispatcher("Register.jsp").forward(request, response);
					 
				}
							
			}
			if(j==0)
			{
				
				
			Date d=new Date();
		    SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
		    String st=sdf.format(d);
		    
			pstmt= conn.prepareStatement("insert into sl_membermaster values(mem_id,?,?,?,?,?,?,?,?)");
			pstmt.setString(1,username);
			pstmt.setString(2,email);
			pstmt.setString(3,output);
			pstmt.setString(4,mobile);
			pstmt.setString(5,address);
			pstmt.setString(6,city);
			pstmt.setString(7,pn);
			pstmt.setString(8, st);
			pstmt.executeUpdate();
				
				String success= "Thank You For Registering with us!!</br> Please Refer Your E-mail For Login Details";
				 request.getSession().setAttribute("success", success);
	          /* SendMail b=new SendMail();
	   		 b.method(username, email, password);*/
	   		response.sendRedirect("Register.jsp");
				//request.getRequestDispatcher("Login.jsp").include(request, response);
			
			}
			
			conn.commit();
			
		}
		catch(Exception e)
		{
		
		}
}



	}

