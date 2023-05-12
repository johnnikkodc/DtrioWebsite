<%@page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@page import="project.ConnectionProvider"%>
<%
try {
	String reply,id;
	reply = request.getParameter("reply");
	id = request.getParameter("id");


	Connection con=ConnectionProvider.getCon();


	try

	{
		PreparedStatement ps = con.prepareStatement(
		"update feedbacks set feedbackreply=? where feedbackID=?");
		ps.setString(1, reply);
		ps.setInt(2, Integer.parseInt(id));
		ps.executeUpdate();
		response.sendRedirect("../admin/managefeedback.jsp?msg=done");
	} catch (Exception e) {
		response.sendRedirect("../admin/managefeedback.jsp?msg=wrong");
		System.out.println(e);
	}
} catch (Exception e) {
	System.out.println(e);

}
%>