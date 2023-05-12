<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.http.*"%>
<%
HttpSession ses = request.getSession(false);
if (ses == null || ses.getAttribute("loggedInUser") == null) {
%>
<%@include file="header.jsp"%>
<%
} else {
%>
<%@include file="header2.jsp"%>
<%
}
%>



<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/snackbar.css">
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
<title>Reseller Application</title>
</head>

<body>
	<br>
	<br>
	<br>
	<br>
	<form action="../actions/SubmitResellerApplication.jsp" method="POST"
		class="container  row g-3 my-4 mx-5 ">
		<div class="col-12">
			<h1 class="lbl my-3">Reseller Application Form</h1>
		</div>
		<div class="col-md-6 my-1">
			<label for="inputName" class="form-label">Name</label> <input
				type="text" class="form-control" id="inputName" name="name" required>
		</div>
		<div class="col-md-6 my-1">
			<label for="inputBday" class="form-label">Birthday</label> <input
				type="date" class="form-control" id="inputBday" name="birthday"
				required>
		</div>
		<div class="col-md-6 my-1">
			<label for="inputNum" class="form-label">Mobile Number</label> <input
				type="text" class="form-control" id="inputNum" name="mobile"
				required>
		</div>
		<div class="col-md-6 my-1">
			<label for="inputRel" class="form-label">Religion</label> <input
				type="text" class="form-control" id="inputRel" name="religion"
				required>
		</div>
		<div class="col-12 my-1">
			<label for="inputAddress" class="form-label">Home Address</label> <input
				type="text" class="form-control" id="inputAddress" name="address"
				required>
		</div>
		<div class="col-md-6 my-1">
			<label for="inputEmail" class="form-label">Email Address</label> <input
				type="text" class="form-control" id="inputEmail" name="email"
				required>
		</div>
		<div class="col-md-3 my-1 ">
			<label for="inputGender" class="form-label">Gender</label> <select
				class="form-control" name="gender" required>
				<option disabled selected value>Choose...</option>
				<option>Male</option>
				<option>Female</option>
				<option>Others</option>
			</select>

		</div>

		<div class="col-md-3 my-1">
			<label for="inputGender" class="form-label">Relationship
				Status</label> <select class="form-control" name="relationship" required>
				<option disabled selected value>Choose...</option>
				<option>Single</option>
				<option>Married</option>
				<option>Widowed</option>
			</select>
		</div>

		</div>
		<div class="col-md-6 my-1">
			<label for="inputEduc" class="form-label">Educational
				Attainment</label> <select id="inputEduc" class="form-control"
				name="education" required>
				<option disabled selected value>Choose...</option>
				<option>No Grade Completed</option>
				<option>Elementary Undergraduate</option>
				<option>High School Undergraduate</option>
				<option>High School Graduate</option>
				<option>College Undergraduate</option>
				<option>College Graduate</option>
			</select>
		</div>
		<div class="col-md-6 my-1">
			<label for="inputEduc" class="form-label">Occupation</label> <select
				id="inputEduc" class="form-control" name="occupation" required>
				<option disabled selected value>Choose...</option>
				<option>Student</option>
				<option>Self-Employed</option>
				<option>Employee</option>
			</select>
		</div>
		<div class="col-md-6 my-1">
			<label for="inputValID" class="form-label">Upload Valid I.D.</label>
			<input type="file" class="form-control" id="inputValID" name="picid"
				required>
		</div>
		<div class="col-md-6 my-1">
			<label for="input1x1" class="form-label">Upload 1x1 Picture</label> <input
				type="file" class="form-control" id="input1x1" name="1x1" required>
		</div>
		<div class="col-12 my-1">
			<label for="inputQ1" class="form-label">Question 1</label> <input
				type="text" class="form-control" id="inputQ1" placeholder="Answer"
				name="a1" required>
		</div>
		<div class="col-12 my-1">
			<label for="inputQ2" class="form-label">Question 2</label> <input
				type="text" class="form-control" id="inputQ2" placeholder="Answer"
				name="a2" required>
		</div>
		<div class="col-12 my-1">
			<label for="inputQ3" class="form-label">Question 3</label> <input
				type="text" class="form-control" id="inputQ3" placeholder="Answer"
				name="a3" required>
		</div>
		<div class="col-12 my-1">
			<label for="inputQ4" class="form-label">Question 4</label> <input
				type="text" class="form-control" id="inputQ4" placeholder="Answer"
				name="a4" required>
		</div>
		<div class="col-2 my-1 p-4"">
			<button type="submit" class="btn btn1">Submit</button>
		</div>

	</form>
	<%@include file="footer.jsp"%>
	<%@include file="../actions/Snackbar.jsp"%>
	
		
</body>

</html>