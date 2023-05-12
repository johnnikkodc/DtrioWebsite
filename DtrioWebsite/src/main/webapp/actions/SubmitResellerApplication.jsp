<%@page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@page import="project.ConnectionProvider"%>
<%@page import="project.Encryption"%>
<%
try {
	String secretKey = "DTRIOCOFFEESYRUP";
	Encryption e=new Encryption();
	e.setKey(secretKey);
	String name,birthday,mobile,religion,address,email,gender,relationship,education,occupation,picid,x1,a1,a2,a3,a4;
	name = request.getParameter("name");
	birthday = request.getParameter("birthday");
	mobile = request.getParameter("mobile");
	religion = request.getParameter("religion");
	address = request.getParameter("address");
	email = request.getParameter("email");
	gender = request.getParameter("gender");
	relationship = request.getParameter("relationship");
	education = request.getParameter("education");
	occupation = request.getParameter("occupation");
	picid = request.getParameter("picid");
	x1 = request.getParameter("1x1");
	a1 = request.getParameter("a1");
	a2 = request.getParameter("a2");
	a3 = request.getParameter("a3");
	a4 = request.getParameter("a4");
	

	Connection con=ConnectionProvider.getCon();
	try

	{
		PreparedStatement ps = con.prepareStatement("insert into resellerapplication values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
		ps.setInt(1, 0);
		ps.setString(2, e.encrypt(name, secretKey));
		ps.setString(3, e.encrypt(mobile, secretKey));
		ps.setString(4, e.encrypt(religion, secretKey));
		ps.setString(5, e.encrypt(address, secretKey));
		ps.setString(6, e.encrypt(email, secretKey));
		ps.setString(7, e.encrypt(gender, secretKey));
		ps.setString(8, e.encrypt(relationship, secretKey));
		ps.setString(9, e.encrypt(education, secretKey));
		ps.setString(10, e.encrypt(occupation, secretKey));
		ps.setString(11, e.encrypt(picid, secretKey));
		ps.setString(12, e.encrypt(x1, secretKey));
		ps.setString(13, e.encrypt(a1, secretKey));
		ps.setString(14, e.encrypt(a2, secretKey));
		ps.setString(15, e.encrypt(a3, secretKey));
		ps.setString(16, e.encrypt(a4, secretKey));
		ps.setString(17, e.encrypt(birthday, secretKey));
		ps.executeUpdate();
		response.sendRedirect("../store/resellerapplication.jsp?msg=resellersuccess");
	} catch (Exception ex) {
		response.sendRedirect("../store/resellerapplication.jsp?msg=resellerfailed");
		System.out.println(ex);
	}

} catch (Exception e) {
	response.sendRedirect("../store/resellerapplication.jsp?msg=failed");
	System.out.println(e);

}
%>