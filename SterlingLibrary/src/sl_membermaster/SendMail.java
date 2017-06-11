package sl_membermaster;


import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
 
public class SendMail {
	public void method(String uname,String name,String password)
	{
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
 
		try {
 
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("mohammedharif63@gmail.com"));
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(name));
			message.setSubject("Welcome To Sterling Library");
			message.setText("Dear\t" +uname+"\n"+
					"\n Welcome..!!! Thank You for Registering with Sterling Library.  Have a Pleasant Stay."+
							"\n\n Please find your Credentials below for login to Sterling Library."
					+"\n\n\t\t UserName:\t"+uname+"\n\t\tPassword:\t"+password+"\n\t\tEmailId:\t"+name);
 
			Transport.send(message);
 
			System.out.println("Done");
 
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}
}