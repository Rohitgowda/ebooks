<%@ page import="sl_membermaster.DBManager" %>
<%@page import ="java.io.*" %>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
function closeWin() 
{
	   window.close();
}
window.onunload = function() 
{
    if (window.opener && !window.opener.closed) 
    {
    	window.close();
        window.opener.popUpClosed();
        
    }
};

</script>
</head>
<body bgcolor="#E8E8E8">

	<%
	PrintWriter pw=response.getWriter();

	Statement stmt=null;
	ResultSet rs=null;
	
	try
	{
		session.getAttribute("n");
		Connection conn=null;
		 
		conn = DBManager.getConnection();
		stmt=conn.createStatement();
		HttpSession s=request.getSession();
		String user=(String)s.getAttribute("username");
		rs=stmt.executeQuery("select * from sl_membermaster where mem_username='"+user+"'");
		rs.next();
		String name=rs.getString(2);
		%>
		
		<form action="UpdateAddressAction" method="post">
		<table>
		
			<tr><td>UserName:</td><td><%=name %><input type="hidden" id="name" name="name" value="<%=name %>" readonly="readonly"/></td>
			<tr><td>Email:</td><td><input type="text" id="email" name="email" value="<%=rs.getString(3)%>"/></td></tr>
			<tr><td>Mobile Number:</td><td><input type="text" id="mobilenumber" name="mobilenumber" value="<%=rs.getString(5)%>"/></td></tr>
			<tr><td>Address</td><td><textarea rows="2" cols="20" id="address" name="address"><%=rs.getString(6)%></textarea></td></tr>
			<tr><td>City</td><td><input type="text" id="city" name="city" value="<%=rs.getString(7)%>"/></td></tr>
			<tr><td>Pin COde</td><td><input type="text" id="pin" name="pin" value="<%=rs.getString(8)%>"/></td></tr>
			
          
          </table>
          <br></br>
          <input type="submit" value="Update" name="Update" onclick="return function();"/>
          </form>


		<%
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}

	%>
	
</body>
</html>