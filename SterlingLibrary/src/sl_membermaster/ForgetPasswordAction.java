package sl_membermaster;

import sl_membermaster.ForgetPasswordMail;
import sl_membermaster.DBManager;
import sl_membermaster.RandomPasswordGenerator;

import java.io.IOException;
import java.sql.*;
import java.security.spec.AlgorithmParameterSpec;  

import javax.crypto.Cipher;  
import javax.crypto.spec.IvParameterSpec;  
import javax.crypto.spec.SecretKeySpec;  

import sun.misc.BASE64Decoder;  
import sun.misc.BASE64Encoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class ForgetPasswordAction
 */
@WebServlet("/ForgetPasswordAction")
public class ForgetPasswordAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
	Cipher cipher;   
	 
	 final static String strPassword = "password12345678";
	 
	 static SecretKeySpec key = new SecretKeySpec(strPassword.getBytes(), "AES");

    
    public ForgetPasswordAction() {
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
		
		 //String name=request.getParameter("userName");
		 String mail=request.getParameter("email");
		 
		 ResultSet rs=null;
		
		 String Len="";
			try 
	        {
				
				
			     
				Connection conn=null;
				
				conn = DBManager.getConnection();
				int j=0;
				Statement st2=conn.createStatement();
				Statement st3=conn.createStatement();
				rs=st2.executeQuery("select * from sl_membermaster");
				while(rs.next())
				{
					
					if(mail.equals(rs.getString(3)))
					{
						j=1;
						/*String sql ="select * from sl_membermaster where mem_email='"+mail+"'";
			            stmt=conn.createStatement();
			            rs=stmt.executeQuery(sql);
			         rs.next();*/
			         /*String pass=rs.getString(4);*/
						int id=Integer.parseInt(rs.getString(1));
						String name=rs.getString(2);
			         int noOfCAPSAlpha = 1;
			         int noOfDigits = 1;
			         int noOfSplChars = 1;
			         int minLen = 8;
			         int maxLen = 12;
			  
			         for (int i = 0; i < 10; i++) {
			             char[] pswd = RandomPasswordGenerator.generatePswd(minLen, maxLen,noOfCAPSAlpha, noOfDigits, noOfSplChars);
			             Len = new String(pswd);
			             //stmt=conn.createStatement();
			            
			              
			         }
			         String input = Len;  
					 
						AlgorithmParameterSpec paramSpec = new     IvParameterSpec(strPassword.getBytes());   
					     
					    Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");  
					  
					      
					    cipher.init(Cipher.ENCRYPT_MODE, key, paramSpec);   
					  
					      
					     byte[] ecrypted = cipher.doFinal(input.getBytes());  
					  
					     
					     String newpass =  new BASE64Encoder().encode(ecrypted);
			       
					     
			         if(Len!="")
			         {
			        	 
			        	 st3.executeUpdate("update sl_membermaster set mem_password='"+newpass+"' where mem_id="+id);
			        	 ForgetPasswordMail b=new ForgetPasswordMail();
			       		 b.method(name, mail, Len);
			         }
			         String msg1="New Password sent to your E-Mail please check";
			         request.getSession().setAttribute("msg1",msg1);
			         response.sendRedirect("ForgetPass.jsp");
						
						 
					}
								
				}
				if(j==0)
				{
	            
					String m2= "Username or email doesn't Exist";
					request.setAttribute("m2", m2);
				 
					request.getRequestDispatcher("ForgetPass.jsp").forward(request, response);
				}
				conn.commit();
	        }
				catch(Exception e)
				{
				e.printStackTrace();
				}
	
	}

}
