<%
	
		 if(session.getAttribute("username")==null)
			{
				 response.sendRedirect("index.jsp");
			}
		 else
		 {%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 0);
	response.setHeader("Pragma", "no-cache");
	
	
%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link href="css/footer.css" rel="stylesheet" type="text/css" />
</head>
<body>
<% 
	GregorianCalendar currentDate=new GregorianCalendar();
	int currentyear=currentDate.get(Calendar.YEAR);
%>
<div id="footer">
    <a href="Admin.jsp">Home</a> | 
    <a href="ContactUs.jsp">Contact Us</a> | 
    <a href="Admin.jsp">Sterling Library Books</a> | 
    <a href="#">New Released Books</a> | 
    <a href="#">Live Chat</a> | 
    <a href="#">SEO</a><br />
    <a href="#"><strong><i>Copyright <%=currentyear%>@ Sterling Technologies</i></strong></a>
</div> 
	

</body>
</html>
<%}%>