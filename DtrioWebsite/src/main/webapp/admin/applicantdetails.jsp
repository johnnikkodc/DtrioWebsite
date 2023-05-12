<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="project.Encryption"%>
<%@page import="javax.servlet.http.*"%>
<!DOCTYPE html>
<html>
<head>
<%
HttpSession ses = request.getSession(false);
if (ses == null || ses.getAttribute("loggedInUser") == null) {
	response.sendRedirect("login.jsp");
%>
<%
} else {
%>
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>

<meta charset="ISO-8859-1">
<title>Applicant Details</title>
<%@include file="headerAdmin.jsp"%>
</head>
<body>
	<br>
	<br>
	<br>
	<br>
	<center>
		<h1>Applicant Details</h1>
		<h3>
			Applicant ID
			<%
		String id = request.getParameter("id");
		if (request.getParameter("id") != null) {
			out.println(id);
		}
		%>

		</h3>
	
	<%
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/d'trio", "root", "admin");
		String secretKey = "DTRIOCOFFEESYRUP";
		Encryption en = new Encryption();
		en.setKey(secretKey);
		PreparedStatement ps = con.prepareStatement("select * from resellerapplication where applicationID=?");
		ps.setInt(1, Integer.parseInt(id));
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
	%>
	<form action="managereseller.jsp" class="container  row g-3 my-4 mx-5 ">

		<div class="col-md-6 my-1">
			<label for="inputName" class="form-label">Name</label> <input
				type="text" class="form-control"
				value="<%=en.decrypt(rs.getString(2),secretKey)%>" disabled>
		</div>
		<div class="col-md-6 my-1">
			<label for="inputBday" class="form-label">Birthday</label> <input
				type="text" class="form-control" value="<%=en.decrypt(rs.getString(17),secretKey)%>"  disabled>
		</div>
		<div class="col-md-6 my-1">
			<label for="inputNum" class="form-label">Mobile Number</label> <input
				type="text" class="form-control" 
				value="<%=en.decrypt(rs.getString(3),secretKey)%>" disabled>
		</div>
		<div class="col-md-6 my-1">
			<label for="inputRel" class="form-label">Religion</label> <input
				type="text" class="form-control" value="<%=en.decrypt(rs.getString(4),secretKey)%>"  disabled>
		</div>
		<div class="col-12 my-1">
			<label for="inputAddress" class="form-label">Home Address</label> <input
				type="text" class="form-control" 
				value="<%=en.decrypt(rs.getString(5),secretKey)%>" disabled>
		</div>
		<div class="col-md-6 my-1">
			<label for="inputEmail" class="form-label">Email Address</label> <input
				type="text" class="form-control" 
				value="<%=en.decrypt(rs.getString(6),secretKey)%>" disabled>
		</div>
		<div class="col-md-3 my-1 ">
			<label for="inputGender" class="form-label">Gender</label> <input
				type="text" value="<%=en.decrypt(rs.getString(7),secretKey)%>" class="form-control"  disabled>

		</div>

		<div class="col-md-3 my-1">
			<label for="inputGender" class="form-label">Relationship
				Status</label> <input type="text" class="form-control" value="<%=en.decrypt(rs.getString(8),secretKey)%>"
				disabled>

		</div>
		<div class="col-md-6 my-1">
			<label for="inputEduc" class="form-label">Educational
				Attainment</label> <input type="text" class="form-control" value="<%=en.decrypt(rs.getString(9),secretKey)%>"
				disabled>
		</div>
		<div class="col-md-6 my-1">
			<label for="inputEduc" class="form-label">Occupation</label> <input
				type="text" value="<%=en.decrypt(rs.getString(10),secretKey)%>" class="form-control"  disabled>
		</div>
		<div class="col-md-6 my-1">
			<label for="inputValID" class="form-label">Valid I.D.</label> <img
				src="../img/ad1.png" class="idpic">
		</div>
		<div class="col-md-6 my-1">
			<label for="input1x1" class="form-label">Picture</label> <img
				src="../img/Logo.png" class="idpic">
		</div>
		<div class="col-12 my-1">
			<label for="inputQ1" class="form-label">Question 1</label> <input
				type="text" class="form-control" id="inputQ1" value="<%=en.decrypt(rs.getString(13),secretKey)%>"
				disabled>
		</div>
		<div class="col-12 my-1">
			<label for="inputQ2" class="form-label">Question 2</label> <input
				type="text" class="form-control" id="inputQ2" value="<%=en.decrypt(rs.getString(14),secretKey)%>"
				disabled>
		</div>
		<div class="col-12 my-1">
			<label for="inputQ3" class="form-label">Question 3</label> <input
				type="text" class="form-control" id="inputQ3" value="<%=en.decrypt(rs.getString(15),secretKey)%>"
				disabled>
		</div>
		<div class="col-12 my-1">
			<label for="inputQ4" class="form-label">Question 4</label> <input
				type="text" class="form-control" id="inputQ4" value="<%=en.decrypt(rs.getString(16),secretKey)%>"
				disabled>
		</div>
		<div class="col-2 my-1 p-4"">
			<button type="submit" class="btn btn1">Back</button>
		</div>

	</form>
	<%
	}
	} catch (Exception e) {
	System.out.println(e);
	}
	%>
	<%
}
%>
	</center>
</body>
</html>