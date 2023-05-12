<%@page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@page import="project.ConnectionProvider"%>
<%
try {
	String id;
	id = request.getParameter("id");
	Connection con=ConnectionProvider.getCon();

	
	try

	{
		PreparedStatement ps = con.prepareStatement("delete from resellerapplication where applicationID=?");
		ps.setInt(1,Integer.parseInt(id));
		ps.executeUpdate();
		response.sendRedirect("../admin/managereseller.jsp?msg=done");
	} catch (Exception e) {
		response.sendRedirect("../admin/managereseller.jsp?msg=wrong");
		System.out.println(e);
	}
	
	
} catch (Exception e) {
	System.out.println(e);

}
%>