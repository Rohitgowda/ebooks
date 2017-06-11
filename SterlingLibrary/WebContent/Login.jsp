<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="css/style1.css" rel="stylesheet" type="text/css" />
<title>User Login</title>
<%@include file="Header.jsp" %>

<script type="text/javascript">

		function validate(){
		var username=document.form.userName.value;
		var password=document.form.password.value;
		if(username==""){
		 alert("Enter Username!");
		  return false;
		}
		if(password=="")
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
			<h2>Please Login<img src="images/hand.png" height="27px"></img></h2>
			<marquee behavior="alternate" direction="left" width="250px" scrolldelay="80">
				<marquee behavior="alternate" direction="down" height="20px" scrolldelay="80">
				<span class="popular">Log In!!</span></marquee></marquee>
		</div>
		<br></br>
 				<i><font size="2" color="green">
		
				${msg}
				
					<%
					
						request.getSession().removeAttribute("msg");
						
					%>
				</font></i>
				
<form id="form" name="form" action="LoginAction" method="post" >

				<br></br>
					
	 				<i><font size="2" color="green">
						<%
							if(request.getAttribute("success")!=null)
							  out.println(request.getAttribute("success"));
							  else
							  out.println("");
						%> 
					 </font></i>
	 				<i><font size="2" color="red">
				${message}
				${msg1}
						<%
						request.getSession().removeAttribute("message");
						request.getSession().removeAttribute("msg1");	
						%> 
	</font></i>
					 
				<br></br>
				
	  <h1>User Log in</h1>
	  <div class="inset">
		  <p>
		    <label for="username">UserName</label>
		    <input class="input" type="text" name="userName" id="userName" value="Username" onFocus="if(this.value=='Username')this.value='';" onBlur="if(this.value=='')this.value='Username';">
		  </p>
		  <p>
		    <label for="password">PASSWORD</label>
		    <input class="input" type="password" name="password" id="password" value="Password" onFocus="if(this.value=='Password')this.value='';" onBlur="if(this.value=='')this.value='Password';">
		  </p>
		 <!--  <p>
		    <input class="input" type="checkbox" name="remember" id="remember">
		    <label for="remember">Stay Signed In</label>
		  </p> -->
	  </div>
		  <p class="p-container">
		    <a href="ForgetPass.jsp">Forgot password ?</a>
		    <br></br>
		 	 <span>Not yet Registered!!</span> <a href="Register.jsp">Create an Account</a>
		 	 
			<br></br>
			<input class="input" type="reset" name="go" id="go" value="Reset">
		    <input class="input" type="submit" name="go" id="go" value="Log in" onclick="return validate();">
		    
		  </p>
</form>
<br></br>
</div>

</body>
</html>