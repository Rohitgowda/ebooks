<%
		String url="";
		 if(session.getAttribute("username")==null)
			{

			 response.sendRedirect("Login.jsp");

			}
		 else
		 {%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import="sl_membermaster.DBManager" %>
<%@ page import="java.io.*" %>   
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.*" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Home Page</title>
<link href="css/Button.css" rel="stylesheet" type="text/css" />
<link href="css/layout.css" rel="stylesheet" type="text/css" />
<link href="css/menu.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" media="screen" href="css/Button.css" />
<jsp:include page="Header.jsp"/>
</head>

<body>

<% 

String bname=request.getParameter("bname");
String category=request.getParameter("category");
String author=request.getParameter("author");
String qty=request.getParameter("qty");
String price=request.getParameter("price");
String total=request.getParameter("total");


%>
<div id="homemenu">
		
				<div id="menuheader" align="center">
					<h2>Order Summary<img src="images/hand.png" height="27px"></img></h2>
					<marquee behavior="alternate" direction="left" width="250px" scrolldelay="80">
					<marquee behavior="alternate" direction="down" height="20px" scrolldelay="80">
					<span class="popular">Order Summary!!!</span></marquee></marquee>
				</div>
				
				<br></br>
		<form action="PaymentOption.jsp">
		
		<div> 
		
		
		<p>Hello, ${username}</p>
		Review Your Order
		</div>
			

		<div>
		<fieldset>
		<table bgcolor="cream">
		<tr>
			<th align="left" width="10%">Item</th>
			
			<th align="left" width="100">Category</th>
			<th align="left" width="100">Quantity</th>
			<th align="left" width="10%">Price</th>
			<th align="left" width="100">SubTotal</th>
		</tr>
		
		<tr>
			<td align="left" width="10%"><%=bname %></td>
			
			<td align="left" width="10%"><%=category%></td>
			<td align="left" width="10%"><%=qty %></td>
			<td align="left" width="10%"><%=price %></td>
			<td align="left" width="10%"><%=total %></td>
		</tr>
		
		</table>
		
		<br/>
		Delivery : With In 4 Days.
		<br/>
	
		Free Home Delivery.
		
		</fieldset>
	
	
		<table width="100%" height="30px">
		
		 <tr bgcolor="grey" align="right"><th>Amount Payable: <font color="white">Rs. <%=total %></font></th></tr>
		 
		 </table>
	
		 <input type="hidden" name="bname" value="<%=bname%>"/>
		 <input type="hidden" name="total" value="<%=total%>"/>
		 <input type="hidden" name="qty" value="<%=qty%>"/>
		 <input type="hidden" name="price" value="<%=price%>"/>
		 <input type="hidden" name="category" value="<%=category%>"/>
		 
		 <div align="center"> Confirm Your Order, Please Click On Continue.<div align="center">
		 <br></br>
		 
		 <input type="submit" class="tableSubmitUpdatebutton" onclick="PaymentOption.jsp" value="Continue"/></div></div>	
		 <br></br>	 
		
		</div>
		</form>
</div>
</body>

<jsp:include page="Footer.jsp"/>
</html>
<%}%>	