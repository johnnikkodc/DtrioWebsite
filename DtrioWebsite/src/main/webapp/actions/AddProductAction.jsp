<%@page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@page import="project.ConnectionProvider"%>

<%

try {
	String id, name, price, details, quantity, expiration, photo,category;
	id = request.getParameter("ID");
	name = request.getParameter("name");
	price = request.getParameter("price");
	details = request.getParameter("details");
	quantity = request.getParameter("quantity");
	expiration = request.getParameter("expiration");
	photo = request.getParameter("photo");
	category = request.getParameter("category");
	
	
	Connection con=ConnectionProvider.getCon();

	try

	{
		PreparedStatement ps = con.prepareStatement("insert into product values(?,?,?,?,?,?,?,?,?,?,?)");
		ps.setInt(1, 0);
		ps.setString(2, name);
		ps.setInt(3, Integer.parseInt(price));
		ps.setString(4, details);
		ps.setString(5, photo);
		ps.setInt(6, Integer.parseInt(quantity));
		ps.setString(7, expiration);
		ps.setString(8, price);
		ps.setString(9, "high");
		ps.setString(10, "visible");
		ps.setString(11, category);
		ps.executeUpdate();
		response.sendRedirect("../admin/addproduct.jsp?msg=done");
	} catch (Exception e) {
		response.sendRedirect("../admin/addproduct.jsp?msg=wrong");
		System.out.println(e);
	}

} catch (Exception e) {
	System.out.println(e);

}
%>