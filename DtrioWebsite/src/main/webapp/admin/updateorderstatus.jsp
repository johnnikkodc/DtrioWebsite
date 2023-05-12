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

<link
	href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
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
<title>Update Order Status</title>
<%@include file="headerAdmin.jsp"%>
</head>
<body>
	<br>
	<br>
	<br>
	<center>
		<h1>Update Order Status</h1>
		<h3>Order ID <%
			String id = request.getParameter("id");
			if (request.getParameter("id") != null) {
				out.println(id);
			}
			%></h3>
		<form action="../actions/UpdateOrderStatusAction.jsp?id=<%out.println(request.getParameter("id"));%>" method="post" class="container row g-3 my-4 mx-5 ">
			<div class="col-md-12 my-1">
				<label for="inputFile" class="form-label">Order Status</label>
				<select
				class="form-control" name="relationship">
				<option disabled selected value><%
			String status = request.getParameter("status");
			if (request.getParameter("status") != null) {
				out.println(status);
			}
			%></option>
				<option>Order Placed</option>
				<option>Paid</option>
				<option>To pack</option>
				<option>To Deliver</option>
				<option>Delivered</option>
				<option>Canceled</option>
			</select>
			</div>

			<div class="col-3 my-3 p-4 ">
				<button type="submit" class="btn btn1">Submit</button>
			</div>
		</form>

	</center><%
}
%>
</body>
</html>