<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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

<title>Add FAQ</title>
<%@include file="headerAdmin.jsp"%>
</head>
<body>

	<br>
	<br>
	<br>
	<center>
		<h1>Add FAQ</h1>
		<form action="../actions/AddFAQAction.jsp" method="POST" class="container row g-3 my-4 mx-5 ">
			<div class="col-md-6 my-1">
				<label for="inputQuestion" class="form-label">Question</label> <input
					type="text" class="form-control" id="inputQuestion"
					placeholder="What? How?" name="question">
			</div>
			<div class="col-md-6 my-1">
				<label for="inputAnswer" class="form-label">Answer</label> <input
					type="int" class="form-control" id="inputAnswer" name="answer">
			</div>
		
			<div class="col-3 my-3 p-4 ">
				<button type="submit" class="btn btn1">Add New FAQ</button>
			</div>
		</form>

	</center>
</body><%
}
%>
</html>