package sl_membermaster;

import java.io.IOException;
import java.sql.Connection;

import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sl_membermaster.DBManager;

/**
 * Servlet implementation class UpdateAddressAction
 */
public class UpdateAddressAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateAddressAction() {
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
		String str1=request.getParameter("name");
		String str2=request.getParameter("email");
		String str3=request.getParameter("mobilenumber");
		String str4=request.getParameter("address");
		String str5=request.getParameter("city");
		
		String str6=request.getParameter("pin");
		
		try{
				
				Connection conn=null;
				
				conn = DBManager.getConnection();
				
				Statement st=null;
				st=conn.createStatement();
				st.executeUpdate("update sl_membermaster set mem_email='"+str2+"',mem_mobileno='"+str3+"',mem_address='"+str4+"',mem_city='"+str5+"',mem_pincode='"+str6+"' where mem_username='"+str1+"'");
				HttpSession session=request.getSession();
				String addr= "Address is Successfully updated";
		    	session.setAttribute("addr", addr);
		    	 RequestDispatcher rd=request.getRequestDispatcher("PaymentOption.jsp");
					
					rd.include(request,response);
				
		conn.commit();		
		}
		catch(Exception e)
		{
		System.out.println(e);
		}
	}

}
