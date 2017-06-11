package sl_membermaster;

import sl_membermaster.DBManager;

import java.io.*;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PdfRetrieve
 */
public class PdfRetrieve extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PdfRetrieve() {
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
		int id =  Integer.parseInt(request.getParameter("pdid"));
		  try{      
			 
			 		 Connection conn=null;
				
					conn = DBManager.getConnection();;
					Statement st=conn.createStatement();
				    String strQuery = "select book_pdf from sl_bookmaster where book_id="+id;
				    ResultSet rs = st.executeQuery(strQuery);
				
				    String imgLen="";
				    if(rs.next()){
				      imgLen = rs.getString(1);
				       }  
				    rs = st.executeQuery(strQuery);
				    if(rs.next()){
				      int len = imgLen.length();
				      byte [] rb = new byte[len];
				      InputStream readImg = rs.getBinaryStream(1);
				      readImg.read(rb, 0, len);  
				      st.close();
				      response.reset();
				      response.getOutputStream().write(rb,0,len); 
				      response.getOutputStream().flush();  
				    }
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
