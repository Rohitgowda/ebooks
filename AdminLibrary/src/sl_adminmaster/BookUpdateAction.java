package sl_adminmaster;

import sl_adminmaster.DBManager;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BookUpdateAction
 */
public class BookUpdateAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookUpdateAction() {
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

			String ide=request.getParameter("id");
			int num=Integer.parseInt(ide);
			String name=request.getParameter("name");
			String cname=request.getParameter("cname");
			
			String author=request.getParameter("author");
			String desc=request.getParameter("bdesc");
			String price=request.getParameter("price");
			
			
			try{
						Connection conn=null;
						
						conn = DBManager.getConnection();
						
						Statement st=null;
						st=conn.createStatement();
						int j=0;
						Statement st2=conn.createStatement();
						ResultSet rs=st2.executeQuery("Select * from sl_bookmaster");
						while(rs.next())
						{
							if(name.equals(rs.getString(2)))
							{
								j=1;
								String m2= "Already Category Exists";
							    request.setAttribute("m2", m2);
							    response.sendRedirect("Book.jsp");
								//request.getRequestDispatcher("addcategory.jsp").forward(request, response);
								 
							}
										
						}
						if(j==0)
						{
							
							Date d=new Date();
						    SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
						    String r=sdf.format(d);   
						st.executeUpdate("update sl_bookmaster set book_name='"+name+"',cat_name='"+cname+"',book_desc='"+desc+"',book_author='"+author+"',book_price='"+price+"',created_on='"+r+"' where book_id='"+num+"'");
						request.getSession().removeAttribute("del");
						 String upsuccess= "Book details are Updated Successfully";
							request.getSession().setAttribute("upsuccess", upsuccess);
							response.sendRedirect("Book.jsp");
						}
					conn.commit();		
			}
				
			catch(Exception e)
			{
				System.out.println(e);
		    }
	}

}
