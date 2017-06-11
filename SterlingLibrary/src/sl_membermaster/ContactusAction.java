package sl_membermaster;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ContactusAction
 */
/*@WebServlet("/ContactusAction")*/
public class ContactusAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContactusAction() {
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
		
		
			 Properties props = new Properties();
				props.put("mail.smtp.host", "smtp.gmail.com");
				props.put("mail.smtp.socketFactory.port", "465");
				props.put("mail.smtp.socketFactory.class",
						"javax.net.ssl.SSLSocketFactory");
				props.put("mail.smtp.auth", "true");
				props.put("mail.smtp.port", "465");

				Session session = Session.getDefaultInstance(props,
					new javax.mail.Authenticator() {
						protected PasswordAuthentication getPasswordAuthentication() {
							return new PasswordAuthentication("mohammedharif63","MHarif8277240533");
						}
					});

				String name=request.getParameter("fname");
				String email=request.getParameter("eid");
				String phone=request.getParameter("pnum");
				String comment=request.getParameter("comment");
				
				try {

					Message message = new MimeMessage(session);
					/*message.setFrom(new InternetAddress(email));*/
					message.setRecipients(Message.RecipientType.TO,
							InternetAddress.parse("mohammedharif63@gmail.com"));
					message.setSubject("Welcome To Sterling Library");
					message.setText("Hello Admin,\n\n"+
					"User name : '"+name+"' has Contacted You For the Following Query\n\n"+
							"\t\tPlease Find the Details Below\n\n\n"+
					" Name :\t"+name+"\n\n Email Id :\t"+email+"\n\n Phone Number :\t"+phone+"\n\n"+
							"\n\t Query : \n\n"+comment+"\n\n\n"+
					"Thank You,");

					
					/* message.setSubject(subject);*/
					 //message.setText(comment);

					Transport.send(message);

					String success= "Thank You For Registering with us!!</br> Please Refer Your email For Login Details";
					 request.getSession().setAttribute("success", success);
		          /* SendMail b=new SendMail();
		   		 b.method(username, email, password);*/
		   		response.sendRedirect("Contactus.jsp");

				} catch (MessagingException e) {
					throw new RuntimeException(e);
				}
			

	}

}
