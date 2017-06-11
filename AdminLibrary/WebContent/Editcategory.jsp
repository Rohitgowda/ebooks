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
<%@page language="java"%>

<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" type="text/css" media="screen" href="css/Button.css" />
<link rel="stylesheet" type="text/css" media="screen" href="css/admin.css" />
<head>
<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 0);
	response.setHeader("Pragma", "no-cache");
	
	
%>
<link rel="stylesheet" type="text/css" media="screen" href="css/Button.css" />
<script type="text/javascript">

		function closeWin() 
		{
			   window.close();
		}
		window.onunload = function() 
		{
		    if (window.opener && !window.opener.closed) 
		    {
		    	window.close();
		        window.opener.popUpClosed();
		        
		    }
		};

</script>
</head>
<body bgcolor="#ffffcc">

<div align="center">
				<form name="form" method="post" action="CategoryUpdateAction">
				<table class="myTable">
				<tr><th>Category Name</th></tr>




		<%
							String id=request.getParameter("id");
							int no=Integer.parseInt(id);
							int sumcount=0;
							try {
								 Connection conn=null;
								
									conn = DBManager.getConnection();	
							String query = "select * from sl_categorymaster where cat_id='"+no+"'";
							Statement st = conn.createStatement();
							ResultSet rs = st.executeQuery(query);
							while(rs.next())
							{
		%>
						
								
									<input type="hidden" name="cid" value="<%=rs.getString(1)%>" />
									
									
									<tr>
									<td><input class="input" type="text" text-align="center" name="name" value="<%=rs.getString(2)%>" /></td>
									</tr>		
									</table>
									</br>
									
										<input type="submit" name="Edit" value="Update" class="enviar">
								
					
		<%
							}
						conn.commit();
						}
						catch(Exception e){}
		%>
		
		

</form>
</div>

</body>
</html>
<%}%>