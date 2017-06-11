<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="sl_adminmaster.DBManager" %>
<%@ page import="java.io.*" %>   
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="jquery/jquery.js" type="text/javascript"></script>
</head>
<script type="text/javascript">

function Pager(tableName, itemsPerPage) {

this.tableName = tableName;

this.itemsPerPage = itemsPerPage;

this.currentPage = 1;

this.pages = 0;

this.inited = false;

this.showRecords = function(from, to) {

var rows = document.getElementById(tableName).rows;

// i starts from 1 to skip table header row

for (var i = 1; i < rows.length; i++) {

if (i < from || i > to)

rows[i].style.display = 'none';

else

rows[i].style.display = '';

}

}

this.showPage = function(pageNumber) {

if (! this.inited) {

alert("not inited");

return;

}

var oldPageAnchor = document.getElementById('pg'+this.currentPage);

oldPageAnchor.className = 'pg-normal';

this.currentPage = pageNumber;

var newPageAnchor = document.getElementById('pg'+this.currentPage);

newPageAnchor.className = 'pg-selected';

var from = (pageNumber - 1) * itemsPerPage + 1;

var to = from + itemsPerPage - 1;

this.showRecords(from, to);

}

this.prev = function() {

if (this.currentPage > 1)

this.showPage(this.currentPage - 1);

}

this.next = function() {

if (this.currentPage < this.pages) {

this.showPage(this.currentPage + 1);

}

}

this.init = function() {

var rows = document.getElementById(tableName).rows;

var records = (rows.length - 1);

this.pages = Math.ceil(records / itemsPerPage);

this.inited = true;

}

this.showPageNav = function(pagerName, positionId) {

if (! this.inited) {

alert("not inited");

return;

}

var element = document.getElementById(positionId);

var pagerHtml = '<span onclick="' + pagerName + '.prev();" class="pg-normal"> « Prev </span> ';

for (var page = 1; page <= this.pages; page++)

pagerHtml += '<span id="pg' + page + '" class="pg-normal" onclick="' + pagerName + '.showPage(' + page + ');">' + page + '</span> ';

pagerHtml += '<span onclick="'+pagerName+'.next();" class="pg-normal"> Next »</span>';

element.innerHTML = pagerHtml;

}

}

</script>

<script>
$(function() {
    $('#log_table_1.paginated').each(function() {
        var currentPage = 0;
        var numPerPage = 3;
        var $table = $(this);
        $table.bind('repaginate', function() {
            $table.find('tbody tr.recordA').hide().slice(currentPage * numPerPage, (currentPage + 1) * numPerPage).show();
        });
        $table.trigger('repaginate');
        var numRows = $table.find('tbody tr.recordA').length;
        var numPages = Math.ceil(numRows / numPerPage);
        var $pager = $('<div></div>');
        for (var page = 0; page < numPages; page++) {
            $('<span></span>').text(page + 1).bind('click', {
                newPage: page
            }, function(event) {
                currentPage = event.data['newPage'];
                $table.trigger('repaginate');
                $(this).addClass('active').siblings().removeClass('active');
            }).appendTo($pager).addClass('clickable');
        }
        $pager.insertBefore($table).find('span.page-number:first').addClass('active');
    });
    $('#log_table_2.paginated').each(function() {
        var currentPage = 0;
        var numPerPage = 5;
        var $table = $(this);
        $table.bind('repaginate', function() {
            $table.find('tbody tr.recordB').hide().slice(currentPage * numPerPage, (currentPage + 1) * numPerPage).show();
        });
        $table.trigger('repaginate');
        var numRows = $table.find('tbody tr.recordB').length;
        var numPages = Math.ceil(numRows / numPerPage);
        var $pager = $('<div></div>');
        for (var page = 0; page < numPages; page++) {
            $('<span></span>').text(page + 1).bind('click', {
                newPage: page
            }, function(event) {
                currentPage = event.data['newPage'];
                $table.trigger('repaginate');
                $(this).addClass('active').siblings().removeClass('active');
            }).appendTo($pager).addClass('clickable');
        }
        $pager.insertBefore($table).find('span.page-number:first').addClass('active');
    });
});
</script>
<style type="text/css">

.pg-normal {
color: #000000;
font-size: 15px;
cursor: pointer;
background: #D0B389;
padding: 2px 4px 2px 4px;
}

.pg-selected {
color: #fff;
font-size: 15px;
background: #000000;
padding: 2px 4px 2px 4px;
}

table.yui {
font-family:arial;
border-collapse:collapse;
border: solid 3px #7f7f7f;
font-size:small;
}

table.yui td {
padding: 5px;
border-right: solid 1px #7f7f7f;
}

table.yui .even {
background-color: #EEE8AC;
}

table.yui .odd {
background-color: #F9FAD0;
}

table.yui th {
border: 1px solid #7f7f7f;
padding: 5px;
height: auto;
background: #D0B389;
}

table.yui th a {
text-decoration: none;
text-align: center;
padding-right: 20px;
font-weight:bold;
white-space:nowrap;
}

table.yui tfoot td {
border-top: 1px solid #7f7f7f;
background-color:#E1ECF9;
}

table.yui thead td {
vertical-align:middle;
background-color:#E1ECF9;
border:none;
}

table.yui thead .tableHeader {
font-size:larger;
font-weight:bold;
}

table.yui thead .filter {
text-align:right;
}

table.yui tfoot {
background-color:#E1ECF9;
text-align:center;
}

table.yui .tablesorterPager {
padding: 10px 0 10px 0;
}

table.yui .tablesorterPager span {
padding: 0 5px 0 5px;
}

table.yui .tablesorterPager input.prev {
width: auto;
margin-right: 10px;
}

table.yui .tablesorterPager input.next {
width: auto;
margin-left: 10px;
}

table.yui .pagedisplay {
font-size:10pt; 
width: 30px;
border: 0px;
background-color: #E1ECF9;
text-align:center;
vertical-align:top;
}
</style>

<body>

<table id="tablepaging" class="yui" align="center">
<thead>
<tr> 
<th>Name </th>
<th>Major </th>
<th>Sex </th>
<th>English </th>
<th>Tamil </th>
<th>Calculus </th>
<th>Geometry </th>
</tr>
</thead>
<tbody>
<tr class="even">
<td>Student01 </td>
<td>Languages </td>
<td>M </td>
<td>80 </td>
<td>70 </td>
<td>75 </td>
<td>80 </td>
</tr>
<tr class="odd">

<td>Student02 </td>
<td>Languages </td>
<td>M </td>
<td>80 </td>
<td>70 </td>
<td>75 </td>
<td>80 </td>
</tr>
<tr class="even">
<td>Student01 </td>
<td>Languages </td>
<td>M </td>
<td>80 </td>
<td>70 </td>
<td>75 </td>
<td>80 </td>
</tr>
<tr class="odd">

<td>Student02 </td>
<td>Languages </td>
<td>M </td>
<td>80 </td>
<td>70 </td>
<td>75 </td>
<td>80 </td>
</tr>
<tr class="even">
<td>Student01 </td>
<td>Languages </td>
<td>M </td>
<td>80 </td>
<td>70 </td>
<td>75 </td>
<td>80 </td>
</tr>
<tr class="odd">

<td>Student02 </td>
<td>Languages </td>
<td>M </td>
<td>80 </td>
<td>70 </td>
<td>75 </td>
<td>80 </td>
</tr>
<tr class="even">
<td>Student01 </td>
<td>Languages </td>
<td>M </td>
<td>80 </td>
<td>70 </td>
<td>75 </td>
<td>80 </td>
</tr>
<tr class="odd">

<td>Student02 </td>
<td>Languages </td>
<td>M </td>
<td>80 </td>
<td>70 </td>
<td>75 </td>
<td>80 </td>
</tr>
<tr class="even">
<td>Student01 </td>
<td>Languages </td>
<td>M </td>
<td>80 </td>
<td>70 </td>
<td>75 </td>
<td>80 </td>
</tr>
<tr class="odd">

<td>Student02 </td>
<td>Languages </td>
<td>M </td>
<td>80 </td>
<td>70 </td>
<td>75 </td>
<td>80 </td>
</tr>
<tr class="even">
<td>Student01 </td>
<td>Languages </td>
<td>M </td>
<td>80 </td>
<td>70 </td>
<td>75 </td>
<td>80 </td>
</tr>
<tr class="odd">

<td>Student02 </td>
<td>Languages </td>
<td>M </td>
<td>80 </td>
<td>70 </td>
<td>75 </td>
<td>80 </td>
</tr>


</tbody>
</table>
<div id="pageNavPosition" style="padding-top: 20px" align="center">
</div>
<script type="text/javascript"><!--
var pager = new Pager('tablepaging', 5);
pager.init();
pager.showPageNav('pager', 'pageNavPosition');
pager.showPage(1);
</script>

	<table class="logtable paginated" id="log_table_1">
<h2>Table 1</h2>
<thead>
<tr>
<th>A</th>
<th>B</th>
<th>C</th>
<th>D</th>
</tr>
</thead>
<tbody>
<tr class="recordA">
<td>1</td>
<td>2</td>
<td>3</td>
<td>4</td>
</tr>
<tr class="recordA">
<td>5</td>
<td>6</td>
<td>7</td>
<td>8</td>
</tr>
<tr class="recordA">
<td>9</td>
<td>10</td>
<td>11</td>
<td>12</td>
</tr>
<tr class="recordA">
<td>13</td>
<td>14</td>
<td>15</td>
<td>16</td>
</tr>
<tr class="recordA">
<td>17</td>
<td>18</td>
<td>19</td>
<td>20</td>
</tr>
</tbody>
</table>
<form id="frm" action="BookDeleteAction" method="post" onsubmit="return doUpdate();">					
				<table id="tablepaging" class="yui" align="center">
					<h2>Table 1</h2>
							
								<%
														
									
								%><thead>
								<tr bgcolor="#808080">
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
															
												
														
														</tr> </thead><tbody>  
  <% 
								
										
										Statement st1 = null;
								  Statement st2 = null;
										PreparedStatement ps1=null;
										String s=request.getParameter("catname");
										int results = 0;
										try {
													Connection conn=null;
													
													conn = DBManager.getConnection();
														st1 = conn.createStatement();
														st2 = conn.createStatement();
														
														
														if(s!=null && s!="")
														{
														ResultSet rs1 = st1.executeQuery("select * from sl_bookmaster where cat_name='"+s+"'");
														ResultSetMetaData rsmd1=rs1.getMetaData();
														int colcount1=rsmd1.getColumnCount();
													
														int sno=0;
														/* rs1.next(); 
													        rs1.getString(1);
													        rs1.previous();*/
													      %>  <%
														while(rs1.next())
														{
															results++;
																sno++;
																%>
																<tr class="recordA">
															
																<td align="left"><%=sno%></td>
																<td align="center"><input type="checkbox" name="select" value="<%=rs1.getInt(1)%>"></td>
																<td align="center"><%=rs1.getString("book_name")%></td>
																<td><img src="ImageRetrieve?imgid=<%=rs1.getInt("book_id")%>" height="50px" width="50px"/></td>
															
																<td align="center"><%=rs1.getString("cat_name")%></td>
																<td align="center"><%=rs1.getString("book_author")%></td>
																<td align="center"><%=rs1.getString("book_desc")%></td>
																<td align="left"><%=rs1.getString("book_price")%></td>
																<td align="center"><%=rs1.getString("created_on")%></td>
						
																<td>
																	<input type="button" name="edit" value="Edit" class="btn" onclick="editRecord('EditBook.jsp?id=<%=rs1.getInt("book_id")%>')" />
																	<%-- <input type="button" name="delete" value="Delete" class="btn1" onclick="deleteRecord(<%=rs1.getInt("book_id")%>)" /></td> --%>
																
															</tr>
												<%
														}
													        %> <%
														if(results == 0) 
														{  

															out.println("<tr><td>The Record Was Not Found</td></tr>");
								                            //out.print("<h2>The record was not found.<h2>");  
								                        }  
												}
												else
												{
															ResultSet rs3 = st1.executeQuery("select * from sl_bookmaster");
															ResultSetMetaData rsmd3=rs3.getMetaData();
															int colcount3=rsmd3.getColumnCount();
														
															int sno2=0;
													
															while(rs3.next())
															{
																results++;
																	sno2++;
																	%>
																	<tr>
																	<td align="left"><%=sno2%></td>
																	<td align="center"><input type="checkbox" name="select" value="<%=rs3.getInt(1)%>"></td>
																	<td align="center"><%=rs3.getString("book_name")%></td>
																	<td><img src="ImageRetrieve?imgid=<%=rs3.getInt("book_id")%>" height="50px" width="50px"/></td>
																
																	<td align="center"><%=rs3.getString("cat_name")%></td>
																	<td align="center"><%=rs3.getString("book_author")%></td>
																	<td align="center"><%=rs3.getString("book_desc")%></td>
																	<td align="left"><%=rs3.getString("book_price")%></td>
																	<td align="center"><%=rs3.getString("created_on")%></td>
																	
							

																	<td><input type="button" name="edit" value="Edit" class="btn" onclick="editRecord('EditBook.jsp?id=<%=rs3.getInt("book_id")%>')" >
																	<%-- <input type="button" name="delete" value="Delete" class="btn1" onclick="deleteRecord(<%=rs3.getInt("book_id")%>)" ></td> --%>
																	
																	</tr>
															<%
													}
															if(results == 0) 
															{  

																out.println("<tr><td>The Record Was Not Found</td></tr>");
									                            //out.print("<h2>The record was not found.<h2>");  
									                        }  		
												
												}
													conn.commit();
										}
										
										catch(Exception e)
										{
										out.println(e.toString());
										}
										%>	 </tbody> 
									
					</table>
					
					<div id="pageNavPosition" style="padding-top: 20px" align="center">
</div>
<script type="text/javascript"><!--
var pager = new Pager('tablepaging', 5);
pager.init();
pager.showPageNav('pager', 'pageNavPosition');
pager.showPage(1);
</script>
					<br></br>
						<input type="submit" value="Delete" class="tableSubmitUpdatebutton">
					</form>
					
 <table class="logtable paginated" id="log_table_2">
<h2>Table 2</h2>
<thead>
<tr>
<th>A</th>
<th>B</th>
<th>C</th>
<th>D</th>
</tr>
</thead>
<tbody>
<tr class="recordB">
<td>A</td>
<td>B</td>
<td>C</td>
<td>D</td>
</tr>
<tr class="recordB">
<td>E</td>
<td>F</td>
<td>G</td>
<td>H</td>
</tr>
<tr class="recordB">
<td>I</td>
<td>J</td>
<td>K</td>
<td>L</td>
</tr>
<tr class="recordB">
<td>M</td>
<td>N</td>
<td>O</td>
<td>P</td>
</tr>
<tr class="recordB">
<td>Q</td>
<td>R</td>
<td>S</td>
<td>T</td>
</tr>
<tr class="recordB">
<td>U</td>
<td>V</td>
<td>W</td>
<td>X</td>
</tr>
<tr class="recordB">
<td>Y</td>
<td>Z</td>
<td>A1</td>
<td>B1</td>
</tr>
</tbody>
</table>
</body>
</html>