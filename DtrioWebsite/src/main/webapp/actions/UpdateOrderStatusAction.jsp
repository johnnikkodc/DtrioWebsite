<%@page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@page import="project.ConnectionProvider"%>
<%
try {
	String id, relationship;
	id = request.getParameter("id");
	relationship = request.getParameter("relationship");
	

	Connection con=ConnectionProvider.getCon();
	try

	{
		PreparedStatement ps = con.prepareStatement(
		"update orders set status=? where orderID=?");
		ps.setString(1, relationship);
		ps.setInt(2, Integer.parseInt(id));
		ps.executeUpdate();
		response.sendRedirect("../admin/manageorder.jsp?msg=done");
	} catch (Exception e) {
		response.sendRedirect("../admin/manageorder.jsp?msg=wrong");
		System.out.println(e);
	}
} catch (Exception e) {
	System.out.println(e);

}
%>