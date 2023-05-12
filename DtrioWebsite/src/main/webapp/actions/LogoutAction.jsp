
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.http.*"%>

<%
HttpSession ses = request.getSession(false);
ses.removeAttribute("loggedInUser");
response.sendRedirect("../store/index.jsp");
%>