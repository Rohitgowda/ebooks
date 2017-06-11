/*<jsp:include page="index.jsp"/>*/
<%
 if(session!=null)
 {
	 
	 request.getSession().removeAttribute("upsuccess");
	    request.getSession().removeAttribute("del");
	 request.getSession().removeAttribute("mes");
		request.getSession().removeAttribute("e2");
		request.getSession().removeAttribute("d");
session.invalidate();
 }

RequestDispatcher dis=request.getRequestDispatcher("index.jsp");
//session.invalidate();
dis.forward(request,response);

%>
