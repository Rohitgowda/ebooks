package sl_adminmaster;

import sl_adminmaster.DBManager;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CategoryAction
 */
public class CategoryAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CategoryAction() {
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
			
				
				PreparedStatement ps=null;
			
				String category=request.getParameter("category");
				
			
				
				try {
						Connection conn=null;
					//	DBManager db = new DBManager();
						conn = DBManager.getConnection();	
						
							
						if(category=="" && category!=null)
						{
							String m3= "Please Enter Category Name";
						    request.setAttribute("m3", m3);
						   // response.sendRedirect("addcategory.jsp");
						    request.getRequestDispatcher("Category.jsp").include(request, response);
						}
						
						else
						{
						int j=0;
						Statement st2=conn.createStatement();
						ResultSet rs=st2.executeQuery("Select * from sl_categorymaster");
						while(rs.next())
						{
							if(category.equals(rs.getString(2)))
							{
								j=1;
								request.getSession().removeAttribute("mes");
								request.getSession().removeAttribute("e2");
								request.getSession().removeAttribute("d");
								String m2= "Already Category Exists";
							    request.setAttribute("m2", m2);
							    //response.sendRedirect("addcategory.jsp");
								request.getRequestDispatcher("Category.jsp").include(request, response);
								 
							}
										
						}
						if(j==0)
						{
							Date d=new Date();
							SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
						    String s=sdf.format(d);
							ps=conn.prepareStatement("insert into sl_categorymaster values(cat_id,?,?)");
							ps.setString(1,category);
							ps.setString(2,s);
							ps.executeUpdate();
							request.getSession().removeAttribute("mes");
							request.getSession().removeAttribute("e2");
							request.getSession().removeAttribute("d");
							String m= "Category Inserted Successfully";
							request.getSession().setAttribute("m", m);
							response.sendRedirect("Category.jsp");
							
						    //request.setAttribute("m", m);
							  // request.getRequestDispatcher("Category.jsp").include(request, response);
							
						}
					}
					conn.commit();
				}
				
				catch(Exception e)
				{
				out.println(e.toString());
				}
				
					}
				
				}
