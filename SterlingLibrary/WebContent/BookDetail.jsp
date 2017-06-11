<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="sl_membermaster.DBManager" %>
<%@ page import="java.io.*" %>   
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Book Details</title>
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
	<div id="homemenu" align="center">
		
				<div id="menuheader" align="center">
					<h2>Book Detail<img src="images/hand.png" height="27px"></img></h2>
					<marquee behavior="alternate" direction="left" width="250px" scrolldelay="80">
					<marquee behavior="alternate" direction="down" height="20px" scrolldelay="80">
					<span class="popular">Book Detail!!!</span></marquee></marquee>
			
					
			
				</div>
				
			
			
			<form name="form" action="BuyNow.jsp" method="post" onsubmit="return validate();">
			
			
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
								    	<div style="width:100%;height:230px;">
									    	<div style="float: left; width: 30%;padding:1%">
									    		<img src="ImageRetrieve?imgid=<%=id%>" width="200x" height="200px"></img>
									    	
									    	</div>
									    	
									    	<div style="float: left; width: 30%;padding:1%; color:#af8112;line-height:3.7em">
									    		<p align="left">
									    		<span><b>Book Name:</b> <%=str1%></span>
									    		</p>
									    		<p align="left">
									    		<span><b>Category Name:</b> <%=cat%></span>
									    		</p>
									    		<p align="left"><span><b>Author Name:</b> <%=aut%></span>
									    		</p>
									    		<p align="left">
									    		<span><b>Price:</b> <%=price%></span>
									    		</p>
									    	</div>
								    	
								    		<div style="float: left; width: 30%;padding:1%; color:#af8112;line-height:1.5em">
								    			<p align="left" style="line-height:3em">
									    		<span><b>Payment Options are:</b></span>
									    		</p>
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
								    	
								    		
									
									<input type="button" value="Pdf Format" class="tableSubmitUpdatebutton" onclick="window.open('PdfRetrieve?pdid=<%=rs.getInt("book_id")%>','_blank')"/>
												<input type="button" name="id" value="Buy Now" class="tableSubmitUpdatebutton" onclick="buy(<%=rs.getInt("book_id")%>);" />
						</form>	
				
						
						<br></br>
						
									
									       <br></br>
									       <div style="border:1px solid black;">
												<h2 class="head"><u>About Author</u></h2>
												
												<p><%=rs.getString("book_author") %></p>
												<p style="text-align:justify;padding:10px">
												<%=rs.getString("book_author") %> currently serves as Executive Director of Marketing at technology, 
												a creator of advanced, innovative technologies designed to efficiently deliver 
												large files across the Internet. It is now  currently boasts over 150 million 
												active monthly users, and moves 20-40% of all Internet traffic on a daily basis.
												</p>
												
												
										</div>		
												<br></br>
												<h3><font color="blue"></font></h3>
								
										<div style="border:1px solid black;">
								      
								        
								        <h2 class="head"> <b><u>Book Description</u></b></h2>
								         <br>
								       <p style="float:left;padding-right:100px;">   Book Name:<%=rs.getString(2)%></p>
								       
								        <p style="float:right;padding-right:100px;">  Price:<%=rs.getString("book_price") %></p>
								       
								         
								         <hr></hr>
								         <br>
								          <font color=black>
								         <p style="text-align:justify;padding:10px">
								         The first volume is titled The Kuru Princes of Hastinapura. Beginning with Shantanu, King Janamejayas ancestor and the ruler of Hastinapura, this volume narrates the various events that led to the establishment of the Kuru dynasty. 
								         It leads the story to the reign of Dhritarashtra over Hastinapura while his brother Pandu has retired to the forest with his two wives Kunti and Madri and five sons (The Pandavas).
								         
								         </p>
								         <p style="text-align:justify;padding:10px">
								         Upon the death of Pandu and Madri, Kunti and the Pandavas return to Hastinapura. The return of the Pandavas, and being armed with numerous skills, make the Kauravas (the 100 sons of Dhritarashtra) jealous of them. 
								         The eldest Kaurava brother, Duryodhana, plots to send the Pandavas into exile.
								          Forewarned about his intentions, the Pandavas manage to foil his plan and escape from the trap set for them.
								         </p>
								         <p style="text-align:justify;padding:10px">
								         The second volume, The Pandavas In Exile, covers events like the Rajasooya Yajna performed by the eldest Pandava Yudhisthira, and Bheemas slaying of the notorious Jarasandha. Eventually,
								          the Pandavas and Kauravas play a game of dice in which the Pandavas are defeated. 
								          They are forced into 13 years of exile, of which, they must spend the last year in disguise. 
								          When they return from the stipulated exile period to reclaim their share of the kingdom, their claim is denied by Duryodhana, 
								          laying the foundation for the subsequent Kurukshetra war.
								         </p>
								       </font>
								      
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
	
	<br></br>
</div>

</body>

<%@include file="Footer.jsp" %>

</html>