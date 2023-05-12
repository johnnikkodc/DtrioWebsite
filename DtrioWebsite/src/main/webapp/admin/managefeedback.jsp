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
<title>Manage Feedback</title>
<%@include file="headerAdmin.jsp"%>
</head>
<body>
	<br>
	<br>
	<br>
	<br>
	<center>
		<h1>Manage Feedback</h1>
		<table class="table table-hover">
			<thead>
				<tr>
					<th scope="col" style="width: 14%">Feedback ID</th>
					<th scope="col" style="width: 14%">Order ID</th>
					<th scope="col" style="width: 14%">User ID</th>
					<th scope="col" style="width: 14%">Customer Feedback</th>
					<th scope="col" style="width: 7%">Ratings</th>
					<th scope="col" style="width: 7%">Reply</th>
					<th scope="col" style="width: 22%">My Reply</th>


				</tr>
			</thead>
			<tbody>
				<%
				try {
					Class.forName("com.mysql.cj.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/d'trio", "root", "admin");
					Statement st = con.createStatement();
					ResultSet rs = st.executeQuery("select *from feedbacks");
					while (rs.next()) {
				%>
				<tr>
					<th scope="row"><%=rs.getInt(1)%></th>
					<td><%=rs.getString(2)%></td>
					<td><%=rs.getString(3)%></td>
					<td><%=rs.getString(4)%></td>
					<td><%=rs.getString(5)%></td>
					<td><a href="feedbackreply.jsp?id=<%=rs.getInt(1)%>"><i
							class="ri-edit-box-line"></i></a></td>
							<td><%if(rs.getString(6)!=null){out.print(rs.getString(6));}%></td>
				</tr>
				<%
				}
				} catch (Exception e) {
				System.out.println(e);
				}
}
				%>
			


			</tbody>
		</table>
	</center>
</body>
</html>