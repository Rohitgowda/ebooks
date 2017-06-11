<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="css/style1.css" rel="stylesheet" type="text/css" />
<!-- <link href="css/layout.css" rel="stylesheet" type="text/css" />
<link href="css/menu.css" rel="stylesheet" type="text/css" /> -->
<title>Register Here</title>
<%@include file="Header.jsp" %>
<script type="text/javascript">
	function check(value){ 
	xmlHttp=GetXmlHttpObject()
	var url="AvailableAction";
	url=url+"?name="+value;
	xmlHttp.onreadystatechange=stateChanged 
	xmlHttp.open("post",url,true)
	xmlHttp.send(null)
	}
	function stateChanged(){ 
	if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){ 
	    var showdata = xmlHttp.responseText; 
	    document.getElementById("mydiv").innerHTML= showdata;
	    } 
	}
	function GetXmlHttpObject(){
	var xmlHttp=null;
	try{
	  xmlHttp=new XMLHttpRequest();
	 }
	catch (e) {
	 try {
	  xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
	  }
	 catch (e){
	  xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
	  }
	 }
	return xmlHttp;
	}
</script>
<script type="text/javascript">

		function validate(){
			
		var username=document.form.username.value;
		var password=document.form.password.value;
		var address=document.form.address.value;
		var email=document.form.email.value;
		var mobile=document.form.mobile.value;
		var city=document.form.city.value;
		var pin=document.form.pin.value;
		if(username==""){
			 alert("Enter Username!");
			 form.username.focus();
			 return false;
		}
		re = /^\w+$/; 
		if(!re.test(form.username.value)) 
		{ 
			alert("Username must contain only letters, numbers and underscores!"); 
			form.username.focus(); 
			return false; 
		} 
		
		if(form.password.value != "" && form.password.value == form.password1.value) 
		{ 
			
			if(form.password.value == form.username.value) 
			{ 
				alert("Password must be different from Username!"); 
				form.password.focus(); 
				return false; 
			} 
			/*
			if(form.password.value.length < 6) 
			{ 
				alert("Password must contain at least six characters!"); 
				form.password.focus(); 
				return false; 
			} 
			re = /[0-9]/; 
			if(!re.test(form.password.value)) 
			{
				alert("password must contain at least one number (0-9)!"); 
				form.password.focus(); 
				return false; 
			}
			re = /[a-z]/; 
			if(!re.test(form.password.value)) 
			{ 
				alert("password must contain at least one lowercase letter (a-z)!"); 
				form.password.focus(); 
				return false; 
			} 
			re = /[A-Z]/; 
			if(!re.test(form.password.value)) 
				{ 
					alert("password must contain at least one uppercase letter (A-Z)!"); 
					form.password.focus();
					return false; 
				} */
		} 
		else 
		{ 
			alert("Password And Confirm Password Doesn't match!"); 
			form.password.focus(); 
			return false; 
		}
		
		if(form.email.value=="")
		{
		 alert("Enter Enter Your E-mail Id!");
		 form.email.focus();
		  return false;
		}
		else
			{
			var x=document.forms["form"]["email"].value;
		var atpos=x.indexOf("@");
		var dotpos=x.lastIndexOf(".");
		if (atpos<1 || dotpos<atpos+2 || dotpos+2>=email.length)
		  {
		  alert("Not a valid e-mail address");
		  return false;
		  }
			}
		
		if(form.mobile.value=="")
		{
			alert("Please Enter Your Mobile Number");
			 
			 form.mobile.focus();
			  return false;
	
		}
		
		else
			{ 
			/* var phoneno =   
			  if((inputtxt.value.match(phoneno))  
			        {  
			      return true;  
			        }  
			      else  
			        {  
			        alert("message");  
			        return false;  
			        }   */
			       
		  reg =/^\d{10}$/;
			if(!reg.test(form.mobile.value)) 
			{
				alert("Enter the valid Mobile Number(Like : 1234567899)!"); 
				form.mobile.focus(); 
				return false; 
			}
		}

		
		if(form.address.value=="")
		{
		 alert("Please Enter Your Address!");
		 form.address.focus();
		  return false;
		}
		/* else
			{
			re = /[a-z][A-Z]/; 
			if(!re.test(form.address.value)) 
			{ 
				alert("Address must contain proper name!"); 
				form.address.focus(); 
				return false; 
			} 
			} */
		if(form.city.value=="")
		{
		 alert("Enter city!");
		 form.city.focus();
		  return false;
		}
		else
			{
			re = /[A-Z][a-z]/; 
			if(!re.test(form.city.value)) 
			{ 
				alert("City must contain proper name[Like: Bangalore]!"); 
				form.city.focus(); 
				return false; 
			}
			}
		if(form.pin.value=="")
		{
			 alert("Please Enter Your Zip Code!");
			 form.pin.focus();
			  return false;
		}
		else
		{
			re = /[0-9]/; 
			if(!re.test(form.pin.value)) 
			{ 
				alert("Zip Code must contain Your area code!"); 
				form.pin.focus(); 
				return false; 
			}
		}
		if(!this.form.checkbox.checked)
		{
		    alert('You must agree to the terms and conditions first.');
		    return false;
		}

		return true;
		}
		
		
		 function change()
			{
					
					if(isNaN(form.mobile.value))
							{
							
							form.mobile.focus();
							
							form.mobile.value="";
							alert("Mobile Number should be numeric value");
							return false;
							}	
					
				}

		 function change1()
			{
					
					if(isNaN(form.pin.value))
							{
							
							form.pin.focus();
							
							form.pin.value="";
							alert("Zip code should be numeric value");
							return false;
							}	
					
				}
		function popUpClosed() 
		{
		    window.location.reload();
		}
		function parent_disable() 
		 {
			 if(popupWindow && !popupWindow.closed)
			 popupWindow.focus();
		 }
		
		function LaunchPopup(page,width,height) {
			a=document.form.username.value;
			b=document.form.password.value;
			c=document.form.email.value;
			d=document.form.mobile.value;
			e=document.form.address.value;
			f=document.form.city.value;
			g=document.form.pin.value;
			
			//alert("as");
			b="?name="+a+"&password="+b+"&email="+c+"&mobile="+d+"&address="+e+"&city="+f+"&pin="+g;
			

			popupWindow = this.open(page+b, "CtrlWindow", "top=200,left=200,toolbar=no,menubar=no,location=no, scrollbars=yes,resizable=yes, dependent=no,directories=no, width=" + width + ",height=" + height + ",x=50,y=50");
		}
		
		
		
</script>
</head>
<body>
<div id="homemenu" align="center">
	
		<div id="menuheader" align="center">
			<h2>Register<img src="images/hand.png" height="27px"></img></h2>
			<marquee behavior="alternate" direction="left" width="250px" scrolldelay="80">
				<marquee behavior="alternate" direction="down" height="20px" scrolldelay="80">
				<span class="popular">Register Here!!</span></marquee></marquee>
		</div>
	<br></br>
	
				
<form id="form" name="form" action="Register.jsp" method="post">
		
<br></br>
				
  <h1>Register</h1>
  
  				<i><font size="2" color="red">
					${m2}
						<%
							 /*  request.getSession().removeAttribute("m2");   */
						%>
						
				</font></i>
				 
  <div class="inset">
  <p>
    <label for="userName">USERNAME</label>
    <input class="input" type="text" name="username" id="username" onkeyup="check(this.value);"><font color="red"><span id="mydiv"><br/></span></font>
  </p>
  <p>
    <label for="password">PASSWORD</label>
    <input class="input" type="password" name="password" id="password">
  </p>
  <p>
    <label for="password">CONFIRM PASSWORD</label>
    <input class="input" type="password" name="password1" id="password1">
  </p>
  <p>
    <label for="EMAIL">EMAIL</label>
    <input class="input" type="email" name="email" id="mail">
  </p>
  <p>
    <label for="mobile">MOBILE NUMBER</label>
    <input class="inp" type="text" name="mobile" id="mobile" onkeyup="change()">
  </p>
  <p>
    <label for="address">ADDRESS</label>
    <textarea class="textarea" rows="3" cols="18" name="address" id="addr"></textarea>
  </p>
  <p>
    <label for="City">CITY</label>
    <input class="inp" type="text" name="city" id="city"/>
  </p>
  <p>
    <label for="pin">ZIP CODE</label>
    <input class="inp" type="text" name="pin" id="pin" onkeyup="change1()"/>
  </p>
  <p>
    <!-- <input class="input" type="checkbox" name="checkbox" value=""/> Accept these<a href="#"><span>Terms and Conditions</span></a> -->
  </p>
  <p>
  <input class="input" type="checkbox" name="checkbox" value=""/> Please read the <a href="#"><span>Membership Plans</span></a><span> and </span> <a href="#"><span>Terms and Conditions</span></a>
  </p>
  <br></br>
  <p class="p-container">
	
	<input class="input" type="reset" name="go" id="go" value="Reset">
    <input class="input" type="button" name="go" id="go" value="Register" onclick="if(validate()) LaunchPopup('RegisterFee.jsp','900','400');">
    
  </p>
  </div>
</form>


<i><font size="2" color="green">
		
				${success}
				<%
							 /* request.getSession().removeAttribute("success");  */
						%>
				</font></i>
				<br></br>
</div>

</body>

<%@include file="Footer.jsp" %>

</html>


