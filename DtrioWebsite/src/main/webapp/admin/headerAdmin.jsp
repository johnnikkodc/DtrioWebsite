<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

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
		<img src="../img/Logo.png" class="logo">
		<ul class="navbar">
			<li><a href="adminIndex.jsp" class="active">Home </a></li>
			<li><div class="dropdown">
					<button class="dropbtn" disabled>Manage Contents</button>
					<div class="dropdown-content">
						<a href="addproduct.jsp">Add Product</a>  <a
							href="viewproduct.jsp">View/Edit Product</a> <a href="addfaq.jsp">Add
							FAQ</a>  <a href="editfaq.jsp">Edit/Remove
							FAQ</a> <a href="editmedia.jsp">Edit Media</a>
					</div>
				</div></li>
			<li><a href="manageorder.jsp">Manage Orders </a></li>
			<li><a href="managefeedback.jsp"> Feedbacks </a></li>
			<li><a href="managereseller.jsp">Reseller</a></li>

		</ul>
		<div class="main">
			<a href="#" class="user"><i class="ri-user-fill"></i>Admin</a> <a
				href="../actions/LogoutAction.jsp"">Logout</a>
			<div class="bx bx-menu" id="menu-icon"></div>
		</div>
	</header>
</body>
<script type="text/javascript" src="../javascript/script.js"></script>
</html>