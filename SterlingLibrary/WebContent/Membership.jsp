<%
		String url="";
		 if(session.getAttribute("username")==null)
			{

			 response.sendRedirect("Login.jsp");

			}
		 else
		 {%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="sl_membermaster.DBManager" %>
<%@page import ="java.io.*" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" media="screen" href="css/Button.css" />
<title>MemberShip</title>
<%@include file="Header.jsp" %>

<script type="text/javascript">

	
		function closeWin() 
		{
			   window.close();
		} 
		
		
		function check() {
			var r = document.getElementsByName("memoption")
			var memoption = -1

			for(var i=0; i < r.length; i++){
			   if(r[i].checked) {
				   memoption = i; 
				   window.onunload = function() 
					{
					    if (window.opener && !window.opener.closed) 
					    {
					    	
					        window.opener.popUpClosed();
					        window.close();
					    }
					   	
					};
			   }
			}
			if (memoption == -1) 
			{
				alert("Please select any payment option");
				
				return false;
			}
			//return true;
			
			}
		
		
	
</script>
</head>
<body bgcolor="#E8E8E8">
<div id="homemenu" align="center">
	
		<div id="menuheader" align="center">
			<h2>Welcome to Sterling Library<img src="images/hand.png" height="27px"></img></h2>
			<marquee behavior="alternate" direction="left" width="250px" scrolldelay="80">
			<marquee behavior="alternate" direction="down" height="20px" scrolldelay="80">
			<span class="popular"><b>Popular Books!!!</b></span></marquee></marquee>
		</div>
		<br></br>
		<%
		//HttpSession session=request.getSession();
		String user=(String)session.getAttribute("username");
		String password=request.getParameter("password");
		String email=request.getParameter("email");
		String mobile=request.getParameter("mobile");
		String address=request.getParameter("address");
		String city=request.getParameter("city");
		String pin=request.getParameter("pin");		
	%>
	
		<form id="form1" action="#" method="post" onsubmit="return check()">
		
		<input type="hidden" id="popupValue" name="username" value="<%=user%>"/>
       		 <input type="hidden" name="password" value="<%=password%>"/>
       		 <input type="hidden" name="email" value="<%=email%>"/>
       		 <input type="hidden" name="mobile" value="<%=mobile%>"/>
       		 <input type="hidden" name="address" value="<%=address%>"/>
       		 <input type="hidden" name="city" value="<%=city%>"/>
       		 <input type="hidden" name="pin" value="<%=pin%>"/>
       		 
			
          <br></br>
          
          <span>You can Extend Your Membership by Selecting any option</span>
          <br></br>
          <table width="600px" height="100px">
          <tr>
          <td>
	          	<!-- <table align="center">
					<tr>
						<td align="center"><img src="images/index1.jpg" width="45px" height="40px" /></td>
					</tr>
					<tr>
						<td><input type="radio" name="memoption" value="mem"/><span> Registration Fees: 100</span></td>				         			
					</tr>
				</table>	  
		</td>	
		<td> -->
				<table align="center">
				   	<tr>  		
						<td align="center"><img src="images/index1.jpg" width="45px" height="40px" /></td>
					</tr>
					<tr>
						<td><input type="radio" name="memoption" value="mem1"/><span> Monthly: 199</span></td>
				   	</tr>
				</table>
	   	</td>
	   	<td>
				<table>
		   			<tr>
						<td align="center"><img src="images/index1.jpg" width="45px" height="40px" /></td>
					</tr>
					<tr>
						<td><input type="radio" name="memoption" value="mem2"/><span> Half Yearly: 799</span></td>
					</tr>
				</table>	
		</td>
		<td>							          	
				<table>
					<tr>
						<td align="center"><img src="images/index1.jpg" width="45px" height="40px" /></td>
					</tr>
					<tr>
						<td><input type="radio" name="memoption" value="mem3"/><span> Yearly: 1299</span></td>
					</tr>
				</table>
		</td>
 	</tr>
</table>

     <br></br>
          <input type="submit" value="Payment" class="tableSubmitUpdatebutton" name="pay"/>
          <input type="button" value="Cancel" name="cancel" class="tableSubmitUpdatebutton" onclick="return closeWin();"/>
          </form>
          
         
         	<table>
				<tr>
				<td>
					<img src="images/Visa.png" width="30px" height="20px" />
					<img src="images/Maestro.png" width="30px" height="20px" />
					</td>
				</tr>
				<tr>
				<td>
					<img src="images/Mastercard.png" width="30px" height="20px" />
					<img src="images/PayPal.png" width="30px" height="20px" />
				</td>
				</tr>
			</table>
<br></br>
<br></br>
</div>
		
	
</body>
<%@include file="Footer.jsp" %>
</html>
<%}%>