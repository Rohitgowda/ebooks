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
    <%@ page import="java.io.*" %>   
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<link rel="stylesheet" type="text/css" media="screen" href="css/styles.css" />
	<link rel="stylesheet" type="text/css" media="screen" href="css/Button.css" />
 <link rel="stylesheet" type="text/css" media="screen" href="css/admin.css" />
	<jsp:include page="home.jsp"></jsp:include>
	
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	
	<title>Admin Library</title>
<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 0);
	response.setHeader("Pragma", "no-cache");
	
	
%>
	
</head>

<body bgcolor="#D9D0D0">

		
		<%
		/* String url="";
		 if(session.getAttribute("username")==null)
			{

			 url="/index.jsp";

			}
		 else
		 { */
		 	request.getSession().removeAttribute("upsuccess");
		    request.getSession().removeAttribute("del");
			request.getSession().removeAttribute("mes");
			request.getSession().removeAttribute("e2");
			request.getSession().removeAttribute("d");
						%>
						<%
		
			
							try{
								Connection conn=null;
								 
								conn = DBManager.getConnection();
					         
						        Statement stmt=conn.createStatement();
						         
						        ResultSet rs1=stmt.executeQuery("select count(*),cat_name from sl_bookmaster group by cat_name");
						        
						         
				 %>
				 
				<div id="rightcategory">
				<div class="category" align="center"><u>Category</u></div>
					
					<%
								int in=0;
								int temp=0;
								while(rs1.next()) 
								{
					%>
					
							<div class="s" align="left"><a href="#"><%=rs1.getString(2)%><font color="#E3DEDE">(<%=rs1.getInt(1)%>)</font></a></div>
				
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
			
			
	<div id="homemenu">
			<div id="menuheader" align="center">
			<h2>Home Page<img src="images/hand.png" height="24px"></img></h2>
			<marquee behavior="alternate" direction="left" width="350px" scrolldelay="80">
			<marquee behavior="alternate" direction="down" height="25px" scrolldelay="80">
			<span class="popular"><b>Popular Category!!!</b></span></marquee></marquee>
			
		</div>
			<br></br>
			<br></br>
		
					<table>
						<tr>
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
				        	if(r%4==0)
				        		
				        	{
				        		r=1;
		     
				        		   %>
					 		       
					 		       <tr>
					      			
					      			<% 	} %>
							
								<td  width="300px" height="300px" align="center">
					    			
					     				
					        
										<img src="ImageRetrieve?imgid=<%=rs.getInt("book_id")%>" width="150x" height="150px" />
						        
						    			<p style="color:blue;">Name: <span style="color:green"><%=rs.getString("book_name") %></span></p>
						       
										<p style="color:blue;">Price: <span style="color:green"><%=rs.getString("book_price") %></span></p>
									
							  			<p style="color:blue;">Author: <span style="color:green"><%=rs.getString("book_author") %></span></p>
							   					
							   			<p style="color:blue;">Category: <span style="color:green"><%=rs.getString("cat_name") %></span></p>
						      							   					
										<a href="#" onclick="window.open('PdfRetrieve?pdid=<%=rs.getInt("book_id")%>')">Detail</a>
							
								</td>

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
			
			 </tr> 
			</table>
			<br></br>
			</div>
		
</body>
<%-- <jsp:include page="Footer.jsp"></jsp:include> --%>
<%@include file="Footer.jsp" %> 

</html>
<%} %>