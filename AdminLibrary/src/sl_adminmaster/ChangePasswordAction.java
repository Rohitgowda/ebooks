package sl_adminmaster;

import sl_adminmaster.DBManager;

import java.io.IOException;
import java.sql.*;

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
		ResultSet rs = st.executeQuery("select * from sl_adminmaster where admin_password= '"+ OldPassword + "' && admin_username= '"+ username + "' ");
		if (rs.next()) { 
		pass = rs.getString("admin_password");
		} 
		if(Newpass.equals(conpass))
		{
		if (pass.equals(OldPassword)) {
		st = conn.createStatement();
		st.executeUpdate("update sl_adminmaster set admin_password='"+ Newpass + "' where admin_username='"+username+"'");
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

