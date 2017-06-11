package sl_adminmaster;

import sl_adminmaster.DBManager;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 * Servlet implementation class DeleteProduct
 */
public class BookDeleteAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookDeleteAction() {
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
		String select[] = request.getParameterValues("select"); 
		
		/*if (request.getParameterValues("select") == null ){
		    // do stuff
			String ord = "Book is Not Deleted ";
			request.getSession().setAttribute("ord", ord);
			response.sendRedirect("Book.jsp");

		}
		*/
	    if (select != null && select.length != 0) {
	    	String ord = "Book is Not Deleted ";
			request.getSession().setAttribute("ord", ord);
			response.sendRedirect("Book.jsp");
	    }

	    //String selected="";
	    StringBuffer sb = new StringBuffer(); 

	    for(int i = 0; i < select.length; i++) {
	        sb.append(select[i] + ",");
	    }

	    String vwarnid = sb.toString(); 
	    vwarnid = vwarnid.substring(0, vwarnid.length()-1);
	    out.print(vwarnid);

	    try {
	    	Connection conn=null;
			
				conn = DBManager.getConnection();	
	        //Statement st = conn.createStatement();
	        PreparedStatement pst = conn.prepareStatement("DELETE FROM sl_bookmaster WHERE book_id IN("+vwarnid +")");
	        int i=pst.executeUpdate();
	        if(i==1)
			{
			
			String d = "Book is Deleted Successfully";
			request.getSession().setAttribute("d", d);
			response.sendRedirect("Book.jsp");
			//request.getRequestDispatcher("Orderdetails.jsp").include(request, response);
			}
			else
			{
				String ord = "Book is Not Deleted ";
				request.getSession().setAttribute("ord", ord);
				response.sendRedirect("Book.jsp");
				//request.getRequestDispatcher("Orderdetails.jsp").include(request, response);
				
			}
			/*String del= "Order is Deleted Successfully";
			request.setAttribute("del", del);
			request.getRequestDispatcher("Orderdetails.jsp").include(request, response);*/
			//response.sendRedirect("Book.jsp");
		
		
       	conn.commit(); 
       	conn.close();
	}
	    catch(NullPointerException e) {
	    	
			request.getRequestDispatcher("Book.jsp").include(request, response);
			
	    } 
	  catch(Exception e) {
	    }
	}
}
			