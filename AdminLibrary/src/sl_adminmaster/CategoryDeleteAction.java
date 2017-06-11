package sl_adminmaster;

import sl_adminmaster.DBManager;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;

/**
 * Servlet implementation class DeleteAction
 */
public class CategoryDeleteAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CategoryDeleteAction() {
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
		String id=request.getParameter("id");
		String n="";
		try {
				Connection conn=null;
			
				conn = DBManager.getConnection();	
				Statement st=null;
				st=conn.createStatement();
				Statement stm=conn.createStatement();
				ResultSet rs1=stm.executeQuery("select * from sl_categorymaster where cat_id='"+id+"'");
				while(rs1.next())
				{
					 
					 n=rs1.getString("cat_name");
				}
				
				int r=st.executeUpdate("DELETE sl_categorymaster FROM sl_categorymaster LEFT JOIN sl_bookmaster ON sl_categorymaster.cat_name=sl_bookmaster.cat_name WHERE sl_bookmaster.cat_name IS NULL and sl_categorymaster.cat_id='"+id+"'");
				//int r=st.executeUpdate("DELETE from sl_categorymaster where cat_id='"+id+"'");
				if(r==1)
				{
					request.getSession().removeAttribute("mes");
					request.getSession().removeAttribute("e2");
				String d = "Category is Deleted Successfully";
				request.getSession().setAttribute("d", d);
				response.sendRedirect("Category.jsp");
				}
				else
				{
					String e1 = "The selected Category <font size=4>'"+n+"'</font> cannot be deleted!!  Books are available!! ";
					request.getSession().setAttribute("e1", e1);
					response.sendRedirect("Category.jsp");
					
				}
				conn.commit();
			}
			catch(Exception e){}
	}

}
