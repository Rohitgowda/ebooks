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
<jsp:include page="Header.jsp"/>

<script type="text/javascript">

			function popUpClosed() 
			{
			    window.location.reload();
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



<div id="homemenu">
		<div id="menuheader" align="center"><h2>Payment Option</h2></div>
		<center>
	<i><font size="2" color="green">
	${me}
				<%
					request.getSession().removeAttribute("me");
				%>
				
				</font></i></center>
	
	
	     <div class="tabbed_area">  
              <table><tr><td> 
           
         <script src="js/functions.js" type="text/javascript"></script>   
		<ul class="tabs" type="none">  
		    <li type="none"><a href="javascript:tabSwitch('tab_1', 'content_1');" id="tab_1" class="active">Cash</a></li>  
		   <!--  <li><a href="javascript:tabSwitch('tab_2', 'content_2');" id="tab_2">NetBanking</a></li>  
		    <li><a href="javascript:tabSwitch('tab_3', 'content_3');" id="tab_3">CreditCard</a></li>   -->
		</ul>  
              
            <div id="content_1" class="content">  
                
                <form action="OrderUploadAction" method="post">
                <%
	                String bname=request.getParameter("bname");
	                String category=request.getParameter("category");
	                String author=request.getParameter("author");
	                String qty=request.getParameter("qty");
	                String price=request.getParameter("price");
	                String total=request.getParameter("total");
	                
	                
                
				%>
				
			<input type="hidden" name="name" value="<%=bname%>"/>
       		 <input type="hidden" name="total" value="<%=total%>"/>
       		 <input type="hidden" name="qty" value="<%=qty%>"/>
       		 <input type="hidden" name="price" value="<%=price%>"/>
       		 <input type="hidden" name="category" value="<%=category%>"/>
       		 <ul  type="none">  
                  <li type="none">Pay Using Cash on Delivery</li>
                  </ul>
                  <font color="black" size="2">
                  <span></span>Amount Payable on Delivery:  <%=total %>
                  </font>
                  <div align="center" style="border: 1px solid maroon;margin: 20px;">
                 
                 <input type="submit" id="button2" class="tableSubmitUpdatebutton" onclick="" value="PAY"/>
                  </div>
                  </form>
                </ul>  
            </div>  
            
            
                    
        
        <td><div class="addr">
        <div class="add"> 
        <div  align="center" class="addt"><b></b>OrderSummary</div></div>
        <t>Quantity:</t><%=qty %>
        <br/>
        <t>SubTotal:</t><%=price %>
        <br/>           
        <t>GrandTotal:</t><%=total %>                    
       
        <br/>
       
        <br>
        <br/>
      
      

        <%
        session.getAttribute("n");
        try{
        	HttpSession s=request.getSession();
			String user=(String)s.getAttribute("username");
			DBManager d=new DBManager();
			Connection con=d.getConnection();
			Statement st=con.createStatement();
      		 Statement stmt=con.createStatement();
       		ResultSet rs1=stmt.executeQuery("select * from sl_membermaster where mem_username='"+user+"'");
      		rs1.next();
           
       %> 
         
       
        <input type="button" name="verification" value="Verification of Address" class="btn2" onclick="return poup('VerifyAddress.jsp')"/>
        <i><font size=2 color="green">
				<%
					if(request.getAttribute("addr")!=null)
						
					  out.println(request.getAttribute("addr"));
					  else
					  out.println("");
				%>
				
				</font></i></div>
        <table>
        <tr>
       <tr><td> Address:<%=rs1.getString(6) %></td></tr>
       <tr><td> City:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=rs1.getString(7) %></td></tr>
        
          <tr> <td>Mobile:&nbsp;<%=rs1.getString(5) %></td></tr>
             <tr><td>Pincode:<%=rs1.getString(8) %></td>
            </tr> 
             </table>
        <%}
        catch(Exception e)
        {
        e.printStackTrace();
        }%>
        </div>
        
      
        </div>
     </table>
    </div>
    <br></br>
    <br></br>
    </div>
    
</body>

<%@include file="Footer.jsp" %>
</html>

<%}%>	