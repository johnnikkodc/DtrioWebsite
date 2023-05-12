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
		PreparedStatement ps = con.prepareStatement("delete from cart where transactionID=?");
		ps.setInt(1,Integer.parseInt(id));
		ps.executeUpdate();
		response.sendRedirect("../store/cart.jsp?msg=productdeleted");
	} catch (Exception e) {
		response.sendRedirect("../store/cart.jsp?msg=error");
		System.out.println(e);
	}
	
	
} catch (Exception e) {
	System.out.println(e);

}
%>