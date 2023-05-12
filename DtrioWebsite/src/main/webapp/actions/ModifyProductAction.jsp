<%@page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@page import="project.ConnectionProvider"%>
<%
try {
	String id, name, price, details, quantity, expiration, photo1, photo2, photo3, photo4, photo5;
	id = request.getParameter("id");
	name = request.getParameter("name");
	price = request.getParameter("price");
	details = request.getParameter("details");
	quantity = request.getParameter("quantity");
	expiration = request.getParameter("expiration");
	photo1 = request.getParameter("photo1");
	photo2 = request.getParameter("photo2");
	photo3 = request.getParameter("photo3");
	photo4 = request.getParameter("photo4");
	photo5 = request.getParameter("photo5");

	Connection con=ConnectionProvider.getCon();

	try

	{
		PreparedStatement ps = con.prepareStatement(
		"update product set productName=?, productPrice=?, productDet=?, quantity=?, exp_date=? where productID=?");
		ps.setString(1, name);
		ps.setInt(2, Integer.parseInt(price));
		ps.setString(3, details);
		ps.setInt(4, Integer.parseInt(quantity));
		ps.setString(5, expiration);
		ps.setInt(6, Integer.parseInt(id));
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