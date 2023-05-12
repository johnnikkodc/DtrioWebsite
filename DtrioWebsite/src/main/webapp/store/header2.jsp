<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.http.*"%>
<%@page import="java.sql.*"%>
<%@page import="project.ConnectionProvider"%>
<%@page import="javax.servlet.http.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="../css/style.css">

<link
	href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto+Flex:opsz,wght@8..144,200&display=swap"
	rel="stylesheet">
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
</head>
<style>
.dropbtn {
	padding: 16px;
	font-size: 16px;
	border: none;
	color: white;
	background-color: transparent;
	font-size: 1.1rem;
}

.dropdown {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	min-width: 160px;
	z-index: 1;
	background-color: #874823;
}

.dropdown-content a {
	font-size: 1.1rem;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

.dropdown:hover .dropdown-content {
	display: block;
}
</style>
<body>
	<header>
		<%
	
				try {
					
					Connection con=ConnectionProvider.getCon();
					Statement st = con.createStatement();
					ResultSet rs = st.executeQuery("select *from media where contentID=1");
					while (rs.next()) {
						
				%>
		<a href="index.jsp"><img src="../img/<%=rs.getString(3)%>" class="logo"></a>
			<%
				}
				} catch (Exception e) {
				System.out.println(e);
				}
				%>
		<ul class="navbar">
			<li><a href="index.jsp" class="active">Home </a></li>
			<li><a href="about.jsp">About Us </a></li>
			<li><div class="dropdown">
					<a href="products.jsp"><button class="dropbtn">Products</button></a>
					<div class="dropdown-content">
						<a href="syrups.jsp">Coffee Syrups</a>
						<a href="beans.jsp">Coffee Beans</a>
						<a href="drinks.jsp">Cold Brews</a>
					</div>
				</div></li>
			<li><div class="dropdown">
					<a href="faqs.jsp"><button class="dropbtn">FAQs</button></a>
					<div class="dropdown-content">
						<a href="terms.jsp">Terms and Conditions</a>
					</div>
				</div></li>
			<li><a href="resellerapplication.jsp">Reseller Application</a></li>


		</ul>
		<div class="main">
			<a href="login.jsp" class="user"><i class="ri-user-fill"></i> <%
				// String loggedInUser = session.getAttribute("loggedInUser").toString();
				 %> <%
				 //out.println(loggedInUser);
 			%> </a> <a href="cart.jsp" class="user"><i
				class="ri-shopping-cart-line"></i></a> <a
				href="../actions/LogoutAction.jsp" class="user"><i
				class="ri-logout-box-r-line"></i></a>

			<div class="bx bx-menu" id="menu-icon"></div>
		</div>
	</header>
</body>
<script type="text/javascript" src="../javascript/script.js"></script>
</html>