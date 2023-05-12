<%@page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@page import="project.ConnectionProvider"%>
<%
try {
	String id, question, answer;
	id = request.getParameter("id");
	System.out.println(id);
	question = request.getParameter("question");
	answer = request.getParameter("answer");

	Connection con=ConnectionProvider.getCon();

	try

	{
		PreparedStatement ps = con.prepareStatement("update faq set FAQ_q=?, FAQ_a=? where contentID=?");
		ps.setString(1, question);
		ps.setString(2,answer);
		ps.setInt(3,Integer.parseInt(id));
		ps.executeUpdate();
		response.sendRedirect("../admin/editfaq.jsp?msg=done");
	} catch (Exception e) {
		response.sendRedirect("../admin/editfaq.jsp?msg=wrong");
		System.out.println(e);
	}
} catch (Exception e) {
	System.out.println(e);

}
%>