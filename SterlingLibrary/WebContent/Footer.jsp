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

<link href="css/slider.css" rel="stylesheet" type="text/css" />
</head>
<body>
<!-- <div>
<div class="footer">
    <a href="Home.jsp">Home</a> |   
    <a href="Home.jsp">Sterling Library Books</a> | 
    <a href="#">Policies</a> | 
    <a href="#">Live Chat</a> | 
    <a href="#">SEO</a><br />Copyright © 2013 
    <a href="#"><strong>Sterling Technologies</strong></a>
 
 <div align="right" style="margin-bottom:10px;">
 
<ul>
 
<li>Our Contact Details !</li>

   <li> Sterling Technologies</li>
    <li>79/A,2nd floor,24th Main</li>
    <li>JP Nagar,2nd Phase</li>
    <li>Opp.LIC Building,Bangalore-560078</li>
    <li>Tel:080-26594348 / 9141802197</li>
    <li>www.sterlingtechnologies.co.in</li>
    <li>Email: info@sterlingtechnologies.co.in</li>

 
 </ul>
 
 </div>
</div>
 </div> -->
 <!-- 
 <div id="footer">
		<div>
			<div id="links">
				<div class="showroom">
					<h4><b>Our Contact Details</b></h4>
					
					<p>
						Sterling Technologies<br>79/A,2nd floor,24th Main<br> JP Nagar,2nd Phase<br> Opp.LIC Building,Bangalore-560078 <br>Tel:080-26594348 / 9141802197<br><br><a href="home.jsp">www.sterlingtechnologies.co.in</a><br><br>Email: info@sterlingtechnologies.co.in
					</p>
				</div>
				<div>
					<h4><b>CONTENTS</b></h4>
					<ul class="posts">
						<li>
					<a href="index.html">Home</a>
				</li>
				<li>
					<a href="about.html">About Us</a>
				</li>
				<li>
					<a href="gallery.html">Login</a>
				</li>
				<li>
					<a href="blog.html">Sign Up</a>
				</li>
				<li>
					<a href="contact.html">Contact Us</a>
				</li>
					</ul>
				</div>
				<div>
					
					<div id="connect">
						<h4><b>Social Media</b></h4>
						<a href="#" target="_blank" class="facebook"></a> <a href="#" target="_blank" class="googleplus"></a> <a href="#" target="_blank" class="twitter"></a>
					</div>
				</div>
			</div>
			<center>
			<p id="footnote">
				 Copyright @ Sterling Library.  All Rights Reserved.
			</p>
			</center>
		</div>
	</div> -->
 <!-- Side Full -->
  <div class="side-full">
    <!-- More Products -->
   <%--  <div class="more-products">
      <div class="more-products-holder">
        <ul>
          <li><%

							try{    
									Connection conn=null;
									
									conn = DBManager.getConnection();	
								  
								    Statement stmt=conn.createStatement();
					       
					    	
							    	String strQuery = "select * from sl_bookmaster";
							        ResultSet rs3 = stmt.executeQuery(strQuery); 
							        int r=1;
							        
							        
							        while(rs3.next())
							        {
							        	%>
													    			
								     			 <a href="BookDetail.jsp?id=<%=rs3.getInt("book_id")%>"><img src="ImageRetrieve?imgid=<%=rs3.getInt("book_id")%>" width="120x" height="120px"/></a>
								        
								    			  								       
								
												
					 <%
								 		
									}
									
									conn.commit();
									}
									catch(Exception e)
									{
										e.getMessage();
									}
								
                     %></li>
         <!--  <li><a href="#"><img src="css/images/cane3.jpg"  width="105px" height="94px" alt="" /></a></li>
          <li><a href="#"><img src="css/images/cane5.jpg"  width="105px" height="94px" alt="" /></a></li>
          <li><a href="#"><img src="css/images/cane17.jpg"  width="105px" height="94px" alt="" /></a></li>
          <li><a href="#"><img src="css/images/cane19.jpg"  width="105px" height="94px" alt="" /></a></li>
          <li><a href="#"><img src="css/images/cane27.jpg"  width="105px" height="94px" alt="" /></a></li>
          <li><a href="#"><img src="css/images/cane44.jpg"  width="105px" height="94px" alt="" /></a></li>
          <li><a href="#"><img src="css/images/cane50.jpg"  width="105px" height="94px" alt="" /></a></li>
          <li><a href="#"><img src="css/images/cane63.jpg"  width="105px" height="94px" alt="" /></a></li>
          <li><a href="#"><img src="css/images/cane73.jpg"  width="105px" height="94px" alt="" /></a></li>
          <li><a href="#"><img src="css/images/cane77.jpg"  width="105px" height="94px" alt="" /></a></li>
          <li><a href="#"><img src="css/images/cane89.jpg"  width="105px" height="94px" alt="" /></a></li>
          <li><a href="#"><img src="css/images/cane92.jpg"  width="105px" height="94px" alt="" /></a></li>
          <li><a href="#"><img src="css/images/cane94.jpg"  width="105px" height="94px" alt="" /></a></li>
          <li><a href="#"><img src="css/images/cane109.jpg"  width="105px" height="94px" alt="" /></a></li>
          <li><a href="#"><img src="css/images/cane110.jpg"  width="105px" height="94px" alt="" /></a></li>
          <li><a href="#"><img src="css/images/cane112.jpg"  width="105px" height="94px" alt="" /></a></li>
          <li><a href="#"><img src="css/images/cane146.jpg"  width="105px" height="94px" alt="" /></a></li>
          <li><a href="#"><img src="css/images/cane149.jpg"  width="105px" height="94px" alt="" /></a></li>
          <li><a href="#"><img src="css/images/cane164.jpg"  width="105px" height="94px" alt="" /></a></li>
          <li><a href="#"><img src="css/images/cane122.jpg"  width="105px" height="94px" alt="" /></a></li>
          <li><a href="#"><img src="css/images/cane127.jpg"  width="105px" height="94px" alt="" /></a></li>
          <li><a href="#"><img src="css/images/cane124.jpg"  width="105px" height="94px" alt="" /></a></li>
          <li><a href="#"><img src="css/images/cane102.jpg"  width="105px" height="94px" alt="" /></a></li> -->
          
          
        </ul>
      </div>
      <div class="more-nav"> <a href="#" class="prev">previous</a> <a href="#" class="next">next</a> </div>
    </div>  --%>
    <!-- End More Products -->
<!-- Text Cols -->
    <div class="cols">
      <div class="cl">&nbsp;</div>
      <div class="col">
        <h3 class="ico ico2">Contact Us</h3>
        <p>Sterling Technologies</p>
		<p>79/A,2nd floor,24th Main</p>
		<p>JP Nagar,2nd Phase</p>
		<p>Opp.LIC Building,Bangalore-560078</p>
		<p>Tel:080-26594348 / 9141802197</p>
        <p class="more"><a href="http://www.sterlingtechnologies.co.in" class="bul">www.sterlingtechnologies.co.in</a></p>
      </div>
      <div class="col">
        <h3 class="ico ico3">Special Offers</h3>
        <p>5 years warranty for all products.</p>
        <p>Exciting Coupons on each buy.</p>
        <p>and many more....</p>
      </div>
      <div class="col col-last">
        <h3 class="ico ico4">New Arrivals</h3>
        <p>Check out latest arrivals </p><p>with newest design and furnishing.</p>
        <p class="more"><a href="New_Arrivals.jsp" class="bul">New Arrivals</a></p>
      </div>
      <div class="cl">&nbsp;</div>
    </div>
    <!-- End Text Cols -->
  </div>
  <!-- End Side Full -->
  <!-- Footer -->
  <div id="footer">
    <p class="left"> <a href="Home.jsp">Home</a> <span>|</span> <a href="AboutUs.jsp">About</a> <span>|</span> <a href="Home.jsp">Products</a> <span>|</span> <a href="Contactus.jsp">Contact</a> </p>
    <div><a href="#top" style="float:right;"><img width="85" height="70"  src="images/arrowtop.jpg"></img></a></div>
  </div>
  <!-- End Footer -->
</body>
</html>