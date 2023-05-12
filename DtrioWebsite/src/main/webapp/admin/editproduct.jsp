<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
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
<title>Edit Product</title>
<%@include file="headerAdmin.jsp"%>
</head>
<body>

	<br>
	<br>
	<br>
	<center>
		<h1>Edit Product</h1>
		<h3>
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
			PreparedStatement ps = con.prepareStatement("select * from product where productID=?");
			ps.setInt(1, Integer.parseInt(id));
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				String photos[] = rs.getString(5).split(",");
		%>
		<form action="../actions/ModifyProductAction.jsp?id=<%out.println(request.getParameter("id"));%>" method="post" class="container row g-3 my-4 mx-5 ">

			<div class="col-md-6 my-1">
				<label for="inputName" class="form-label">Product Name</label> <input
					type="text" class="form-control" id="inputName"
					placeholder="Coffee Syrup Name" name="name"
					value="<%=rs.getString(2)%>">
			</div>
			<div class="col-md-6 my-1">
				<label for="inputPrice" class="form-label">Product Price</label> <input
					type="int" class="form-control" id="inputPrice" name="price"
					value="<%=rs.getString(3)%>">
			</div>


			<div class="col-md-6 my-1">
				<label for="inputDetails" class="form-label">Product Details</label>
				<input type="text" class="form-control" id="inputDetails"
					name="details" value="<%=rs.getString(4)%>">
			</div>
			<div class="col-md-6 my-1">
				<label for="inputQuantity" class="form-label">Quantity</label> <input
					type="int" class="form-control" id="inputQuantity" name="quantity"
					value="<%=rs.getString(6)%>">
			</div>
			<div class="col-md-6 my-1">
				<label for="photo1" class="form-label">Product Photo 1
					(Upload at least one)</label> <input class="form-control" type="file"
					id="photo1" accept="image/png, image/gif, image/jpeg" name="photo1" />
			</div>
			<div class="col-md-6 my-1">
				<label for="inputExpiration" class="form-label">Expiration</label> <input
					type="date" class="form-control" id="inputExpiration"
					name="expiration">
			</div>

			<div class="col-md-6 my-1">
				<label for="photo2" class="form-label">Product Photo 2</label> <input
					class="form-control" type="file" id="photo2"
					accept="image/png, image/gif, image/jpeg" name="photo2" />
			</div>
			<div class="col-md-6 my-1">
				<label for="photo3" class="form-label">Product Photo 3</label> <input
					class="form-control" type="file" id="photo3"
					accept="image/png, image/gif, image/jpeg" name="photo3" />
			</div>
			<div class="col-md-6 my-1">
				<label for="photo4" class="form-label">Product Photo 4</label> <input
					class="form-control" type="file" id="photo4"
					accept="image/png, image/gif, image/jpeg" name="photo4" />
			</div>
			<div class="col-md-6 my-1">
				<label for="photo5" class="form-label">Product Photo 5</label> <input
					class="form-control" type="file" id="photo5"
					accept="image/png, image/gif, image/jpeg" name="photo5" />
			</div>

			<div class="col-3 my-3 p-4 ">
				<button type="submit" class="btn btn1">Edit Product</button>
			</div>
		</form>
		<%
		}
		} catch (Exception e) {
		System.out.println(e);
		}}
		%>
	</center>
</body>
</html>