package sl_membermaster;

import sl_membermaster.DBManager;
//import sl_membermaster.Login;

import java.security.spec.AlgorithmParameterSpec;  

import javax.crypto.Cipher;  
import javax.crypto.spec.IvParameterSpec;  
import javax.crypto.spec.SecretKeySpec;  

import sun.misc.BASE64Decoder;  

import java.io.IOException;
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
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class LoginAction
 */
public class LoginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	Cipher cipher;   
    
    final static String strPassword = "password12345678";  
    
      
    static SecretKeySpec key = new SecretKeySpec(strPassword.getBytes(), "AES"); 
    
    public LoginAction() {
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
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		//String n=request.getParameter("userName");
		String n=request.getParameter("userName");
		String p=request.getParameter("password");
		
		
		try{
			Connection conn=null;
			
			conn = DBManager.getConnection();		

			
				Statement st=conn.createStatement();
		 ResultSet rs=st.executeQuery("select * from sl_membermaster where mem_username='"+n+"' or mem_email='"+n+"'");
		 rs.next();
		 /*String name=rs.getString("mem_username");
			 String name1=rs.getString(6);*/
			 String pass=rs.getString("mem_password");
			 String name=rs.getString("mem_username");
			 
			 String input =pass;
				
			 AlgorithmParameterSpec paramSpec = new IvParameterSpec(strPassword.getBytes());   
			     
			    Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");  
			  
			     
			     cipher.init(Cipher.DECRYPT_MODE, key, paramSpec);    
			  
			      
			     byte[] output =  new BASE64Decoder().decodeBuffer(input);    
			  
			          
			     byte[] decrypted = cipher.doFinal(output);      
			    // System.out.println("Decrypted string: " + new String(decrypted));    
			     String pass1=new String(decrypted);
			 
			 
			
				if((pass1.equals(p)))
				{
					HttpSession session=request.getSession(true);
					session.setAttribute("username",name);
					session.setAttribute("password",p);
					request.setAttribute("username", n);
					RequestDispatcher rd=request.getRequestDispatcher("Home.jsp");
					rd.forward(request,response);
				}
				else
				{
					String message= "Invalid Username/Password";
					request.getSession().setAttribute("message", message);
					response.sendRedirect("Login.jsp");
					
				}
		/*	}
			else
			{
				request.setAttribute("msg",message1);
				RequestDispatcher rd=request.getRequestDispatcher("Home.jsp");
				rd.include(request,response);
				
			}*/
				conn.commit();

	    }
	    catch(Exception e)
	    {
	    	
	    }
	 
	}
		}
		