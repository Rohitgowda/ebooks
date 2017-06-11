package sl_membermaster;

import sl_membermaster.DBManager;

import java.io.*;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ImageRetrieve
 */
public class ImageRetrieve extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ImageRetrieve() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		//String id=request.getParameter("id");
		int id =  Integer.parseInt(request.getParameter("imgid"));
		  try{      
			 
			 		 Connection conn=null;
				
					conn = DBManager.getConnection();;
				   
				  
				    PreparedStatement ps = conn.prepareStatement("select book_image from sl_bookmaster where book_id =?");
		            ps.setInt(1,id);
		            ResultSet rs = ps.executeQuery();
		            rs.next();
		            Blob  b = rs.getBlob("book_image");
		           //response.setContentType("image/jpeg");
		            response.setContentLength( (int) b.length());
		            InputStream is = b.getBinaryStream();
		            OutputStream os = response.getOutputStream();
		            byte buf[] = new byte[(int) b.length()];
		            is.read(buf);
		            os.write(buf);
		            os.close();	
		            conn.commit();
		  }
		  
		  catch (Exception e)
		  {
		    e.printStackTrace();
		  }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

}
