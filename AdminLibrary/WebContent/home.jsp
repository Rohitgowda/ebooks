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
    <%@ page import="java.io.*" %>   
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" type="text/css" media="screen" href="css/styles.css" /> 
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Admin Library</title>
<!-- <script src='http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js'></script> -->

<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 0);
	response.setHeader("Pragma", "no-cache");
	
	
%>
</head>

<body>
<div id="header"  >
<img src="images/index3.jpg" height="200px" width="100%"></div>
  <div id='cssmenu'>
<ul>
   <li><a href='Admin.jsp'><span>Home</span></a></li>
   <li class='has-sub'><a href='#'><span>Category</span></a>
      <ul>
         <li class='last'><a href='Category.jsp'><span>Manage Category</span></a></li>
      </ul>
   </li>
   <li class='has-sub'><a href='#'><span>Products</span></a>
      <ul>
         <li class='last'><a href='Book.jsp'><span>Manage Books</span></a></li>
      </ul>
   </li>
   <li class='has-sub'><a href='#'><span>Orders</span></a>
   		<ul>
         <li class='last'><a href='Orderdetails.jsp'><span>Manage Orders</span></a></li>
      	</ul>
   </li>
   <li class='has-sub'><a href='#'><span>Account OverView</span></a>
   		<ul>
         <li class='last'><a href='logout.jsp'><span>Log Out</span></a></li>
         <li class='last'><a href='Changepassword.jsp'><span>Change Password</span></a></li>
      </ul>   
   </li>
</ul>
</div>

</body>

</html> 
<%}%>