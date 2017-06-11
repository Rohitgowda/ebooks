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
<%@page import="java.sql.*"%>
<%@page import="java.io.PrintWriter"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" type="text/css" media="screen" href="css/Button.css" />

<link rel="stylesheet" type="text/css" media="screen" href="css/admin.css" />

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" media="screen" href="css/DatePicker.css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="home.jsp"></jsp:include>
<title>Order Details</title>

<!-- <script type="text/javascript" src="jquery/jquery.simple-dtpicker.js"></script> -->
<script type="text/javascript" src="jquery/DatePicker.js"></script>
<script type="text/javascript" language="javascript">
		


		checked=false;
		function checkedAll (f) {
			var form= document.getElementById('f');
			 if (checked == false)
		          {
		           checked = true;
		          }
		        else
		          {
		          checked = false;
		          }
			for (var i =0; i < form.elements.length; i++) 
			{
				form.elements[i].checked = checked;
			}
		      }
	   
</script>
<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 0);
	response.setHeader("Pragma", "no-cache");
	
	
%>
</head>
<body bgcolor="#D9D0D0">

<div id="homemenu1" align="center">
	
	<div id="menuheader1" align="center">
			<h2>Order Details<img src="images/hand.png" height="27px"></img></h2>
	</div>
	<br><br><br>		
<form name="form" action="Orderdetails.jsp" method="post" >
 	
 	 
 	
 	
	 	 <table border="10">
	 	 	<tr>
	 	 		<td>
	 	 			<b>Start Date:</b> <input class="input" type="text" name="sdate" id="startdate" size="25" readonly onClick="getDate(this);">
	 	 			
	 	 		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	 	 			<b> End Date:</b> <input class="input" type="text" name="edate" id="enddate" size="25" readonly onClick="getDate(this);"/>
	 	 		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	 	 			 <b>Username:</b>  <input class="input" type="text" name="username" id="user-name" size="25" />
	 	 			 
	 	 			  				<%
	 	 			  			
						       	 		String s = request.getParameter("sdate");
	 	 								String end = request.getParameter("edate");
	 	 								String user = request.getParameter("username");
	 	 			  		
						       		 %>
						       		 
						        <script>
						       		 document.getElementById("startdate").value = '<% if(s!=null)out.print(s);else out.print(""); %>';
						       		document.getElementById("enddate").value = '<% if(end!=null)out.print(end);else out.print(""); %>';
						       		document.getElementById("user-name").value = '<% if(user!=null)out.print(user);else out.print(""); %>';
						        </script> 
	 	 		</td>
	 	 	</tr>
	 	 </table>
	
 		
		  <br>    
		         	 	<!-- <div class="enddate" align="right"> -->
 	
		
			<input type="submit" value="Search" class="tableSubmitUpdatebutton"/>
		
</form>
			
			
		<br></br>
	
			
			<marquee behavior="alternate" direction="left" width="250px" scrolldelay="80">
			<marquee behavior="alternate" direction="down" height="20px" scrolldelay="80">
			<span class="popular"><b>View Orders!!!</b></span></marquee></marquee>	
					
<form id="f" action="OrderDeleteAction" method="get">
			 <i><font size=2 color="green">
	 				${d}
				
						<%
						
							 request.getSession().removeAttribute("d"); 
							
						%>
			 			
						</font></i>
		<table class="myTable" id="dataTable" align="center" border="10" >
				<tr bgcolor="#808080">
								
								
						<th>Sl. NO</th>
						<th>Select All<input type="checkbox" name="checkall" onclick='checkedAll(f);'/></th>
						<th>Order Date</th>
						<th>Order By</th>
						<th>Order Book</th>
						<th>Order Category</th>
						<th>Order Quantity</th>
						<th>Order Price</th>
						<th>Order Total Amount</th>
					 
								 
				</tr>
			
			<%
					request.getSession().removeAttribute("upsuccess");
				    request.getSession().removeAttribute("del");
					request.getSession().removeAttribute("mes");
					request.getSession().removeAttribute("e2");
					request.getSession().removeAttribute("d");
					PrintWriter p=response.getWriter();
					
					Statement st = null;
					Statement st1 = null;
					String usern=request.getParameter("username");
					String sdate=request.getParameter("sdate");
					String edate=request.getParameter("edate");
					int results = 0;
					try {
								Connection conn=null;
								
								conn = DBManager.getConnection();
							if(user!=null || sdate!=null || edate!=null)
							{
									st = conn.createStatement();
									ResultSet rs = st.executeQuery("SELECT * FROM sl_orders	WHERE (order_date BETWEEN '"+sdate+"' AND '"+edate+"' or order_by='"+usern+"' )");
																	
											
									int sno=0;
									int i=0;
									while(rs.next())
									{
										
											sno++;
											results++;
											 %>
											<tr>
											<td align="left"><%=sno %></td>
												<td align="center"><input type="checkbox" name="one" value="<%=rs.getInt(1)%>"></td>
														
												<td align="center"><%=rs.getString(2) %></td>
												<td align="center"><%=rs.getString(3) %></td>
												<td align="center"><%=rs.getString(4)%></td>
												<td align="center"><%=rs.getString(5)%></td>
												<td align="left"><%=rs.getString(6)%></td>
												<td align="left"><%=rs.getString(7)%></td>
												<td align="left"><%=rs.getString(8)%></td>
												
							<%-- 	<td><input type="button" name="delete" value="Delete" class="btn1" onclick="deleteRecord(<%=rs.getInt("order_id")%>)" /></td> --%>
							
										</tr>
										<%
									}
									 %>	
								
								<%
								if(results == 0) {  
									out.println("<td>The Record Was Not Found</td>");
		                            //out.print("<h2>The record was not found.<h2>");  
		                            }  
							}
							else
							{
								st1 = conn.createStatement();
								ResultSet rs1 = st1.executeQuery("select * from sl_orders");
																
		%>
								
								
								
								<%
								
								int sn1=0;
							int j=0;
								while(rs1.next())
								{
									results++;
									//int j=1;
										sn1++;
										 %>
										<tr>
										<td align="left"><%=sn1%></td>
												<td align="center"><input type="checkbox" name="one" value="<%=rs1.getInt(1)%>"></td>
														
												<td align="center"><%=rs1.getString(2) %></td>
												<td align="center"><%=rs1.getString(3) %></td>
												<td align="center"><%=rs1.getString(4)%></td>
												<td align="center"><%=rs1.getString(5)%></td>
												<td align="left"><%=rs1.getString(6)%></td>
												<td align="left"><%=rs1.getString(7)%></td>
												<td align="left"><%=rs1.getString(8)%></td>
											
										<%-- 	<td><input type="button" name="delete" value="Delete" class="btn1" onclick="deleteRecord(<%=rs1.getInt("order_id")%>)" /></td> --%>
									</tr>
									<%
									//j++;
								}
								
								if(results == 0) {  
									out.println("<td>The Record Was Not Found</td>");
		                            //out.print("<h2>The record was not found.<h2>");  
		                            }  
								 %>	
								 
						
							<%
							}
								conn.commit();
					}
					
					catch(NullPointerException e)
					{
					p.println(e.toString());
					}
				%>	
				</table>
			
				<br></br>
			<input type="submit" value="Delete" class="tableSubmitUpdatebutton">
				
					
				</form>
<br></br><br></br>
</div>

</body>
<jsp:include page="Footer.jsp"></jsp:include>
</html>
<%}%>