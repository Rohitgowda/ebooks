
<%
request.getSession().removeAttribute("username");
session.removeAttribute("username");
session.removeAttribute("password");
session.invalidate();

RequestDispatcher dis=request.getRequestDispatcher("Home.jsp");
//session.invalidate();
dis.forward(request,response);

%>
