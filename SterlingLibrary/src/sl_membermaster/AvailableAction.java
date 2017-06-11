package sl_membermaster;
import sl_membermaster.DBManager;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * Servlet implementation class AvailableAction
 */

public class AvailableAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AvailableAction() {
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
		String name = request.getParameter("name");
		System.out.println(name);
		String data ="";
		try{
				Connection conn=null;
			
				conn = DBManager.getConnection();		
				Statement st=conn.createStatement();
		        ResultSet rs=st.executeQuery("select * from sl_membermaster where mem_username='"+name+"'");
		        int count=0;
		          while(rs.next())
		          {

		                   count++;
		          }

		                    if(count>0)
		          {
		             data="Not Available";
		          }
		          else
		          {
		                      data="Available";
		          }
		out.println(data);
		System.out.println(data);
		}
		catch (Exception e) {
		System.out.println(e);
		}

}



	}