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
		 width: 60.60%;
		 float:left;
		height: 180px;
			 /*a width should be defined for transition to work*/
		border: 2px solid #ffc947;
		padding: 0px;
		margin-left:70px;
	}  
	

</style>


</head>
<body>

	  <%
	 
					session.getAttribute("n");
					String username=(String)session.getAttribute("n");
					if(session.getAttribute("username")==null)
					{
					
					%>
					
					<div id="header" >
					
					<div style="width:100%;">
					
						<div id="logo" style="float: left; width: 33.33%;">
							<img src="images/cooltext1327902814.png"></img>
						</div>
						
						<div style="float: left; width: 30.33%;">
						
							<form action="SearchAction.jsp" method="post" name="search">
									<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<span>
											<input class="in" id="s" type="text"  name="search_item" value="Search" onFocus="if(this.value=='Search'){this.value=''}" onBlur="if(this.value==''){this.value='Search'}">
											
											<input class="label" id="search submit"  class="btn" type="image" value="Go" name="search">
										</span>
									</p>
						</form> 
						</div>
						
						<div style="float: right; width: 32.05%;">
							<form action="LoginAction" method="post">
						        
						        <table border=0 cellpadding=5>
						         <tr><td style="background:url(images/h1_bg.jpg);border-radius:26px;">
						          <span class="text">
						          
						         
						          <input class="in1" type="text" name="userName" value="Username" onFocus="if(this.value=='Username')this.value='';" onBlur="if(this.value=='')this.value='Username';">
						          </span></td><td style="background:url(images/h1_bg.jpg);border-radius:26px;"><span class="text">
						         
						          <input class="in1" type="password" name="password" value="Password" onFocus="if(this.value=='Password'){this.value=''}" onBlur="if(this.value==''){this.value='Password'}">
						          </span></td>
						          <td>
						          
						          <input class="header" type="submit" value="Login">  <span class="links">
						               <a href="Register.jsp"> <button class="header" type="button">Register</button></a>  
						          </span></td><tr>
						         <td></td><td align="center"><a href="ForgetPass.jsp"><font color="white" size="1px">Forgot Password?</font></a> </td><td></td></tr>
						          </table>
						        
						      </form>
						</div> 
						<br style="clear: left;" />
					</div>
									     
									     
								<div id="header_img">
								
								<div style="width:100%;">
								
								 <div style="float:left;margin-left:30px;">
									<img src="images/d1.jpg" style="height:150px; width:150px; "/>
								
								</div>
								<div id="fade">
								
      
										      <img src="images/header19.jpg" height="180px" width="800px">
										      <img src="images/header15.jpg" height="180px" width="800px">
										      <img src="images/header22.jpg" height="180px" width="800px">
										      <img src="images/header21.jpg" height="180px" width="800px">
										      <img src="images/header.jpg" height="180px" width="800px">
										      <img src="images/header2.jpg" height="180px" width="800px">
										      <img src="images/header7.jpg" height="180px" width="800px">
										      <img src="images/header4.jpg" height="180px" width="800px">
										      <img src="images/header5.jpg" height="180px" width="800px">
										      <img src="images/header20.jpg" height="180px" width="800px">
										      <img src="images/header12.jpg" height="180px" width="800px">
										      <img src="images/header16.jpg" height="180px" width="800px">
										      <img src="images/header17.jpg" height="180px" width="800px">
										      <img src="images/header_img.jpg" height="180px" width="800px">
										       <img src="images/index.jpeg" height="180px" width="800px">
										     
 
   									 
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
						
						<div id="content">
     
     
     <div id="content_left">  
     <h3><font color="#E06F6F">LIBRARY CATALOGUE</font></h3>
		<div class="content_left_section">
            	
            	
            	<marquee behavior="alternate" style="position:relative; height:500px;" direction="up" class="images" onMouseOver="this.stop();" onMouseOut="this.start();">
                <ul>
                  
                   
                    <li><a href="#">
                    
                    
                    <%

							try{    
									Connection conn=null;
									
									conn = DBManager.getConnection();	
								  
								    Statement stmt=conn.createStatement();
					       
					    	
							    	String strQuery = "select * from sl_bookmaster";
							        ResultSet rs = stmt.executeQuery(strQuery); 
							        int r=1;
							        String tr="</tr>";
							        
							        while(rs.next())
							        {
							        	if(r%4 ==0)
							        		
							        	{
							        		
							        		r=1;
					%>
									<% 	} %>
																    			
								     				<a href="BookDetail.jsp?id=<%=rs.getInt("book_id")%>"><img src="ImageRetrieve?imgid=<%=rs.getInt("book_id")%>" width="120x" height="120px"/>
								        
								    			  	<p style="color:green;font-size:14px;">Book Name: <span style="color:green"><%=rs.getString("book_name") %></span></p>	</a>						       
								
					 <%
								 		r++;
									}
									
									conn.commit();
									}
									catch(Exception e)
									{
										e.getMessage();
									}
								
			  		 %>
			  		 
			  		 
                    </a></li>
                  
            	</ul>
            	</marquee>
            </div>
    	 </div> 

</div>
						
					<%
					}
					else
					{
						%>
						<div id="header">
			<div style="width:100%;">
					
						<div id="logo" style="float: left; width: 33.33%;">
							<img src="images/sterling-logo.png"></img>
						</div>
						
						<div style="float: left; width: 33.33%;">
						
							<form action="SearchAction.jsp" method="post" name="search">
									<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<span>
											<input class="in" id="s" type="text"  name="search_item" value="Search" onFocus="if(this.value=='Search'){this.value=''}" onBlur="if(this.value==''){this.value='Search'}">
											
											<input class="label" id="search submit"  class="btn" type="image" value="Go" name="search">
										</span>
									</p>
						</form> 
						</div>
						
						<div id="text">
							<font color="#E9E3E3">
		 					 
								  <%
								out.print("Hello,"+session.getAttribute("username")+" /");
			%>
				</font><span class="links">
						               <a href="Logout.jsp"> <button class="header" type="button">Logout</button></a>  
						          </span>
			    
			       			
				
						</div> 
						<br style="clear: left;" />
					</div>
		
		 	
		 	
					
							
					<div id="header_img">
								
								<div style="width:100%;">
								
								 <div style="float:left;margin-left:30px;">
									<img src="images/d1.jpg" style="height:150px; width:150px; "/>
								
								</div>
								<div id="fade">
								
      
										      <img src="images/header19.jpg" height="180px" width="800px">
										      <img src="images/header15.jpg" height="180px" width="800px">
										      <img src="images/header22.jpg" height="180px" width="800px">
										      <img src="images/header21.jpg" height="180px" width="800px">
										      <img src="images/header.jpg" height="180px" width="800px">
										      <img src="images/header2.jpg" height="180px" width="800px">
										      <img src="images/header7.jpg" height="180px" width="800px">
										      <img src="images/header4.jpg" height="180px" width="800px">
										      <img src="images/header5.jpg" height="180px" width="800px">
										      <img src="images/header20.jpg" height="180px" width="800px">
										      <img src="images/header12.jpg" height="180px" width="800px">
										      <img src="images/header16.jpg" height="180px" width="800px">
										      <img src="images/header17.jpg" height="180px" width="800px">
										      <img src="images/header_img.jpg" height="180px" width="800px">
										       <img src="images/index.jpeg" height="180px" width="800px">
										      <img src="images/image5.jpeg" width="300" height="300">
										      <img src="images/image6.jpeg" width="300" height="300">
 
   									 
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
		

						<div id='cssmenu'>
							 <ul>
						<li><a href='Home.jsp'><span>Home</span></a></li>
						   <li><a href='Contactus.jsp'><span>Contact Us</span></a> </li>
						    <li><a href='AboutUs.jsp'><span>About Us</span></a></li>
						   <li class='has-sub'><a href='#'><span>Category</span></a>
						      <ul>
						      
					<%		
         				try{
								Connection conn=null;
								 
								conn = DBManager.getConnection();
					          
					            Statement stmt=conn.createStatement();
					         
					            ResultSet rs1=stmt.executeQuery("select count(*),cat_name from sl_bookmaster group by cat_name");
					           
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
						   <li class='has-sub'><a href='#'><span>Member Area</span></a>
						   	 <ul>
							         <li class='last'><a href="Changepassword.jsp"><span>Change Password</span></a></li>
							         <li class='last'><a href="MemBenefits.jsp"><span>Benefits</span></a></li>
							         <li class='last'><a href="MemDiscount.jsp"><span>Discount</span></a></li>
							         <li class='last'><a href="Membership.jsp"><span>Extend Membership</span></a></li>
							 </ul>
						   
						   </li>
						
   			
						</ul>
		 				
				</div>
						
						<div id="content">
     
     
     <div id="content_left">  
     <h3><font color="#E06F6F">LIBRARY CATALOGUE</font></h3>
		<div class="content_left_section">
            	
            	
            	<marquee behavior="alternate" style="position:relative; height:500px;" direction="up" class="images" onMouseOver="this.stop();" onMouseOut="this.start();">
                <ul>
                  
                   
                    <li><a href="#">
                    
                    
                    <%

							try{    
									Connection conn=null;
									
									conn = DBManager.getConnection();	
								  
								    Statement stmt=conn.createStatement();
					       
					    	
							    	String strQuery = "select * from sl_bookmaster";
							        ResultSet rs = stmt.executeQuery(strQuery); 
							        int r=1;
							        String tr="</tr>";
							        
							        while(rs.next())
							        {
							        	if(r%4 ==0)
							        		
							        	{
							        		
							        		r=1;
					%>
									<% 	} %>
																    			
								     				<a href="BookDetail.jsp?id=<%=rs.getInt("book_id")%>"><img src="ImageRetrieve?imgid=<%=rs.getInt("book_id")%>" width="120x" height="120px"/>
								        
								    			  	<p style="color:green;font-size:14px;">Book Name: <span style="color:green"><%=rs.getString("book_name") %></span></p>	</a>						       
								
					 <%
								 		r++;
									}
									
									conn.commit();
									}
									catch(Exception e)
									{
										e.getMessage();
									}
								
			  		 %>
			  		 
			  		 
                    </a></li>
                  
            	</ul>
            	</marquee>
            </div>
    	 </div> 

</div>
						
					 <%}%>
					 
					 

			<%		
         		try{
								Connection conn=null;
								 
								conn = DBManager.getConnection();
					          
					            Statement stmt=conn.createStatement();
					         
					            ResultSet rs1=stmt.executeQuery("select count(*),cat_name from sl_bookmaster group by cat_name");
					           
				 %>
			 
					<div id="rightcategory">
					<div class="category" align="center"><img src="images/categories.jpg" width="100px" height="50px"/></div>
					<%
								int in=0;
								int temp=0;
								while(rs1.next()) 
								{
					%>
				
						<div class="s" align="left"><a href="<%= rs1.getString(2)%>.jsp"><%= rs1.getString(2)%><font color="red">(<%=rs1.getInt(1)%>)</font></a></div>
			
					<%
								}
								conn.commit();
								}
								
								catch(Exception e)
								{
								e.printStackTrace();
								}
		
				%>
				</div>
   
   </body>
</html>