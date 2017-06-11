<%
		String url="";
		 if(session.getAttribute("username")==null)
			{

			 response.sendRedirect("index.jsp");

			}
		 else
		 {%>
<%@ page import="sl_adminmaster.DBManager" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*" %>   
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" type="text/css" media="screen" href="css/admin.css" />
<link rel="stylesheet" type="text/css" media="screen" href="css/Button.css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="home.jsp"></jsp:include>

<title>Add Category</title>
<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 0);
	response.setHeader("Pragma", "no-cache");
	
	
%>
<script language="javascript">

		function popUpClosed() 
		{
		    window.location.reload();
		}
		
		function validate()
		{
			var category=document.form.category.value;
			/*if(category=="")
			{
			 alert("Please Enter category!");
			 document.form.category.focus();
			  return false;
			}
			
			return true;*/
			var regx_chr = /^([a-zA-Z_-]+)$/;
			//var r = new RegExp("^[a-z' ']*$");
			if(category.length<3 || category.length>18 || category.search(regx_chr)==-1) {
			    alert('The Name Should Contain words and no digits');
			    document.form.category.focus();   // select the field for Name
			    return false;
			  }
			return true;
		}
		
		
		function editRecord(url){
			popupWindow=window.open(url,'id','titlebar=no,location=no,status=yes,menubar=no,height=150,width=200,top=200,left=400');
			if(window.focus)
			{
				popupWindow.focus();
			}
			return false;
			 
		}
		 
		function parent_disable() 
		 {
			 if(popupWindow && !popupWindow.closed)
			 popupWindow.focus();
		 }
		
		function deleteRecord(id)
		{
			var r=confirm("Are You Sure?!");
			if (r==true)
			{
				var f=document.form;
			    
			    f.method="post";
			    f.action='CategoryDeleteAction?id='+id;
			    f.submit();
		
			 }
		}
		
	
</script>
</head>
<body bgcolor="#D9D0D0"  onclick="parent_disable();">

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
							

<div id="homemenu" align="center">
			<div id="menuheader" align="center">
			<h2>Category Details<img src="images/hand.png" height="24px"></img></h2>
			
		</div>
			
	<br></br>
	
		
		<h3>Add Category</h3>
				<i><font size=2 color="green">
		
				${m}
				
				<%
				 request.getSession().removeAttribute("upsuccess");
			    request.getSession().removeAttribute("del");
					request.getSession().removeAttribute("m");
					
				%>
				</font></i>
				<i><font size=2 color="red">
				<%
					if(request.getAttribute("m2")!=null)
						
					  out.println(request.getAttribute("m2"));
					  else
					  out.println("");
				%>
				
				</font></i>
				
				
			
		<form name="form" action="CategoryAction" method="post">
		
				
				
				 Please Enter the Category Name: <input class="input" type="text" name="category" size="30px"/><br><br>
				 <input type="submit" value="Add" class="tableSubmitUpdatebutton" onclick="return validate();" />
				 <input type="reset" value="Clear" class="tableSubmitUpdatebutton"/>
				
			<br></br>
				<br></br>
				<marquee behavior="alternate" direction="left" width="300px" scrolldelay="80">
			<marquee behavior="alternate" direction="down" height="25px" scrolldelay="80">
			<span class="popular"><b>View Categories!!!</b></span></marquee></marquee>
				
				<br></br>
				<br></br>
				<i><font size=2 color="green">
				${mes}
				${e2}
				${e1}
				</font></i>
				<i><font size=2 color="red">
				${d}
			<%	request.getSession().removeAttribute("mes");
				request.getSession().removeAttribute("e2");
				request.getSession().removeAttribute("d");
				request.getSession().removeAttribute("e1");%>
				</font></i>
				
						<%
						
								Statement st = null;
								
								Connection conn=null;
								try {
									
										conn = DBManager.getConnection();	
										
									st = conn.createStatement();
									ResultSet rs = st.executeQuery("select * from sl_categorymaster");
									
									
									%>
									
									<Table class="myTable" align="center" border="10" cellpadding="2">
									<tr bgcolor="#808080">
									
																		 
										 <th>Sl. No</th>
										 <th>Category Name</th>
										 <th>Created On</th>
										<th>Modification</th>
									</tr>
									
									<%
									
									int sno=0;
									
									while(rs.next())
									{
										sno++;
										
									%>
										<tr><td><%=sno%></td>	
										
										
										<td><%=rs.getString(2)%></td>
										<td><%=rs.getString(3)%></td>
										<td><input type="button" name="edit" value="Edit" class="btn" onclick="return editRecord('Editcategory.jsp?id=<%=rs.getInt(1)%>')"  />
										<input type="button" name="delete" value="Delete" class="btn1" onclick="deleteRecord(<%=rs.getInt(1)%>);"  /></td>
										</tr>
										
									<%
									
									}
									%>
									</table>
									<%
									conn.commit();
								}
								
								catch(Exception e)
								{
									e.toString();
								}
								
								
								
						
						%>
		</form>
	
		
		
		
<br></br>
		<br></br>	

</div>

</body>

<jsp:include page="Footer.jsp"></jsp:include>


</html>
<%}%>