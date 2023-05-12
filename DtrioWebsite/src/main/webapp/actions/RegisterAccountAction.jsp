<%@page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@page import="project.Encryption"%>
<%@page import="project.ConnectionProvider"%>
<%
try {
	String fname,lname,address,email,number,password;
	fname = request.getParameter("fname");
	lname = request.getParameter("lname");
	address = request.getParameter("address");
	email = request.getParameter("email");
	number = request.getParameter("number");
	password = request.getParameter("password");
	

	Connection con=ConnectionProvider.getCon();

	try

	{
		String secretKey = "DTRIOCOFFEESYRUP";
		Encryption e=new Encryption();
		e.setKey(secretKey);
		
		PreparedStatement ps = con.prepareStatement("insert into users values(?,?,?,?,?,?,?)");
		ps.setInt(1, 0);
		ps.setString(2, email);
		ps.setString(3, password);
		ps.setString(4, fname);
		ps.setString(5, lname);
		ps.setString(6, e.encrypt(address, secretKey));
		ps.setString(7, e.encrypt(number, secretKey));
		ps.executeUpdate();
		response.sendRedirect("../store/login.jsp?msg=registert");
	} catch (Exception e) {
		response.sendRedirect("../store/register.jsp?msg=registerf");
		System.out.println(e);
	}

} catch (Exception e) {
	System.out.println(e);

}
%>