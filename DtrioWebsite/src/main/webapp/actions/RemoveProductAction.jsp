<%@page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@page import="project.ConnectionProvider"%>
<%
try {
	String id;
	id = request.getParameter("id");
	System.out.println(id);
	Connection con=ConnectionProvider.getCon();
	
	try

	{
		PreparedStatement ps = con.prepareStatement("delete from product where productID=?");
		ps.setInt(1,Integer.parseInt(id));
		ps.executeUpdate();
		response.sendRedirect("../admin/viewproduct.jsp?msg=done");
	} catch (Exception e) {
		response.sendRedirect("../admin/viewproduct.jsp?msg=wrong");
		System.out.println(e);
	}
	
	
} catch (Exception e) {
	System.out.println(e);

}
%>