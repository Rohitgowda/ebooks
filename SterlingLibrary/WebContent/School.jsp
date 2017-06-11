<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import="sl_membermaster.DBManager" %>
<%@ page import="java.io.*" %>   
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.*" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>School</title>
<link href="css/Button.css" rel="stylesheet" type="text/css" />
<link href="css/layout.css" rel="stylesheet" type="text/css" />
<link href="css/menu.css" rel="stylesheet" type="text/css" />
<%@include file="Header.jsp" %>
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
		</script>

</head>

<body>

	<div id="homemenu">
	
		<div id="menuheader" align="center">
			<h2>Welcome to Sterling Library<img src="images/hand.png" height="27px"></img></h2>
		</div>
		
		
			
			  <%
	 
					/* session.getAttribute("n");
			  
					String user=(String)session.getAttribute("n");
					out.println(user); */
					if(session.getAttribute("username")==null)
					{
								%>
									<form name="form" action="Login.jsp" method="post" >
									<table class="book_tabel">
								<%
								try{      
								Connection conn=null;
								 
								conn = DBManager.getConnection();
							    Statement stmt=conn.createStatement();
			       
			    	
						    	String strQuery = "select * from sl_bookmaster where cat_name='School'";
						        ResultSet rs = stmt.executeQuery(strQuery); 
						        int r=1;
						        String tr="</tr>";
						      
						        while(rs.next()){
						        	if(r%4==0)
						        	{
						        		r=1;
						      %>
							 		       
							 		 <tr>
							      			
							  <% 	} %>
								
								<td  width="300px" height="300px" align="center">
						    			
						     			<img src="ImageRetrieve?imgid=<%=rs.getInt("book_id")%>" width="150x" height="150px" />
						        
						    			<p align="left" class="para">Book Name: <span style="color:black"><%=rs.getString("book_name") %></span></p>
						       
										<p align="left" class="para">Category: <span style="color:black"><%=rs.getString("cat_name") %></span></p>
										
										<p align="left" class="para">Author: <span style="color:black"><%=rs.getString("book_author") %></span></p>
										
										<p align="left" class="para">Price: <span style="color:black"><%=rs.getString("book_price") %></span></p>
							  	
						      			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									  	
									  	<button class="button green">
											<div class="title">Add to cart</div>
											<div class="price">Rs.<%=rs.getString("book_price") %></div>
										</button>
								
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
								
					}
					
					else
					{
						%>
						</table></form>
						<form name="form" action="School.jsp" method="post" >
						<table class="book_tabel">
							<%
								try{      
							Connection conn1=null;
							 
							conn1 = DBManager.getConnection();
						    Statement stmt1=conn1.createStatement();
		       
		    	
					    	String strQuery = "select * from sl_bookmaster where cat_name='School'";
					        ResultSet rs1 = stmt1.executeQuery(strQuery); 
					        int r=1;
					        String tr="</tr>";
					      
					        while(rs1.next()){
					        	if(r%4==0)
					        	{
					        		r=1;
					      %>
						 		       
						 		 <tr>
						      			
						  <% 	} %>
							
								<td  width="300px" height="300px" align="center">
					    			
					     			<img src="ImageRetrieve?imgid=<%=rs1.getInt("book_id")%>" width="150x" height="150px" />
						        
						    			<p align="left" class="para">Book Name: <span style="color:black"><%=rs1.getString("book_name") %></span></p>
						       
						       			<p align="left" class="para">Category: <span style="color:black"><%=rs1.getString("cat_name") %></span></p>
						       			
										<p align="left" class="para">Author: <span style="color:black"><%=rs1.getString("book_author") %></span></p>
							   					
							   			<p align="left" class="para">Price: <span style="color:black"><%=rs1.getString("book_price") %></span></p>
					
					      				<a href="" onclick="window.open('PdfRetrieve?pdid=<%=rs1.getInt("book_id")%>','_blank')">Pdf Format</a>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									  	
									  	<button class="button green">
											<div class="title">Add to cart</div>
											<div class="price">Rs.<%=rs1.getString("book_price") %></div>
										</button>
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
						
						
					 }%>
					 </table>

		</form>
	</div>
	
</body>

<%@include file="Footer.jsp" %>

</html>