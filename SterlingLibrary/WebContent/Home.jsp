<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ page import="sl_membermaster.DBManager" %>
<%@ page import="java.io.*" %>   
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.*" %>

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	
	<title>Sterling Library</title>
	
	<link href="css/Button.css" rel="stylesheet" type="text/css" />
	<link href="css/layout.css" rel="stylesheet" type="text/css" />
	<link href="css/menu.css" rel="stylesheet" type="text/css" />
	
	<%@include file="Header.jsp" %>
	
	<!-- <script src="http://code.jquery.com/jquery-1.9.1.js" type="text/javascript"></script> 
	 -->
	
	<script type="text/javascript">
			
		function buy(id){
			var r=confirm("Are you sure you want to Buy This Book?");
			if (r==true)
			{
				var f=document.form;
				f.method="post";
				f.action='BuyNow.jsp?id='+id;
				f.submit();
			}
		}
		function poup(url)
		{
		newwindow=window.open(url,'first','width=400,height=400,top=200,left=400');
		if(window.focus)
		{
			newwindow.focus();
		}
		return false;
		}			
	</script>
	
</head>

<body>

	<div id="homemenu">
	
		<div id="menuheader" align="center">
			<h2>Welcome to Sterling Library<img src="images/hand.png" height="27px"></img></h2>
			<marquee behavior="alternate" direction="left" width="250px" scrolldelay="80">
			<marquee behavior="alternate" direction="down" height="20px" scrolldelay="80">
			<span class="popular"><b>Popular Books!!!</b></span></marquee></marquee>
		</div>
		<br></br>
			
		<%
			request.getSession().removeAttribute("m2");
			request.getSession().removeAttribute("success");
			if(session.getAttribute("username")==null)
			{
		%>
		<form name="form" action="Login.jsp" method="post" >
				<table align="center">
							<%
								try{      
								Connection conn=null;
								 
								conn = DBManager.getConnection();
							    Statement stmt=conn.createStatement();
			       
							    String strQuery = "select * from sl_bookmaster";
						        ResultSet rs = stmt.executeQuery(strQuery); 
						        int r=1;
						        String tr="</tr>";
						      
						        while(rs.next()){
						        	if(r%5==0)
						        	{
						        		r=1;
						      %>
							 		       
							 		 <tr>
							      			
							  <% 	} %>
							 
								
									<td  width="300px" height="300px" align="center">
						    			<div style="border:solid 2px #dedede;">
						     			<img src="ImageRetrieve?imgid=<%=rs.getInt("book_id")%>" width="150x" height="150px" />
						        
						    			<p align="left" class="para">Book Name: <span style="color:black"><%=rs.getString("book_name") %></span></p>
						       
										<p align="left" class="para">Category: <span style="color:black"><%=rs.getString("cat_name") %></span></p>
										
										<p align="left" class="para">Author: <span style="color:black"><%=rs.getString("book_author") %></span></p>
										
										<%-- <p align="left" class="para">Price: <span style="color:black"><%=rs.getString("book_price") %></span></p> --%>
							  	
							  
									  	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									  	
									  	<button class="button green">
											<div class="title">Add to cart</div>
											<div class="price">Rs.<%=rs.getString("book_price") %></div>
										</button>
										
						      			<!-- <input type="submit" name="id" value="Buy Now" class="tableSubmitUpdatebutton" /> -->
								</div>
									</td>
						
						  
							     <%
							     r++; }
							     %>  </tr> 
							<% 
							conn.commit();
							   
								}
								catch(Exception e)
								{
								    e.getMessage();
								}
							%>
							</table>
							
							<div id="menuheader" align="center">
			<h2>New Arrivals<img src="images/hand.png" height="27px"></img></h2>
			<marquee behavior="alternate" direction="left" width="250px" scrolldelay="80">
			<marquee behavior="alternate" direction="down" height="20px" scrolldelay="80">
			<span class="popular"><b>New Arrivals!!!</b></span></marquee></marquee>
		</div>
		<br></br>
		<marquee behavior="alternate" direction="right" width="100%" scrolldelay="80" onMouseOver="this.stop();" onMouseOut="this.start();"> 
		
		<!-- <marquee behavior="alternate" direction="right" width="200px" scrolldelay="80"> -->
             
            
                    
                    
                    <%

							try{    
									Connection conn=null;
									
									conn = DBManager.getConnection();	
								  
								    Statement stmt=conn.createStatement();
					       
					    	
							    	String strQuery = "select * from sl_bookmaster ORDER BY book_id DESC limit 10";
							        ResultSet rs1 = stmt.executeQuery(strQuery); 
							        int r=1;
							        
							        
							        while(rs1.next())
							        {
							        	%>
													    			
								     				 <a href="BookDetail.jsp?id=<%=rs1.getInt("book_id")%>"><img src="ImageRetrieve?imgid=<%=rs1.getInt("book_id")%>" width="120x" height="120px"/> </a>
								        
								    			  <%-- 	<span style="color:blue;">Book Name: </span><span style="color:black"><%=rs.getString("book_name") %></span> --%>							       
								
												
					 <%
								 		
									}
									
									conn.commit();
									}
									catch(Exception e)
									{
										e.getMessage();
									}
								
			  		 %>
			  		 
			  		 
                   
                  
		</marquee>
		<br></br>
						
					<%}
					else
					{
					%>
					
					</form>
						 <form name="form" action="Home.jsp" method="post" >
						<table class="book_tabel"> 
						<%
							try{      
							Connection conn1=null;
							 
							conn1 = DBManager.getConnection();
						    Statement stmt1=conn1.createStatement();
		       
		    			    String strQuery = "select * from sl_bookmaster";
					        ResultSet rs2 = stmt1.executeQuery(strQuery); 
					        int r=1;
					        String tr="</tr>";
					      
					        while(rs2.next()){
					        	if(r%5==0)
					        	{
					        		r=1;
					      %>
						 		       
						 		 <tr>
						      			
						  <% 	} %>
							
								<td  width="350px" height="300px" align="center">
					    			<div style="border:solid 2px #dedede;">
					     				<img src="ImageRetrieve?imgid=<%=rs2.getInt("book_id")%>" width="150x" height="150px" />
						        
						    			<p align="left" class="para">Book Name: <span style="color:green"><%=rs2.getString("book_name") %></span></p>
						       
						       			<p align="left" class="para">Category: <span style="color:green"><%=rs2.getString("cat_name") %></span></p>
						       			
										<p align="left" class="para">Author: <span style="color:green"><%=rs2.getString("book_author") %></span></p>
							   					
							   			<%-- <p align="left" class="para">Price: <span style="color:green"><%=rs2.getString("book_price") %></span></p> --%>
						      			
						      			<a href="#" onclick="poup('PdfPurchase.jsp?id=<%=rs2.getString("book_id") %>', 'TEST!?', 800, 600)">Pdf format</a>
						      			<br/>

										&nbsp;&nbsp;&nbsp;&nbsp;	
										<button class="button green" onclick="buy(<%=rs2.getInt(1)%>);">
											<div class="title">Purchase</div>
											<div class="price">Rs.<%=rs2.getString("book_price") %></div>
										</button>
									<%-- <input type="button" name="id" value="Buy Now" class="tableSubmitUpdatebutton" onclick="buy(<%=rs2.getInt(1)%>);" /> --%>
								</br></div>
								</td>
					
					  
						     <%
						     r++; }
						     %>  </tr> 
						<% 
						conn1.commit();
						   
							}
							catch(Exception e)
							{
							    e.getMessage();
							}
						%>
						</table>
						<div id="menuheader" align="center">
							<h2>New Arrivals<img src="images/hand.png" height="27px"></img></h2>
							<marquee behavior="alternate" direction="left" width="250px" scrolldelay="80">
							<marquee behavior="alternate" direction="down" height="20px" scrolldelay="80">
							<span class="popular"><b>New Arrivals!!!</b></span></marquee></marquee>
						</div>
						<br></br>
						
			<marquee behavior="alternate" direction="right" scrolldelay="80" onMouseOver="this.stop();" onMouseOut="this.start();"> 
		
		<!-- <marquee behavior="alternate" direction="right" width="200px" scrolldelay="80"> -->
             
             
                    
                    
                    <%

							try{    
									Connection conn=null;
									
									conn = DBManager.getConnection();	
								  
								    Statement stmt=conn.createStatement();
					       
					    	
							    	String strQuery = "select * from sl_bookmaster ORDER BY book_id DESC limit 10";
							        ResultSet rs3 = stmt.executeQuery(strQuery); 
							        int r=1;
							        
							        
							        while(rs3.next())
							        {
							        	%>
													    			
								     			 <a href="BookDetail.jsp?id=<%=rs3.getInt("book_id")%>"><img src="ImageRetrieve?imgid=<%=rs3.getInt("book_id")%>" width="120x" height="120px"/></a>
								        
								    			  <%-- 	<span style="color:blue;">Book Name: </span><span style="color:black"><%=rs.getString("book_name") %></span> --%>							       
								
												
					 <%
								 		
									}
									
									conn.commit();
									}
									catch(Exception e)
									{
										e.getMessage();
									}
								
                    } %>
			  		 
			  		 
                 
                  
		</marquee>
		</form>
	
	<br></br>
	<br></br>
</div>

<%@include file="Footer.jsp" %> 
</body>

</html>