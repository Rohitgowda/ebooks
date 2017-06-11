package sl_membermaster;

import sl_membermaster.DBManager;

import java.io.IOException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class OrderUploadAction
 */
public class OrderUploadAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */

    public OrderUploadAction() {
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
		//	PrintWriter out=response.getWriter();
			//String str5=request.getParameter("author");
			String str1=request.getParameter("name");
			String str2=request.getParameter("price");
			String str3=request.getParameter("qty");
			String str4=request.getParameter("category");
			String str6=request.getParameter("total");
			
		
			HttpSession session=request.getSession();
			String user=(String)session.getAttribute("username");
		
			try{      
				
						Connection conn=null;
						
						conn = DBManager.getConnection();
					    PreparedStatement ps=null;

						if(str1=="" && str1!=null)
						{
							String m3= "Something went wrong Please Buy Again";
						    request.setAttribute("m3", m3);
						   // response.sendRedirect("addcategory.jsp");
						    request.getRequestDispatcher("PaymentOption.jsp").include(request, response);
						}
						
						else
						{
						
					    java.util.Date d=new java.util.Date();
					    SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
					    String sp=sdf.format(d);
					    ps = conn.prepareStatement("insert into sl_orders(order_date,order_by,order_book,order_cat,order_qty,order_price,order_totalamt) values(?,?,?,?,?,?,?)");

					    ps.setString(1,sp);
					    ps.setString(2,user);
					    ps.setString(3,str1);
					    ps.setString(4,str4);
					    ps.setString(5,str3);

					    ps.setString(6,str2);
					    
					    ps.setString(7,str6);

					  ps.executeUpdate();
				
						  
						 
						
						  String me= "Thank u for buying!!";
						  request.getSession().setAttribute("me", me);
						  response.sendRedirect("PaymentOption.jsp");
						   // request.getRequestDispatcher("Logged.jsp").forward(request, response);
						//request.getRequestDispatcher("BuyNow.jsp").include(request, response);
							
					
					
						}
					  conn.commit();

		  }
		  catch(Exception e)
		  {
		    e.getMessage();
		  }

	  
	}

}

