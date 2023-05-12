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

<html>
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<link
	href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="../css/style.css">
<title>Checkout Page</title>
<style>
.container {
	height: 100vh;
}

.card {
	border: none;
}

.form-control {
	border-bottom: 2px solid #eee !important;
	border: none;
	font-weight: 600
}

.form-control:focus {
	color: #495057;
	background-color: #fff;
	border-color: #8bbafe;
	outline: 0;
	box-shadow: none;
	border-radius: 0px;
	border-bottom: 2px solid blue !important;
}

.inputbox {
	position: relative;
	margin-bottom: 20px;
	width: 100%
}

.inputbox span {
	position: absolute;
	top: 7px;
	left: 11px;
	transition: 0.5s
}

.inputbox i {
	position: absolute;
	top: 13px;
	right: 8px;
	transition: 0.5s;
	color: #3F51B5
}

input::-webkit-outer-spin-button, input::-webkit-inner-spin-button {
	-webkit-appearance: none;
	margin: 0
}

.inputbox input:focus ~span {
	transform: translateX(-0px) translateY(-15px);
	font-size: 12px
}

.inputbox input:valid ~span {
	transform: translateX(-0px) translateY(-15px);
	font-size: 12px
}

.card-blue {
	background-color: #492bc4;
}

.hightlight {
	background-color: #5737d9;
	padding: 10px;
	border-radius: 10px;
	margin-top: 15px;
	font-size: 14px;
}

.yellow {
	color: #fdcc49;
}

.decoration {
	text-decoration: none;
	font-size: 14px;
}

.btn-success {
	color: #fff;
	background-color: #492bc4;
	border-color: #492bc4;
}

.btn-success:hover {
	color: #fff;
	background-color: #492bc4;
	border-color: #492bc4;
}

.decoration:hover {
	text-decoration: none;
	color: #fdcc49;
}
</style>
</head>
<body>

	<br>
	<br>
	<br>
	<div class="container mt-5 px-5">



		<div class="row">

			<div class="col-md-8">


				<div class="card p-3">
					<h1 class="lbl my-3">Confirm Order</h1>
					<h3 class="text-uppercase">Payment details</h3>
					<form action="../actions/PlaceOrderAction.jsp" method="POST">
						<label>Biller Name</label>
						<div class="inputbox mt-3">
							<input type="text" name="name" class="form-control"
								required="required" placeholder="Enter Name">
						</div>


						<div class="row">

							<div class="col-md-6">
								<label>Payment Method</label>
								<div class="inputbox mt-3 mr-2">

									<select class="form-control" name="payment">
										<option disabled selected value>Choose...</option>
										<option>GCASH</option>
										<option>BPI Bank Transfer</option>
										<option>Paypal</option>
									</select>




								</div>


							</div>


						</div>



						<div class="mt-4 mb-4">

							<h6 class="text-uppercase">Delivery Details</h6>


							<div class="row mt-2">

								<div class="col-md-6">
									<label>Street Address</label>
									<div class="inputbox mt-3 mr-2">
										<input type="text" class="form-control" required="required"
											placeholder="Enter Street Address" name="street">
									</div>


								</div>


								<div class="col-md-6">
									<label>City</label>

									<div class="inputbox mt-3 mr-2">
										<select class="form-control" name="city">
											<option disabled selected value>Choose...</option>
											<option>Caloocan City</option>
											<option>Las Pinas City</option>
											<option>Makati City</option>
											<option>Malabon City</option>
											<option>Mandaluyong City</option>
											<option>Manila City</option>
											<option>Marikina City</option>
											<option>Muntinlupa City</option>
											<option>Navotas City</option>
											<option>Paranaque City</option>
											<option>Pasay City</option>
											<option>Pasig City</option>
											<option>Pateros</option>
											<option>Quezon City</option>
											<option>San Juan City</option>
											<option>Taguig City</option>
											<option>Valenzuela City</option>

										</select>
									</div>


								</div>




							</div>


							<div class="row mt-2">

								<div class="col-md-6">
									<label>Province</label>
									<div class="inputbox mt-3 mr-2">
										<select class="form-control" name="province">
											<option disabled selected value>Choose...</option>
											<option>NCR</option>

										</select>
									</div>


								</div>


								<div class="col-md-6">
									<label>Zip code</label>
									<div class="inputbox mt-3 mr-2">
										<input type="text" name="zip" class="form-control"
											required="required" placeholder="Enter Zip Code">
									</div>


								</div>
								<div class="col-md-12">
									<label>Mobile Number</label>
									<div class="inputbox mt-3 mr-2">
										<input type="text" name="mobile" class="form-control"
											required="required" placeholder="Enter Mobile Number">
									</div>


								</div>




							</div>

						</div>
				</div>


				<div class="mt-4 mb-4 d-flex justify-content-between">
					<a href="cart.jsp"><span class="nodecor">Modify Cart</span></a>
					<div class="col-md-4">
						<input type="submit" class="btn1 btn-success px-3"
							value="Place Order" />
					</div>
					</form>


				</div>

			</div>

			<div class="col-md-4">

				<div class="card card-blue p-3 text-white mb-3">
					<%
					String email = session.getAttribute("loggedInUser").toString();
					int total = 0;
					try {
						Connection con = ConnectionProvider.getCon();
						Statement st = con.createStatement();
						ResultSet rs1 = st.executeQuery("select sum(total) from cart where email='" + email + "'");
						while (rs1.next()) {
							total = rs1.getInt(1);
						}
					%>
					<span>You have to pay</span>
					<div class="d-flex flex-row align-items-end mb-3">
						<h1 class="mb-0 yellow">
							P
							<%
						out.println(total);
						%>
						</h1>

					</div>

					<%
					} catch (Exception e) {
					System.out.println(e);
					}
					%>


				</div>

			</div>

		</div>


	</div>
	<%@include file="footer.jsp"%>
</body>

<script type="text/javascript">
	function disableBack() {
		window.history.forward();
	}
	setTimeout("disableBack()", 0);
	window.onunload = function() {
		null
	};
</script>
</html>