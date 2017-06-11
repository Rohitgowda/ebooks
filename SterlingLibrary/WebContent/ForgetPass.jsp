<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import="sl_membermaster.DBManager" %>
<%@ page import="java.io.*" %>   
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.*" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Home Page</title>
<link rel="stylesheet" type="text/css" href="css/Button.css" />
<link href="css/layout.css" rel="stylesheet" type="text/css" />
<link href="css/menu.css" rel="stylesheet" type="text/css" />
<link href="css/style1.css" rel="stylesheet" type="text/css" />

<%@include file="Header.jsp" %>

<script type="text/javascript">

		function validate(){
		var username=document.form.userName.value;
		var email=document.form.email.value;
		if(username==""){
		 alert("Enter Username!");
		  return false;
		}
		if(email=="")
		{
		 alert("Enter Password!");
		  return false;
		}
		
		return true;
		}
</script>

</head>

<body>
	
	<div id="homemenu" align="center">
	
		<div id="menuheader" align="center">
			<h2>Forgot Password<img src="images/hand.png" height="27px"></img></h2>
			<marquee behavior="alternate" direction="left" width="250px" scrolldelay="80">
				<marquee behavior="alternate" direction="down" height="20px" scrolldelay="80">
				<span class="popular">Forgot Passord!!</span></marquee></marquee>
		</div>
		
	
<br></br>
 
 	<form id="form" name="form" action="ForgetPasswordAction" method="post" >

		<h1>Forgot Password?</h1>
		<label style="color:green;">Please Enter Registered username or E-mail to Get your Password</label>
	  <div class="inset">
		 		 <p>
		    		Registered UserName : <span>*</span>
	    			<input class="input" type="text" name="userName" value="Username" onFocus="if(this.value=='Username')this.value='';" onBlur="if(this.value=='')this.value='Username';"/>
				 </p>
				 <p>
				 	Registered Email : <span>*</span>
	    		<input class="input" type="text" name="email" value="E-Mail" onFocus="if(this.value=='E-Mail')this.value='';" onBlur="if(this.value=='')this.value='E-Mail';"/>
	    		<br></br>
				 </p>
		 		     
     			<p>
     			
     			<input class="input" type="reset" value="Reset" class="tableSubmitUpdatebutton"/>
    			<input class="input" type="submit" value="Send Me" onclick="return validate();"/>
    		
				</p>
				<br></br>
				</div>
				<i><font size="2" color="green">
					${msg1}
				</font></i>
 				<i><font size="2" color="red">
					<%
					
					 request.getSession().removeAttribute("msg1"); 
						if(request.getAttribute("m2")!=null)
						  out.println(request.getAttribute("m2"));
						  else
						  out.println("");
					%> 
				 </font></i>
 				<i><font size="2" color="red">
					<%
						if(request.getAttribute("message")!=null)
						  out.println(request.getAttribute("message"));
						  else
						  out.println("");
					%> 
				 </font></i>
				 <br></br>
				</form>
		
		<br></br>
		<br></br>
	</div>

</body>

<%@include file="Footer.jsp" %>
</html>

