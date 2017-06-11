package sl_adminmaster;

import sl_adminmaster.DBManager;

import java.io.IOException;

import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class OrderDeleteAction
 */
public class OrderDeleteAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderDeleteAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//PrintWriter out=response.getWriter();
		String select[] = request.getParameterValues("one"); 

	    if (select != null && select.length != 0) {
	       
	    	
	        for (int i = 0; i < select.length; i++) {
	           
	        }
	    }

	    
	    StringBuffer sb = new StringBuffer(); 

	    for(int i = 0; i < select.length; i++) {
	        sb.append(select[i] + ",");
	    }

	    String bid = sb.toString(); 
	    bid = bid.substring(0, bid.length()-1);
	   
	    try {
	    	Connection conn=null;
			
				conn = DBManager.getConnection();	
	        //Statement st = conn.createStatement();
	        PreparedStatement pst = conn.prepareStatement("DELETE FROM sl_orders WHERE order_id IN("+bid +")");
	        pst.executeUpdate();
	       
	      
			String d = "Order is Deleted Successfully";
			request.getSession().setAttribute("d", d);
			response.sendRedirect("Orderdetails.jsp");
			//request.getRequestDispatcher("Orderdetails.jsp").include(request, response);
			
			
       	conn.commit();
       	conn.close();
	}
	    
	  catch(Exception e) {
	    }
	}

			
		
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	
	}

}
