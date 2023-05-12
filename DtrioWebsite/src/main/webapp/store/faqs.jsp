<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.http.*"%>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
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
<link rel="stylesheet" href="../css/faqs.css">
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
<style>
.h1{
margin-bottom: 30px;
	font-size: 32px;
	font-weight:bold;
}
</style>
<title>D'Trio | FAQ</title>
</head>
<body>
	<div class="accordion-wrapper">


		<h1 style="color: #874823; font-weight: bold; text-align: left">FAQs</h1>
		<%
		try {
			Connection con = ConnectionProvider.getCon();
			Statement st = con.createStatement();
			Statement st2 = con.createStatement();
			ResultSet rs1 = st.executeQuery("select distinct category from faq");
			
			while (rs1.next()) {
		%>
		<button class="accordion main-acc one">
			<%
			out.println(rs1.getString(1));
			%>
		</button>
		<div class="panel main-panel">
		<%ResultSet rs2 = st2.executeQuery("select * from faq where category='"+rs1.getString(1)+"'");
		while (rs2.next()) {%>
			<button class="accordion sub-acc" style=""><% out.println(rs2.getString(2));%></button>
			<div class="panel sub-panel">
				<p><% out.println(rs2.getString(3));%></p>
			</div>
			<%} %>
		</div>


		<%
		}
		} catch (Exception e) {
		System.out.println(e);
		}
		%>


	</div>
	<%@include file="footer.jsp"%>
	<script>
		var acc = document.getElementsByClassName("accordion");
		var i;

		for (i = 0; i < acc.length; i++) {
			acc[i].addEventListener("click", function() {
				this.classList.toggle("active");
				var parent = this.parentElement;
				var panel = this.nextElementSibling;
				var mainPanel = document.querySelector(".main-panel");
				if (panel.style.maxHeight) {
					panel.style.maxHeight = null;
					// panel.style.border = "none";
				} else {
					panel.style.maxHeight = panel.scrollHeight + "px";
					parent.style.maxHeight = parseInt(parent.style.maxHeight)
							+ panel.scrollHeight + "px";
				}
			});
		}

		const hamburger = document.querySelector(".hamburger-menu");
		const navLinks = document.querySelector(".nav-links");

		hamburger.addEventListener("click", function() {
			navLinks.classList.toggle("show");
		});
	</script>
</body>
</html>