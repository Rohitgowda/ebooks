package sl_membermaster;

import sl_membermaster.DBManager;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.*;
import java.sql.*;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class User
 */
@WebServlet("/User")
public class User extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	private static String algorithm = "DESede";
    private static Key key = null;
    private static Cipher cipher = null;
		
    private static byte[] encrypt(String input)throws Exception {
	        cipher.init(Cipher.ENCRYPT_MODE, key);
	        byte[] inputBytes = input.getBytes();
	        return cipher.doFinal(inputBytes);
	    }

	private static String decrypt(byte[] encryptionBytes)throws Exception {
	    cipher.init(Cipher.DECRYPT_MODE, key);
	    byte[] recoveredBytes =  cipher.doFinal(encryptionBytes);
	    String recovered =  new String(recoveredBytes);
	    return recovered;
	  }


    public User() {
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
		PrintWriter out=response.getWriter();
		String name=request.getParameter("name");
		String password=request.getParameter("pass");

		StringBuffer buffer=new StringBuffer();
		
		Connection conn=null;
		
		try{
			
			 			key = KeyGenerator.getInstance(algorithm).generateKey();
			            cipher = Cipher.getInstance(algorithm);
			            String input = password;
			            System.out.println("Entered: " + input);
			            byte[] encryptionBytes = encrypt(input);
			            String passw=new String(encryptionBytes);
			            System.out.println("Entered: " + passw);
			
			conn = DBManager.getConnection();
		PreparedStatement ps = conn.prepareStatement("INSERT INTO userinfo(user,password) VALUES(?,?)");
		ps.setString(1,name);
		ps.setString(2,passw);

		int i = ps.executeUpdate();
		ps.close();

		}
		catch(Exception ex){
		System.out.println(ex);
		}
		try{
			Statement st=conn.createStatement();
			ResultSet rs=st.executeQuery("Select * from userinfo where id=8");
			String str="";
			if(rs.next()){
			str=rs.getString("password");
			}
			out.println("Your password is: "+decrypt(str.getBytes()));
			System.out.println("Your password is: "+decrypt(str.getBytes()));
		conn.commit();
		}
		
			catch(Exception e){}
	}

}
