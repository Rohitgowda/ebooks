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

<link href="css/layout.css" rel="stylesheet" type="text/css" />
<link href="css/menu.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" media="screen" href="css/Button.css" />
<%@include file="Header.jsp" %>

<script type="text/javascript">

			
			function change()
			{
				
				a=f.price.value;
				b=f.qty.value;
				z=a*b;
				f.total.value=z;
				
				 d=f.dis.value;
					d=z/10;
					f.dis.value=d;
					f.total.value=z-d;
					
					
					if(isNaN(f.qty.value))
							{
							
							f.qty.focus();
							
							f.qty.value="";
							alert("Quantity should be numeric value");
							return false;
							}	
					
				}
			
			function validate(){
				var qty=document.f.qty.value;
				
				
				if(qty==""){
				 alert("Enter The Number Of Quantities you need");
				  return false;
				}
				return true;
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
	
		

			<div id="homemenu" align="center">
		
				<div id="menuheader" align="center">
					<h2>Welcome to Sterling Library<img src="images/hand.png" height="27px"></img></h2>
					<marquee behavior="alternate" direction="left" width="250px" scrolldelay="80">
					<marquee behavior="alternate" direction="down" height="20px" scrolldelay="80">
					<span class="popular">Buy Now!!!</span></marquee></marquee>
			
					
			
				</div>
				
			<br></br>
			
			<form name="f" action="OrderSummary.jsp" method="post" onsubmit="return validate();">
			
			
			<%
					String str=request.getParameter("id");
				
					try{      
										Connection conn=null;
										 
										conn = DBManager.getConnection();
									    Statement stmt=conn.createStatement();
								       
									   	String strQuery = "select * from sl_bookmaster where book_id='"+str+"'";
								        ResultSet rs = stmt.executeQuery(strQuery); 
								        String id=request.getParameter("id");
				%>
					
						
								
								    
								    
								    				
								       
								        
								        <%
								
								        while(rs.next())
								    	{
								    		//String cat=rs.getString(3);
								    		
								    		String aut=rs.getString("book_author");
								    		String cat=rs.getString("cat_name");
								    		String price=rs.getString("book_price");
								    		String str1=rs.getString("book_name");
								    		
								    		
								    	%>
								    	<br></br>
								    	<div align="left" style="margin-left:10px;">
								    	<span><a href="Home.jsp"> Home</a> / <a href="<%= rs.getString("cat_name")%>.jsp"><%= rs.getString("cat_name")%></a> / <strong><%=rs.getString("book_name")%></strong></span>
								    	</div>
								    	<br></br>
								    	<div style="width:100%;height:250px;">
									    	<div style="float: left; width: 33.33%;">
									    		<img src="ImageRetrieve?imgid=<%=id%>" width="200x" height="200px"></img>
									    	
									    	</div>
									    	
									    	<div style="float: left; width: 33.33%;">
									    		<p align="left">
									    		<span><b>Book Name:</b> <%=str1%></span>
									    		</p><br>
									    		<p align="left">
									    		<span><b>Category Name:</b> <%=cat%></span>
									    		</p><br>
									    		<p align="left"><span><b>Author Name:</b> <%=aut%></span>
									    		</p><br>
									    		<p align="left">
									    		<span><b>Price:</b> <%=price%></span>
									    		</p>
									    	</div>
								    	
								    		<div style="float: left; width: 33.33%;">
								    			<p align="left">
									    		<span><b>Payment Options are:</b></span>
									    		</p><br>
									    		<p align="left">
									    		<span><strong>Credit</strong> card</span></p>
									    		<p align="left">
									    		<span><strong>Debit</strong> card</span>
									    		</p>
									    		<p align="left"><span><strong>Cash</strong> on delivery</span></p><br>
									    		
									    	<div style="float:left;margin-top:40px;">
									    	<p>Usually Delevered in <strong>3-5 Business Days</strong></p>
									    	
									    	</div>
									    	</div>
									    	
									    	<br style="clear: right;" />
									    	
								    	</div>
								    
								    		<br></br>
								    	
								    		
											<table class="book_tabel" border="1" align="center">
											
										
											
												<tr>
												 		<th>Book Name</th>
														<th>Book Price</th>
														<th>Quantity</th>
														<th>Book Category</th>
														<th>Book Author</th>
														<th>Book Discount</th>
														<th>Total Price</th>
													
												 </tr>
												<tr align="center">
									    			<td><%=str%><input type="hidden" name="bname" size="15" value="<%=str1%>" readonly="readonly"></input></td>
									    			<td><input type="text" name="price" size="10" value="<%=price%>" readonly="readonly"> </input></td>
									    			<td><input type="text" name="qty" size="9" onkeyup="change()" ></input></td>
									    			<td><%=cat %><input type="hidden" name="category" size="15" value="<%=cat %>" readonly="readonly"></input></td>
									    			<td><%=aut%><input type="hidden" name="author" size="15" value="<%=aut%>" readonly="readonly"></input></td>
									    			<td><input type="text" name="dis" readonly="readonly" size="6"/></td>		
									    			<td><input type="text" name="total" size="14" readonly="readonly"></input></td>
									    		 </tr>
								    					
											</table>
									<br></br><input type="button" value="DownLoad Pdf" class="tableSubmitUpdatebutton" onclick="poup('PdfPurchase.jsp?id=<%=rs.getString("book_id") %>', 'TEST!?', 800, 600);">
									
									<%-- <input type="button" value="Pdf Format" class="tableSubmitUpdatebutton" onclick="window.open('PdfRetrieve?pdid=<%=rs.getInt("book_id")%>','_blank')"/> --%>
												<input type="submit" value="Place Order" class="tableSubmitUpdatebutton" />
						</form>	
				
						<br></br>
			
						<div style="background-color:white;color:black;height=500px;width=500px" align="center">
									 <div style="border:1px solid black;">
												<h3><font color="green"><u>About Author</u></font></h3>
												
												<p><%=rs.getString("book_author") %></p>
												<p>
												<%=rs.getString("book_author") %> currently serves as Executive Director of Marketing at technology, 
												a creator of advanced, innovative technologies designed to efficiently deliver 
												large files across the Internet. It is now  currently boasts over 150 million 
												active monthly users, and moves 20-40% of all Internet traffic on a daily basis.
												</p>
												
												<br></br>
										</div>	
												
												
												<div style="border:1px solid black;">
								       <font color=navy>
								        
								         <b><u>Book Description</u></b>
								         <br></br>
								        Book Name:<%=rs.getString("book_desc")%>
								       
								        <p align="right" style="float:right;padding-right:100px;">  Price:<%=rs.getString("book_price") %></p>
								       
								         </font>
								         <hr></hr>
								         <br>
								          <font color=black>
								         <p aling="left">
								         The first volume is titled The Kuru Princes of Hastinapura. Beginning with Shantanu, King Janamejayas ancestor and the ruler of Hastinapura, this volume narrates the various events that led to the establishment of the Kuru dynasty. 
								         It leads the story to the reign of Dhritarashtra over Hastinapura while his brother Pandu has retired to the forest with his two wives Kunti and Madri and five sons (The Pandavas).
								         
								         </p>
								         <p align="left">
								         Upon the death of Pandu and Madri, Kunti and the Pandavas return to Hastinapura. The return of the Pandavas, and being armed with numerous skills, make the Kauravas (the 100 sons of Dhritarashtra) jealous of them. 
								         The eldest Kaurava brother, Duryodhana, plots to send the Pandavas into exile.
								          Forewarned about his intentions, the Pandavas manage to foil his plan and escape from the trap set for them.
								         </p>
								         <p align="left">
								         The second volume, The Pandavas In Exile, covers events like the Rajasooya Yajna performed by the eldest Pandava Yudhisthira, and Bheemas slaying of the notorious Jarasandha. Eventually,
								          the Pandavas and Kauravas play a game of dice in which the Pandavas are defeated. 
								          They are forced into 13 years of exile, of which, they must spend the last year in disguise. 
								          When they return from the stipulated exile period to reclaim their share of the kingdom, their claim is denied by Duryodhana, 
								          laying the foundation for the subsequent Kurukshetra war.
								         </p>
								       </font>
								      
								       </div>
												
									</div>
							
										 <%		
												}
								        conn.commit();
					}
					catch(Exception e)
					{
						e.printStackTrace();
					}
					
	
	

			%>
	<br></br><br></br>
	
</div>

</body>

<%@include file="Footer.jsp" %>

</html>
<%}%>	