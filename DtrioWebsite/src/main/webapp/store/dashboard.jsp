<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/product.css">
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
		h1 {
			margin:auto;
			text-align: center;
			margin-top: 50px;
			color:black;
		}
		.dcontainer {
			display: flex;
			flex-wrap: wrap;
			justify-content: center;
			margin-top: 50px;
		}
		.dcard {
			background-color: #fff;
			box-shadow: 0px 2px 5px rgba(0,0,0,0.1);
			padding: 20px;
			margin: 20px;
			border-radius: 13px;
			width: 300px;
		}
		.dcard h2 {
			margin-top: 0;
			font-size: 20px;
			color: #333;
		}
		.dcard p {
			margin: 10px 0;
			color: #666;
		}
		.dcard a {
			display: block;
			margin-top: 20px;
			padding: 10px 20px;
			background-color: #333;
			color: #fff;
			text-align: center;
			border-radius: 13px;
			text-decoration: none;
			transition: all 0.3s ease-in-out;
		}
		.dcard a:hover {
			background-color: #555;
		}
	</style>
<meta charset="ISO-8859-1">
<title>Dashboard</title>
</head>
<body>
	<h1>My Dashboard</h1>
	<div class="dcontainer">
		<div class="dcard">
			<h2>Change Password</h2>
			<p>Change your account password.</p>
			<a href="#">Change Password</a>
		</div>
		<div class="dcard">
			<h2>Change Mobile Number</h2>
			<p>Update your mobile number on file.</p>
			<a href="#">Change Mobile Number</a>
		</div>
		<div class="dcard">
			<h2>View Order Status</h2>
			<p>Check the status of your current orders.</p>
			<a href="#">View Order Status</a>
		</div>
		<div class="dcard">
			<h2>View Completed Transactions</h2>
			<p>View your order history and completed transactions.</p>
			<a href="#">View Completed Transactions</a>
		</div>
		<div class="dcard">
			<h2>Upload Proof of Payment</h2>
			<p>Upload proof of payment for a recent order.</p>
			<a href="#">Upload Proof of Payment</a>
		</div>
		<div class="dcard">
			<h2>Write a Feedback</h2>
			<p>Write a feedback for a product you purchased.</p>
			<a href="#">Review a Product</a>
		</div>
		<div class="dcard">
			<h2>Cancel My Order</h2>
			<p>Cancel an order that has not yet been shipped.</p>
			<a href="#">Cancel My Order</a>
		</div>
	</div>

	<%@include file="footer.jsp"%>
	
</body>

</html>