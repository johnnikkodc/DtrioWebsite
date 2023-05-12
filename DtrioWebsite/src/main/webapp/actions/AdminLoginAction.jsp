<%@page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@page import="project.Encryption"%>
<%@page import="project.ConnectionProvider"%>
<%
try {
	String email, password;
	email = request.getParameter("email");
	password = request.getParameter("password");
	String secretKey = "DTRIOCOFFEESYRUP";
	Encryption e = new Encryption();
	e.setKey(secretKey);

	Connection con=ConnectionProvider.getCon();
	
	try

	{
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from admin where email='" + e.encrypt(email, secretKey)
		+ "'and password='" + e.encrypt(password, secretKey) + "'");
		int z = 0;
		while (rs.next()) {
	z = 1;
	session.setAttribute("loggedInUser", email);
	response.sendRedirect("../admin/adminIndex.jsp");
		}
		if (z == 0) {
	response.sendRedirect("../admin/login.jsp?msg=loginnotexist");

		}

	} catch (Exception ex) {
		response.sendRedirect("../admin/login.jsp?msg=loginfailed");
		System.out.println(ex);
	}

} catch (Exception e) {
	System.out.println(e);

}
%>