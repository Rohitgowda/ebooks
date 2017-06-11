<%
		String url="";
		 if(session.getAttribute("username")==null)
			{

			 response.sendRedirect("index.jsp");

			}
		 else
		 {%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="sl_adminmaster.DBManager" %>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" type="text/css" media="screen" href="css/Button.css" />
<link rel="stylesheet" type="text/css" media="screen" href="css/admin.css" />

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="home.jsp"></jsp:include>
<title>update password</title>
<script type="text/javascript">

			function fnsubmit()
			{
				/*if(document.ChangePasswordForm.usrnme.value == "")
				{
					alert('Please Enter Username');
					document.ChangePasswordForm.usrnme.focus();
					return false;
				} */
			
				if(document.ChangePasswordForm.OldPassword.value == "")
				{
					alert('Please Enter old password');
					document.ChangePasswordForm.OldPassword.focus();
					return false;
				} 
			
				if(document.ChangePasswordForm.newpassword.value == "")
				{
					alert('Please Enter New Password');
					document.ChangePasswordForm.newpassword.focus(); 
					return false;
				} 
				
				if(document.ChangePasswordForm.conpassword.value == "")
				{
					alert('Please Enter Confirm Password');
					document.ChangePasswordForm.conpassword.focus(); 
					return false;
				} 
				
				if(document.ChangePasswordForm.newpassword.value != document.ChangePasswordForm.conpassword.value)
				{
					alert("New and Confirm Password Doesn't Not Match");
					document.ChangePasswordForm.conpassword.focus(); 
					return false;
				} 
				
				if(document.ChangePasswordForm.OldPassword.value == document.ChangePasswordForm.newpassword.value)
				{
					alert('Old Password and New Password should not be the same');
					document.ChangePasswordForm.newpassword.focus(); 
					return false;
				} 
			
			document.ChangePasswordForm.submit();
			}
</script>
<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 0);
	response.setHeader("Pragma", "no-cache");
	
	
%>
</head>

<body bgcolor="#D9D0D0">

	<div id="homemenu" align="center">
			<div id="menuheader" align="center">
			<h2>Change Password<img src="images/hand.png" height="24px"></img></h2>
			
		</div>
			
	<br></br>
	
	
	
	
			<i><font size=2 color="green">
			<%
			 request.getSession().removeAttribute("upsuccess");
		    request.getSession().removeAttribute("del");
			request.getSession().removeAttribute("mes");
			request.getSession().removeAttribute("e2");
			request.getSession().removeAttribute("d");
				if(request.getAttribute("message1")!=null)
					
				  out.println(request.getAttribute("message1"));
				  else
				  out.println("");
			%>
			</font></i>
			<i><font size=2 color="red">
			
			<%
				if(request.getAttribute("message2")!=null)
					
				  out.println(request.getAttribute("message2"));
				  else
				  out.println("");
			%>
			</font></i>
			
		<form name="ChangePasswordForm" action="ChangePasswordAction" method="post" OnSubmit="return fnsubmit();">
			
				<table border="0">
					
			<%
	PrintWriter pw=response.getWriter();

	Statement stmt=null;
	ResultSet rs=null;
	
	try
	{

		Connection conn=null;
		 
		conn = DBManager.getConnection();
		stmt=conn.createStatement();
		HttpSession s=request.getSession();
		String user=(String)s.getAttribute("username");
		rs=stmt.executeQuery("select * from sl_adminmaster where admin_username='"+user+"'");
		rs.next();
		String name=rs.getString(2);
		
		%>
		
					<tr><td>UserName:</td><td><%=name %><input type="hidden" id="name" name="name" value="<%=name %>"/></td>
					
		<%
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}

	%>
				
				<tr>
					<td>Old Password<span style="color:red">*</span></td>
					<TD><input name="OldPassword" type="password" id="OLDpwd" size="20"></td>
					</tr>
					<tr>
					<td>NewPassword<span style="color:red">*</span></td>
					<td><input name="newpassword" type="password" id="newpassword">
					</td>
					</tr>
					<tr>
					<td>Confirm Password<span style="color:red">*</span></td>
					<td><input name="conpassword" type="password" id="conpassword">
					</td>
					</tr>
					</table>
		<br></br>
					<input type="submit" name="Submit" value="Save" class="tableSubmitUpdatebutton" onclick="return fnsubmit();">
				
				
			</form>
<br></br>
	</div>
</body>
<%@include file="Footer.jsp" %>
</html>


<%}%>