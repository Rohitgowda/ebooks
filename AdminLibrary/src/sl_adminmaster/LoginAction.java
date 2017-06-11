package sl_adminmaster;


import sl_adminmaster.Login;

import java.io.IOException;
import java.io.PrintWriter;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

import javax.sql.DataSource;



import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginAction
 */
public class LoginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginAction() {
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
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		//String n=request.getParameter("userName");
		String n=request.getParameter("userName");
		String p=request.getParameter("password");
		
		HttpSession session=request.getSession();
		
		if(Login.validate(n, p))
		{	
			session.setAttribute("username",n);
			session.setAttribute("password",p);
			request.setAttribute("username", n);
			request.getSession().setAttribute("username", n);
			RequestDispatcher rd=request.getRequestDispatcher("Admin.jsp");
			rd.forward(request,response);
		}			
		else
		{
			String message= "Invalid Username/Password";
			request.getSession().setAttribute("message", message);
			response.sendRedirect("index.jsp");
		}
		
		out.close();
		
	}

}
