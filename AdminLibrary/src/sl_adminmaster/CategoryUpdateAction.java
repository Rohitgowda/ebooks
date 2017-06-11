package sl_adminmaster;

import sl_adminmaster.DBManager;

import java.io.IOException;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



/**
 * Servlet implementation class UpdateAction
 */
public class CategoryUpdateAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CategoryUpdateAction() {
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
	
		String ide=request.getParameter("cid");
		int num=Integer.parseInt(ide);
		String name=request.getParameter("name");
		
		try{
				
				Connection conn=null;
				
				conn = DBManager.getConnection();
				
				Statement st=null;
				st=conn.createStatement();
				int j=0;
				Statement st2=conn.createStatement();
				ResultSet rs=st2.executeQuery("Select * from sl_categorymaster");
				while(rs.next())
				{
					if(name.equals(rs.getString(2)))
					{
						j=1;
						request.getSession().removeAttribute("mes");
						request.getSession().removeAttribute("d");
						String e2= "Already Category Exists";
						request.getSession().setAttribute("e2", e2);
						response.sendRedirect("Category.jsp");
					   /* request.setAttribute("m2", m2);
					    response.sendRedirect("Category.jsp");*/
						//request.getRequestDispatcher("addcategory.jsp").forward(request, response);
						 
					}
								
				}
				if(j==0)
				{
					
				   
				st.executeUpdate("update sl_categorymaster set cat_name='"+name+"' where cat_id='"+num+"'");
				HttpSession session=request.getSession();
				request.getSession().removeAttribute("e2");
				request.getSession().removeAttribute("d");
				String mes= "Category is Successfully updated";
				
				request.getSession().setAttribute("mes", mes);
				response.sendRedirect("Category.jsp");
		    	/*session.setAttribute("mes", mes);
		    	 RequestDispatcher rd=request.getRequestDispatcher("Category.jsp");
					
					rd.include(request,response);*/
				}
		conn.commit();		
		}
		catch(Exception e)
		{
		System.out.println(e);
		}
	}

}
