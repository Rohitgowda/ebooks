<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import ="java.io.*" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%String id=(String)request.getParameter("id"); %>
<script type="text/javascript">
	 function closeWin() 
	{
		   window.close();
		   window.open('PdfRetrieve?pdid=<%=id%>');
	} 
	 function closeWin1() 
		{
			   window.close();
			  
		} 
		
	
	function check() {
		var r = document.getElementsByName("memoption");
		var memoption = -1

		for(var i=0; i < r.length; i++){
		   if(r[i].checked) {
			   memoption = i; 
			   window.onunload = function() 
				{
				    if (window.opener && !window.opener.closed) 
				    {
				    	
				        window.opener.popUpClosed();
				        window.close();
				    }
				   	
				};
		   }
		}
		if (memoption == -1) 
		{
			alert("Please select any payment option");
			return false;
		}
		
		}
</script>
</head>
<body bgcolor="#E8E8E8">

		
	
	
		
		<div align="center">
		<form id="form1" action="PdfRetrieve" method="post" onsubmit="check()">
		
		
       		
       		 
			
          <br></br>
          
          <span><h5>Pay Hundred Rupees to DownLoad this Book</h5></span>
          <br></br>
          
      
	          	<table align="center">
				   	<tr>  		
						<td align="center"><img src="images/index1.jpg" width="45px" height="40px" /></td>
					</tr>
					<tr>
						<td><input type="radio" name="memoption" value="mem1"/><span>Download it : Rs.100</span></td>
				   	</tr>
				</table>  
		

     <br></br>
     
    
           <input type="submit"   value="Pdf format" onclick="if(closeWin()){window.open('PdfRetrieve?pdid=<%=id%>')}"onfocus="return check();">
        
          <input type="button" value="Cancel" name="cancel" onclick="return closeWin1();"/>
          </form>
          
	
          <div align="right">
         	<table>
				<tr>
				<td>
					<img src="images/Visa.png" width="30px" height="20px" />
					<img src="images/Maestro.png" width="30px" height="20px" />
					</td>
				</tr>
				<tr>
				<td>
					<img src="images/Mastercard.png" width="30px" height="20px" />
					<img src="images/PayPal.png" width="30px" height="20px" />
				</td>
				</tr>
			</table>
</div>
</div>
		
	
</body>
</html>