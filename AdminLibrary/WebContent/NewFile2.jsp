<%
		String url="";
			if(session.getAttribute("adminname")==null)
			{
			 session.removeAttribute("username");
			 response.sendRedirect("Login.jsp");
			
			}
		 else
		 {%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="javax.sql.DataSource" %>
    <%@ page import="javax.naming.Context" %>
    <%@ page import="javax.naming.InitialContext" %>
    <%@ page import="javax.naming.NamingException" %>
<%@ page import="java.io.*" %>   
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
	<link rel="stylesheet" type="text/css" media="screen" href="css/admin.css" />
		
		<link rel="stylesheet" type="text/css" media="screen" href="css/Button.css" />
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		
		<jsp:include page="Admin.jsp"></jsp:include>
		
		<title>Add Product</title>

<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 0);
	response.setHeader("Pragma", "no-cache");
	
	/* UserMenuPrivileges userMenuPrivileges = new UserMenuPrivileges(session, "REWARD_LIST"); */
%>		
		<script language="javascript">
		
				function popUpClosed() 
					{
					    window.location.reload();
					}
				
				function editRecord(url)
				{
					
					popupWindow=window.open(url,'id','height=450,width=500,top=200,left=300,resizable=no,scrollbars=no,menubar=no');
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
			
				function isValid()
				{
						if(isNaN(f.price.value))
						{
											
							f.price.focus();
											
							f.price.value="";
							alert("Price should be numeric value");
							return false;
						}	
				}
								
					
					
				function validate()
				{
					var bname=document.f.bname.value;
					var price=document.f.price.value;
					var cname=document.f.cname.value;
					var author=document.f.author.value;
					var bdesc=document.f.bdesc.value;
									
									
									
					if(bname=="")
					{
						alert("Please Enter The Book Name");
						document.f.bname.focus();
						return false;
					}
									
					if (document.f.elements["file"].value == "")
					{
						alert("You forgot to attach image file!");
						document.f.elements["file"].focus();
						return false;  
					}
									
					var res_field = document.f.elements["file"].value;   
					var extension = res_field.substr(res_field.lastIndexOf('.') + 1).toLowerCase();
					var allowedExtensions = ['png','jpeg','jpg'];
					if (res_field.length > 0)
					{
						if (allowedExtensions.indexOf(extension) === -1) 
						{
							alert('Invalid file Format. Only ' + allowedExtensions.join(', ') + ' are allowed.');
						    return false;
						}
									          
					}
									  
					if(cname=="")
					{
						alert("Please Select The Book Category Name");
						document.f.cname.focus();
						return false;
					}
									
					if(bdesc=="")
					{
						alert("Please Enter The Book Description");
						document.f.bdesc.focus();
						return false;
					}
									
					if(author=="")
					{
						alert("Please Enter The Book Author");
						document.f.author.focus();
						return false;
					}
									
					if (document.f.elements["file1"].value == "")
					{
					     alert("You forgot to attach pdf file!");
					     document.f.elements["file1"].focus();
					     return false;  
					}
									
					var res_field1 = document.f.elements["file1"].value;   
					var extension1 = res_field1.substr(res_field1.lastIndexOf('.') + 1).toLowerCase();
					var allowedExtensions1 = ['pdf'];
					if (res_field1.length > 0)
					{
						if (allowedExtensions1.indexOf(extension1) === -1) 
						{
							alert('Invalid file Format. Only ' + allowedExtensions1.join(', ') + ' are allowed.');
						    return false;
						}
									         
					}
									
								
								
					if(price=="")
					{
						alert("Please Enter The Book Price");
						document.f.price.focus();
						return false;
					}
				 return true;
				}
				
				checked=false;
				function checkedAll (frm)
				{
					var form= document.getElementById('frm');
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
				
			    function doUpdate(){  
			        var c = document.getElementsByTagName('input');   
			        
			        for (var i = 0; i < c.length; i++) {   
			        if (c[i].type == 'checkbox' && c[i].checked == true) {   
			        // At least one checkbox IS checked     
			       
			        document.frm.command.value= 'Delete';  
			       /*  document.frm.action='BookDeleteAction?slect='+select; */
			  
				    document.frm.submit();   
			        return true;   
			      }   
			    }   
			    // Nothing has been checked   
			    alert("Please Select any books to delete?");   
			    return false;   
			    }    
		</script>
		
		
	</head>



<body bgcolor="#D9D0D0" onclick="parent_disable();">

	<div id="homemenu" align="center">
			<div id="menuheader" align="center">
			<h2>Book Details<img src="images/hand.png" height="24px"></img></h2>
			
		</div>
			
	<br></br>

	
	
	 
	 	<h3>Add Books Details</h3>
								
		
		<form name="f" action="BookInsertAction" enctype="multipart/form-data" method="post"> 
						<br/>
					
				 <i><font size=2 color="green">
				 
				<%
				request.getSession().removeAttribute("mes");
				request.getSession().removeAttribute("e2");
				request.getSession().removeAttribute("d");
						if(request.getAttribute("message4")!=null)
						  out.println(request.getAttribute("message4"));
						  else
						  out.println("");
				 			
				%>
				</font></i>
				
						<i><font size="2" color="red">
						
						
						<%
							if(request.getAttribute("m2")!=null)
									
								  out.println(request.getAttribute("m2"));
								  else
								  out.println("");
							if(request.getAttribute("mess")!=null)
							
							  out.println(request.getAttribute("mess"));
							  else
							  out.println("");
						%>
						
						</font></i>
						
						
						
						<i><font size="2" color="green">
		
				${message3}
				
				<%
				
					request.getSession().removeAttribute("message3");
					
				%>
				</font></i>
			
		<table class="myTable" align="center" border="10" >
		
		   <tbody>
					    
					 <tr>
			              <td>Book Name </td>
			              <td><input class="input" type="text" name="bname" width="200px" size="30px"/></td>
		         	 </tr>
		         	 
		         	 <tr> 
		         	 		<td>Book Image:</td>
					      <td><input class="input" type="file" name="file" accept="image/*" /> </td>
					 </tr> 
					            
					              
					 <tr>
					      <td>Category Name:</td>
					      <td><select name="cname">
					                <option value="" selected>Please Select</option>  
					<%
			
								Context envContext = null;
								Connection conn=null;
								try{
									
									envContext = new InitialContext();
						            //Context initContext  = (Context)envContext.lookup("java:/comp/env");
						           // DataSource ds = (DataSource)initContext.lookup("jdbc/SterlingLibrary");
						            DataSource ds = (DataSource)envContext.lookup("java:/comp/env/jdbc/SterlingLibrary");
						            conn = ds.getConnection();
						            
									        String sql;
							
							        
							
							              Statement s = conn.createStatement();
							              sql = "select cat_name from sl_categorymaster;";
							              
							              ResultSet rs = s.executeQuery(sql);
							            
							              
							              while (rs.next()) {
							
							              String cd=rs.getString(1);
							                    
							                        
							              out.print("<li><option value="+rs.getString("cat_name")+">"+rs.getString("cat_name")+"</option></li>");
							                        
							                      // out.println("</ul>");
							
							              }
							
							             		
							            conn.commit();
							
							          }
							
								catch (SQLException e) 
								{
						            e.printStackTrace();
						        } 
								catch (NamingException e) 
								{
						            e.printStackTrace();
						        }
								catch (Exception e) 
								{
									System.out.println(e);
								}
								finally 
								{
								      try {
								        if (conn != null)
								        	System.out.println("closed");
								          conn.close();
								      } 
								      catch (SQLException e) 
								      {
								      }
								}
							
							     %>
					
					       </select>
					     </td>
					             
					 </tr>
					 
					 <tr>
					     <td>Book Description </td>     
					     <td> <textarea class="textarea" rows="3" cols="20" name="bdesc"></textarea></td>
					 </tr>
					         		              
					 <tr> 
					 	<td>Book Author </td>
					 	<td><input class="input" type="text" name="author" value="" width="200px" size="30px"/></td>
					 </tr>
					 
					 <tr>
						 <td>Pdf File </td>
						 <td><input type="file" name="file1"/></td>
					 </tr> 
					 
					 <tr> 
						 <td>Book Price </td>
						 <td><input class="input" type="text" name="price" value="" width="200px" onkeyup="isValid()" size="30px"/></td>
					 </tr>
				 </tbody>	  
		</table>		
								                                        
					  <INPUT TYPE="submit" VALUE="Save" class="tableSubmitUpdatebutton" onclick="return validate();"/>


 </form>
 
 <br></br>
 
			<marquee behavior="alternate" direction="left" width="300px" scrolldelay="80">
			<marquee behavior="alternate" direction="down" height="20px" scrolldelay="80">
			<span class="popular"><b>View Book Details!!!</b></span></marquee></marquee>
			
<br></br>
			
 <form id="fr" action="Book.jsp" method="post">
 
 			<table>
					<tr>
					
						 <th>Category Name:</th>
					      <td><select name="catname" id="dropdown">
					      
					      <!-- <select name="catname" id="dropdown" onchange="this.form.submit()"> -->
					      
					      				 <option value="">Please Select</option> 
				
						<%

						//Context envContext = null;
						
						try{
							
							envContext = new InitialContext();
				           // Context initContext  = (Context)envContext.lookup("java:/comp/env");
				           // DataSource ds = (DataSource)initContext.lookup("jdbc/SterlingLibrary");
				            DataSource ds = (DataSource)envContext.lookup("java:/comp/env/jdbc/SterlingLibrary");
				            conn = ds.getConnection();
				            
									        String sql;
							
							        
							
							              Statement s = conn.createStatement();
							              sql = "select cat_name from sl_categorymaster;";
							              
							              ResultSet rs = s.executeQuery(sql);
							            
							              
							              while (rs.next()) {
							
							              String cd=rs.getString(1);
							                    %>
							                    
							             <%
							             out.print("<li><option value="+rs.getString("cat_name")+">"+rs.getString("cat_name")+"</option></li>");
							                        
							                      // out.println("</ul>");
							
							              }
							
							             		
							            conn.commit();
							
							          }
							
						catch (SQLException e) 
						{
				            e.printStackTrace();
				        } 
						catch (NamingException e) 
						{
				            e.printStackTrace();
				        }
						catch (Exception e) 
						{
							System.out.println(e);
						}
						finally 
						{
						      try {
						        if (conn != null)
						        	System.out.println("closed");
						          conn.close();
						      } 
						      catch (SQLException e) 
						      {
						      }
						}
							
							     %>
					
					       </select>
					       
							        <%
						       	 		String catname = request.getParameter("catname");
						       
						       		 %>
						       		 
						        <script>
						       		 document.getElementById("dropdown").value = '<% out.print(catname); %>';
						        </script> 
						        
					     </td>
					     
					     
					<td align="right"><input type="submit" value="Search" class="tableSubmitUpdatebutton"/></td>   </tr> 
			
			</table>
		
			<i><font size=2 color="green">
	 							
		
				${upsuccess}
				
					</font></i>
					 <i><font size=2 color="red">
	 				${del}
				
						<%
						
							 request.getSession().removeAttribute("del"); 
							
						%>
			 			
						</font></i>
			        </form>
			    
			        
			       
						<%!
							public int nullIntconv(String str)
							{   
							    int conv=0;
							    if(str==null)
							    {
							        str="0";
							    }
							    else if((str.trim()).equals("null"))
							    {
							        str="0";
							    }
							    else if(str.equals(""))
							    {
							        str="0";
							    }
							    try{
							        conv=Integer.parseInt(str);
							    }
							    catch(Exception e)
							    {
							    }
							    return conv;
							}
						%>
					<%

					envContext = new InitialContext();
		            //Context initContext  = (Context)envContext.lookup("java:/comp/env");
		           // DataSource ds = (DataSource)initContext.lookup("jdbc/SterlingLibrary");
		            DataSource ds = (DataSource)envContext.lookup("java:/comp/env/jdbc/SterlingLibrary");
		            conn = ds.getConnection();
							
							    ResultSet rsPagination = null;
							    ResultSet rsRowCnt = null;
							    
							    PreparedStatement psPagination=null;
							    PreparedStatement psRowCnt=null;
							    
							    int iShowRows=5;  // Number of records show on per page
							    int iTotalSearchRecords=10;  // Number of pages index shown
							    
							    int iTotalRows=nullIntconv(request.getParameter("iTotalRows"));
							    int iTotalPages=nullIntconv(request.getParameter("iTotalPages"));
							    int iPageNo=nullIntconv(request.getParameter("iPageNo"));
							    int cPageNo=nullIntconv(request.getParameter("cPageNo"));
							    
							    int iStartResultNo=0;
							    int iEndResultNo=0;
							    
							    if(iPageNo==0)
							    {
							        iPageNo=0;
							    }
							    else{
							        iPageNo=Math.abs((iPageNo-1)*iShowRows);
							    }
							    String ss=request.getParameter("catname");  
							
							    		%>

		<form id="frm" action="BookDeleteAction" method="post" onsubmit="return doUpdate();">	
		<input type="hidden" name="iPageNo" value="<%=iPageNo%>">
		<input type="hidden" name="cPageNo" value="<%=cPageNo%>">
		<input type="hidden" name="iShowRows" value="<%=iShowRows%>">
		<table class="myTable" align=center border="10" cellpadding="2" >
		<tr>
					<th>Sl.No</th>
					<th>Select All<input type="checkbox" name="checkall" onclick='checkedAll(frm);'/></th>
								
					<th>Book Name</th>
					<th>Book Image</th>
					<th>Category Name</th>
					<th>Book Author</th>
					<th>Book Desc</th>
					<th>Book Price</th>
					<th>Created On</th>
					<th>Modification</th>
		</tr>
		<%
		
		if(ss!=null && ss!="")
		{
		    
		    String sqlPagination="SELECT SQL_CALC_FOUND_ROWS * FROM sl_bookmaster where cat_name='"+ss+"' limit "+iPageNo+","+iShowRows+"";
		
		    psPagination=conn.prepareStatement(sqlPagination);
		    rsPagination=psPagination.executeQuery();
		    
		    //// this will count total number of rows
		     String sqlRowCnt="SELECT FOUND_ROWS() as cnt";
		     psRowCnt=conn.prepareStatement(sqlRowCnt);
		     rsRowCnt=psRowCnt.executeQuery();
		     
		     if(rsRowCnt.next())
		      {
		         iTotalRows=rsRowCnt.getInt("cnt");
		      }
		     
		     int sno1=0;
			  while(rsPagination.next())
			  {
				  
				  sno1++;
			  %>
			  
			    <tr>
			     
			      <td align="left"><%=sno1%></td>
			    <td align="center"><input type="checkbox" name="select" value="<%=rsPagination.getInt(1)%>"></td>
				<td align="center"><%=rsPagination.getString("book_name")%></td>
				<td><img src="ImageRetrieve?imgid=<%=rsPagination.getInt("book_id")%>" height="50px" width="50px"/></td>
												
				<td align="center"><%=rsPagination.getString("cat_name")%></td>
				<td align="center"><%=rsPagination.getString("book_author")%></td>
				<td align="center"><%=rsPagination.getString("book_desc")%></td>
				<td align="left"><%=rsPagination.getString("book_price")%></td>
				<td align="center"><%=rsPagination.getString("created_on")%></td>
															<td>
																				<input type="button" name="edit" value="Edit" class="btn" onclick="editRecord('EditBook.jsp?id=<%=rsPagination.getInt("book_id")%>')" />
																				
			    </tr>
			    <% 
			 }
			  
			  try{
		            if(iTotalRows<(iPageNo+iShowRows))
		            {
		                iEndResultNo=iTotalRows;
		            }
		            else
		            {
		                iEndResultNo=(iPageNo+iShowRows);
		            }
		           
		            iStartResultNo=(iPageNo+1);
		            iTotalPages=((int)(Math.ceil((double)iTotalRows/iShowRows)));
		        
		        }
		        catch(Exception e)
		        {
		            e.printStackTrace();
		        }
		
		%>
		<tr>
		<td colspan="3">
		<div>
		<%
		        //// index of pages 
      
		        int i=0;
		        int cPage=0;
		        if(iTotalRows!=0)
		        {
		        cPage=((int)(Math.ceil((double)iEndResultNo/(iTotalSearchRecords*iShowRows))));
		        
		        int prePageNo=(cPage*iTotalSearchRecords)-((iTotalSearchRecords-1)+iTotalSearchRecords);
		        if((cPage*iTotalSearchRecords)-(iTotalSearchRecords)>0)
		        {
		         %>
		          <a href="Book.jsp?iPageNo=<%=prePageNo%>&cPageNo=<%=prePageNo%>"> Previous</a>
		         <%
		        }
		        
		        for(i=((cPage*iTotalSearchRecords)-(iTotalSearchRecords-1));i<=(cPage*iTotalSearchRecords);i++)
		        {
		          if(i==((iPageNo/iShowRows)+1))
		          {
		          %>
		           <a href="Book.jsp?iPageNo=<%=i%>" style="cursor:pointer;color: red"><b><%=i%></b></a>
		          <%
		          }
		          else if(i<=iTotalPages)
		          {
		          %>
		           <a href="Book.jsp?iPageNo=<%=i%>"><%=i%></a>
		          <% 
		          }
		        }
		        if(iTotalPages>iTotalSearchRecords && i<iTotalPages)
		        {
		         %>
		         <a href="Book.jsp?iPageNo=<%=i%>&cPageNo=<%=i%>"> >> Next</a> 
		         <%
		        }
		        }
		      %>
				<b>Rows <%=iStartResultNo%> - <%=iEndResultNo%>   Total Result  <%=iTotalRows%> </b>
		</div>
	</td>
	</tr>
		 <%    
		}
		else
		{
			 String sqlPagination1="SELECT SQL_CALC_FOUND_ROWS * FROM sl_bookmaster limit "+iPageNo+","+iShowRows+"";
				
			    psPagination=conn.prepareStatement(sqlPagination1);
			    rsPagination=psPagination.executeQuery();
			    
			    //// this will count total number of rows
			     String sqlRowCnt="SELECT FOUND_ROWS() as cnt";
			     psRowCnt=conn.prepareStatement(sqlRowCnt);
			     rsRowCnt=psRowCnt.executeQuery();
			     
			     if(rsRowCnt.next())
			      {
			         iTotalRows=rsRowCnt.getInt("cnt");
			      }
			     int sno1=0;
				  while(rsPagination.next())
				  {
					  
					  sno1++;
				  %>
				  
				    <tr>
				     
				      <td align="left"><%=sno1%></td>
				    <td align="center"><input type="checkbox" name="select" value="<%=rsPagination.getInt(1)%>"></td>
					<td align="center"><%=rsPagination.getString("book_name")%></td>
					<td><img src="ImageRetrieve?imgid=<%=rsPagination.getInt("book_id")%>" height="50px" width="50px"/></td>
													
					<td align="center"><%=rsPagination.getString("cat_name")%></td>
					<td align="center"><%=rsPagination.getString("book_author")%></td>
					<td align="center"><%=rsPagination.getString("book_desc")%></td>
					<td align="left"><%=rsPagination.getString("book_price")%></td>
					<td align="center"><%=rsPagination.getString("created_on")%></td>
																<td>
																					<input type="button" name="edit" value="Edit" class="btn" onclick="editRecord('EditBook.jsp?id=<%=rsPagination.getInt("book_id")%>')" />
																					
				    </tr>
				    <% 
				 }
				  try{
			            if(iTotalRows<(iPageNo+iShowRows))
			            {
			                iEndResultNo=iTotalRows;
			            }
			            else
			            {
			                iEndResultNo=(iPageNo+iShowRows);
			            }
			           
			            iStartResultNo=(iPageNo+1);
			            iTotalPages=((int)(Math.ceil((double)iTotalRows/iShowRows)));
			        
			        }
			        catch(Exception e)
			        {
			            e.printStackTrace();
			        }
			
			%>
			<tr>
			<td colspan="3">
			<div>
			<%
			        //// index of pages 
	        
			        int i=0;
			        int cPage=0;
			        if(iTotalRows!=0)
			        {
			        cPage=((int)(Math.ceil((double)iEndResultNo/(iTotalSearchRecords*iShowRows))));
			        
			        int prePageNo=(cPage*iTotalSearchRecords)-((iTotalSearchRecords-1)+iTotalSearchRecords);
			        if((cPage*iTotalSearchRecords)-(iTotalSearchRecords)>0)
			        {
			         %>
			          <a href="Book.jsp?iPageNo=<%=prePageNo%>&cPageNo=<%=prePageNo%>"> << Previous</a>
			         <%
			        }
			        
			        for(i=((cPage*iTotalSearchRecords)-(iTotalSearchRecords-1));i<=(cPage*iTotalSearchRecords);i++)
			        {
			          if(i==((iPageNo/iShowRows)+1))
			          {
			          %>
			           <a href="Book.jsp?iPageNo=<%=i%>" style="cursor:pointer;color: red"><b><%=i%></b></a>
			          <%
			          }
			          else if(i<=iTotalPages)
			          {
			          %>
			           <a href="Book.jsp?iPageNo=<%=i%>"><%=i%></a>
			          <% 
			          }
			        }
			        if(iTotalPages>iTotalSearchRecords && i<iTotalPages)
			        {
			         %>
			         <a href="Book.jsp?iPageNo=<%=i%>&cPageNo=<%=i%>"> >> Next</a> 
			         <%
			        }
			        }
			      %>
					<b>Rows <%=iStartResultNo%> - <%=iEndResultNo%>   Total Result  <%=iTotalRows%> </b>
			</div>
		</td>
		</tr>
	<%	}
		
		 %>
		
	</table>

	
					<br></br>
						<input type="submit" value="Delete" class="tableSubmitUpdatebutton">
					</form>
					
			
	
	<br></br>
		<br></br>	
		</div>
	
 	</body>
	
<%@include file="Footer.jsp" %> 

</html>
<%}%>