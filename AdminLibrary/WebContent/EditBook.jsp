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
<head>
<link rel="stylesheet" type="text/css" media="screen" href="css/Button.css" />
<link rel="stylesheet" type="text/css" media="screen" href="css/admin.css" />
<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 0);
	response.setHeader("Pragma", "no-cache");
	
	
%>

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
		function change()
		{
			u=f1.cname.value;
			v=f1.ccname.value;
			alert("You Changed "+u+" to "+v);
			f1.cname.value=f1.ccname.value;
			f.id.value=v;
			
			}
		function isValid()
		{
			if(isNaN(f1.price.value))
					{
					
					f1.price.focus();
					
					f1.price.value="";
					alert("Price should be numeric value");
					return false;
					}	
			}
		


</script>
</head>
<body  onblur="self.focus()">

<div align="center">
<h3><font color="white">Book Details</font></h3>
<form name="f1" method="post" action="BookUpdateAction">
		
				<table border="10" bgcolor="#ffffcc" class="myTable">
				




		<%
		
							String id=request.getParameter("id");
							int no=Integer.parseInt(id);
							int sumcount=0;
							try {
								 Connection conn=null;
								
									conn = DBManager.getConnection();	
							String query = "select * from sl_bookmaster where book_id='"+no+"'";
							Statement st = conn.createStatement();
							ResultSet rs = st.executeQuery(query);
							while(rs.next())
							{
		%>
						
								
									<input type="hidden" name="id" value="<%=rs.getString(1)%>" />
									
									
									<tr>
									 	<td>Book Name </td>
										<td><input type="text" name="name" value="<%=rs.getString(2)%>" /></td>
									</tr>	
																		<tr>
									 	<td>Category Name </td>
										<td><input type="text" name="cname" value="<%=rs.getString(4)%>" />
								
					<select name="ccname">
							                  
		<%
							  try {
							
									    	Connection conn1=null;
									    	conn1=DBManager.getConnection();
									     
									        String sql;
							
							        
							
							              Statement s = conn.createStatement();
							              sql = "select cat_name from sl_categorymaster;";
							              
							              ResultSet rs1 = s.executeQuery(sql);
							            
							              
							              while (rs1.next()) {
							
							             // String cd=rs.getString(1);
							              
							                %>                           
          								<option onClick="javascript:onchange(this)" onchange="change()"><%=rs1.getString("cat_name")%></option>
        								<%
							
							              }
							
							            // rs1.close();		
							            conn.commit();
							
							          }
							
							          catch (SQLException e) {
							
							          }
							
							       catch (Exception e) {
							
							       }
							
							     %>
							
							              </select></td>
						</tr>
						<tr>
						     <td>Book Description </td>     
						     <td> <textarea rows="3" cols="20" name="bdesc"><%=rs.getString(5)%></textarea></td>
						 </tr>
					         		              
						 <tr> 
						 	<td>Book Author </td>
						 	<td><input type="text" name="author" width="200px" value="<%=rs.getString(6)%>"/></td>
						 </tr>
						 <tr> 
						 	 <td>Book Price </td>
						     <td><input type="text" name="price" width="200px" value="<%=rs.getString(7)%>" onkeyup="isValid()"/></td>
						 </tr>
									
				</table>
									
							<br></br>		
					<input type="submit" name="Submit" value="Update" class="enviar">
								
					
		<%
							}
						conn.commit();
						}
						catch(Exception e){}
		%>
		
		

</form>
</div>

</body></html>

<%}%>