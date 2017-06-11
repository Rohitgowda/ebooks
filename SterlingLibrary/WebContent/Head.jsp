<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="sl_membermaster.DBManager" %>
  
<%@ page import="java.io.*" %>   
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="css/layout.css" rel="stylesheet" type="text/css" />
<link href="css/menu.css" rel="stylesheet" type="text/css" />
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/Button.css" rel="stylesheet" type="text/css" />
<link href="css/style1.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/cycle-plugin.js"></script>
<!--  <script src="js/jquery-1.4.1.min.js" type="text/javascript"></script> -->
<script src="js/jquery.jcarousel.pack.js" type="text/javascript"></script>
 <script src="js/jquery-func.js" type="text/javascript"></script>
 

	<script type="text/javascript">
	$(document).ready(function(){
	
	$('#fade').cycle();
	});


function pop(url){
			popupWindow=window.open(url,'titlebar=no,location=no,status=yes,menubar=no,height=130,width=200,top=200,left=400');
			if(window.focus)
			{
				popupWindow.focus();
			}
			return false;
			 
		}
</script>
<style type="text/css">

	#fade
	{
		 width: 100%;
		 float:left;
		height: 180px;
			 /*a width should be defined for transition to work*/
		/* border: 2px solid #ffc947; */
		padding: 0px;
		margin-left:70px;
	}  
	.header_resize {
	margin:0 auto;
	padding:0;
	width:100%;
	height:50%;
	/* background:url(../css/images/background.jpg)repeat-x left top; */
}

</style>


</head>
<body>

	  <%-- <%
	 
					session.getAttribute("n");
					String username=(String)session.getAttribute("n");
					if(session.getAttribute("username")==null)
					{
					
					%> --%>
					
					<div id="header" >
					<div class="header_resize" >
					<!-- <div style="width:100%;"> -->
					
						<div id="logo" style="float: left; ">
							<img src="images/sterling-logo.png" width="100%" height=""></img>
						</div>
						
					 <div style="float: left;">
						
							<form style="float: center;padding:10px 0 0 35px;" action="SearchAction.jsp" method="post" name="search">
									<p><!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
										<span>
											<input class="in" id="s" type="text"  name="search_item" value="Search" onFocus="if(this.value=='Search'){this.value=''}" onBlur="if(this.value==''){this.value='Search'}">
											
											<input class="label" id="search submit"  class="btn" type="image" value="Go" name="search">
										</span>
									</p>
						</form> 
						</div>
						
					<!-- 	<div style="float: right; "> -->
							<form style="float: right;padding:10px 0 0 35px;" action="LoginAction" method="post">
						        
						        <table border=0 cellpadding=5 >
						         <tr><td width="35%" style="background:url(images/h1_bg.jpg);border-radius:26px;">
						          <span class="text">
						          
						         
						          <input class="in1" type="text" name="userName" value="Username" onFocus="if(this.value=='Username')this.value='';" onBlur="if(this.value=='')this.value='Username';">
						          </span></td><td width="35%" style="background:url(images/h1_bg.jpg);border-radius:26px;"><span class="text">
						         
						          <input class="in1" type="password" name="password" value="Password" onFocus="if(this.value=='Password'){this.value=''}" onBlur="if(this.value==''){this.value='Password'}">
						          </span></td>
						          <td>
						          
						          <input class="header" type="submit" value="Login">  <span class="links">
						               <a href="Register.jsp"> <button class="header" type="button">Register</button></a>  
						          </span></td><tr>
						         <td></td><td align="center"><a href="ForgetPass.jsp"><font color="white" size="1px">Forgot Password?</font></a> </td><td></td></tr>
						          </table>
						        
						      </form>
						<!-- </div>  -->
						<br style="clear: left;" />
					</div>
									     
									     
								<div id="header_img">
								
								<div style="width:100%;">
								
								 <div style="float:left;margin-left:30px;">
									<img src="images/d1.jpg" style="height:150px; width:150px; "/>
								
								</div>
								<div style="margin:0 auto;padding:10px 10px;">
								<div id="fade">
								
      
										      <img src="images/header19.jpg" height="180px" width="100%">
										      <img src="images/header15.jpg" height="180px" width="100%">
										      <img src="images/header22.jpg" height="180px" width="100%">
										      <img src="images/header21.jpg" height="180px" width="100%">
										      <img src="images/header.jpg" height="180px" width="100%">
										      <img src="images/header2.jpg" height="180px" width="100%">
										      <img src="images/header7.jpg" height="180px" width="100%">
										      <img src="images/header4.jpg" height="180px" width="100%">
										      <img src="images/header5.jpg" height="180px" width="100%">
										      <img src="images/header20.jpg" height="180px" width="100%">
										      <img src="images/header12.jpg" height="180px" width="100%">
										      <img src="images/header16.jpg" height="180px" width="100%">
										      <img src="images/header17.jpg" height="180px" width="100%">
										      <img src="images/header_img.jpg" height="180px" width="100%">
										       <img src="images/index.jpeg" height="180px" width="100%">
										     
 
   									 
								</div>
								</div>
								<div style="float: left;width:10%;margin-left:110px;margin-top:40px;">
								<span style="color:white">Like us on:</span><br>
					      <a href="http://www.facebook.com" onclick="return pop('http://www.facebook.com')"><img src="images/facebook.jpg" height="30px" width="30px"></a>
					     <a href="http://www.linkedin.com" onclick="return pop('http://www.linkedin.com')"><img src="images/linkedin.jpg" height="30px" width="30px"></a>	
					     <a href="http://www.twitter.com" onclick="return pop('http://www.twitter.com')"><img src="images/twitter.jpg" height="30px" width="30px"></a>
								</div> 
								<br style="clear: left;" />
							</div>	
							
					   </div>
								
						</div>	
						
					</div>
					
					   <div id='cssmenu'>
							 <ul>
							   <li><a href='Home.jsp'><span>Home</span></a></li>
							   <li><a href='Contactus.jsp'><span>Contact Us</span></a>
							      
							   </li>
							   <li><a href='AboutUs.jsp'><span>About Us</span></a></li>
							   <li class='has-sub'><a href='#'><span>Category</span></a>
							       <ul>
						       


									
									<%		
         		try{
								Connection conn=null;
								 
								conn = DBManager.getConnection();
					          
					            Statement stmt=conn.createStatement();
					         
					            ResultSet rs1=stmt.executeQuery("select count(*),cat_name from sl_bookmaster group by cat_name limit 8");
					           
				 %>
			 
						
					<%
								int in=0;
								int temp=0;
								while(rs1.next()) 
								{
					%>
				
						 <li class='last'><a href="<%= rs1.getString(2)%>.jsp"><%= rs1.getString(2)%></a></li>
			
					<%
								}
								conn.commit();
								}
								
								catch(Exception e)
								{
								e.printStackTrace();
								}
		
				%>
										        						      </ul>
							   </li>
							   <li><a href='Register.jsp'><span>Register</span></a></li>
							   
							</ul>
						</div>
						
						
						
					
   
   </body>
</html>