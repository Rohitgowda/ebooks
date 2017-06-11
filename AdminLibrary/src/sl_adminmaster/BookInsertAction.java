package sl_adminmaster;

import sl_adminmaster.DBManager;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.List;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
/**
 * Servlet implementation class ProductUploadAction
 */

@MultipartConfig(maxFileSize = 1617721511) 
public class BookInsertAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookInsertAction() {
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
		 response.setContentType("text/html;charset=UTF-8");
	        PrintWriter out = response.getWriter();
		try
			{
				
				 	DiskFileItemFactory factory = new DiskFileItemFactory();
		            ServletFileUpload sfu  = new ServletFileUpload(factory);

		            if (!ServletFileUpload.isMultipartContent(request)) {
		            	
		            	String message4= "sorry. No file uploaded";
				    	request.setAttribute("message4", message4);
				    	request.getRequestDispatcher("Book.jsp").include(request, response);
		               
		                return;
		            }

		            // parse request
		            List items = sfu.parseRequest(request);
		           /* FileItem id = (FileItem) items.get(0);
		            String photoid =  id.getString();*/
		            
		            FileItem bname = (FileItem) items.get(0);
		            String   bookname =  bname.getString();

		            // get uploaded file
		            FileItem file = (FileItem) items.get(1);
		            
		            FileItem cname = (FileItem) items.get(2);
		            String   catname =  cname.getString();
		            
		            FileItem bdesc = (FileItem) items.get(3);
		            String   bkdesc =  bdesc.getString();
		            
		            FileItem author = (FileItem) items.get(4);
		            String   bauthor =  author.getString();
		            
		            FileItem file1 = (FileItem) items.get(5);   
		            
		            FileItem price = (FileItem) items.get(6);
		            String   bprice =  price.getString();
		            
		            
					Connection conn=null;
					conn = DBManager.getConnection();
					 conn.setAutoCommit(false);
					 
					PreparedStatement ps;
					
					if(bookname=="" || bprice==" " || bauthor=="" || bkdesc=="" || catname=="")
					{
						String mess= "Please Enter Every Field";
					    request.setAttribute("mess", mess);
					    RequestDispatcher rd=request.getRequestDispatcher("Book.jsp");
						
						rd.include(request,response);
						
					}
					else
					{
						int j=0;
						Statement st2=conn.createStatement();
						ResultSet rs=st2.executeQuery("Select * from sl_bookmaster");
						while(rs.next())
						{
							if(bookname.equals(rs.getString(2)))
							{
								j=1;
								String m2= "Already Book Exists";
							    request.setAttribute("m2", m2);
								request.getRequestDispatcher("Book.jsp").include(request, response);
								 
							}
										
						}
						if(j==0)
						{
							Date d=new Date();
						    SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
						    String r=sdf.format(d);
						    ps = conn.prepareStatement("insert into sl_bookmaster values(book_id,?,?,?,?,?,?,?,?)");
						    //ps.setInt(1,Book_id);
						    ps.setString(1,bookname);
						    ps.setBinaryStream(2, file.getInputStream(), (int) file.getSize());
						    ps.setString(3,catname);
						    ps.setString(4,bauthor);
						    ps.setString(5,bkdesc);
						    ps.setString(6,bprice);
						    ps.setBinaryStream(7, file1.getInputStream(), (int) file1.getSize());
			
						   
						    ps.setString(8,r);
			
						    ps.executeUpdate();
						    request.getSession().removeAttribute("upsuccess");
						    request.getSession().removeAttribute("del");
						    String message3= "Book details are Inserted Successfully";
							request.getSession().setAttribute("message3", message3);
							response.sendRedirect("Book.jsp");
						      
						    /*	request.setAttribute();
						    	request.getRequestDispatcher("Book.jsp").include(request, response);*/
						   
						}
					}
					
					conn.commit();
			}
			
				
			
			
			catch(Exception e)
			{
				e.printStackTrace();
			}
			}

		}
