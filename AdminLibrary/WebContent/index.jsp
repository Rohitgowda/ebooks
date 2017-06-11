<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" media="screen" href="css/Button.css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Admin Elibrary</title>
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
<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 0);
	response.setHeader("Pragma", "no-cache");
	
	
%>
</body>

<div class="login" align="center">
	<div class="titulo">Admin Login</div>
	<i><font size="2" color="red">
				${message}
						<%
						request.getSession().removeAttribute("message");
							
						%> 
	</font></i>
	
	<form name="form" action="LoginAction" method="post" onsubmit="return validate();" >
    	<input type="text" required title="Username Required" name="userName" placeholder="Username">
        <input type="password" required title="Password Required" name="password" placeholder="Password" >
       <!-- <div class="olvido">
        	
            <div class="col"><a href="#" title="Recuperar Password">Forgot Password?</a></div>
        </div>  -->
        <br></br>
        <br></br>
         
		<input type="reset" value="Reset" class="enviar">
       <input type="submit" value="Sign In" class="enviar">
    </form>
</div>

</body>
</html>
