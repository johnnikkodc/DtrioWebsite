<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="header.jsp"%>
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
<meta charset="ISO-8859-1">
<title>Register Page</title>
</head>
<body>
	<br>
	<br>
	<br>
	<section class="Form my-4 mx-5">
		<div class="container">
			<div class="row no-gutters">
				<div class="col-lg-5">
					<img src="../img/registerpic.png" class="img-fluid h-100"
						alt="logo">
				</div>
				<div class="col-lg-7 px-5 pt-5">
					<img src="../img/Logo.png" class="img-fluid" alt="logo">
					<h4 class="lbl">Register for an account</h4>
					<form action="../actions/RegisterAccountAction.jsp" method="POST">
						<div class="form-row">
							<div class="col-lg-10">
								<input type="text" placeholder="First Name"
									class="form-control my-1 p-4" name="fname" id="iname" required>
								<div class="nabox text-center"></div>
							</div>
						</div>
						<div class="form-row">
							<div class="col-lg-10">
								<input type="text" placeholder="Last Name"
									class="form-control my-1 p-4" name="lname" id=pname required>
								<div class="nabox2 text-center"></div>
							</div>
						</div>
						<div class="form-row">
							<div class="col-lg-10">
								<input type="text" placeholder="Home Address/Delivery Address"
									class="form-control my-1 p-4" name="address" required>
							</div>
						</div>
						<div class="form-row">
							<div class="col-lg-10">
								<input type="email" placeholder="Email Address"
									class="form-control my-1 p-4" name="email" id="email" required>
								<div class="embox text-center"></div>
							</div>

						</div>
						<div class="form-row">
							<div class="col-lg-10">
								<input type="text" placeholder="Contact Number"
									class="form-control my-1 p-4" name="number" id="number"
									required>
								<div class="numbox text-center"></div>
							</div>

						</div>
						<div class="form-row">
							<div class="col-lg-10">
								<input type="password" placeholder="Password" id="password"
									class="form-control my-1 p-4" name="password" required>
							</div>

						</div>
						<div class="showpass">
							<input type="checkbox" onclick="showpass()"> Show
							Password
						</div>
						<div class="col-lg-10">
							<div class="progress" style="height: 20px;">
								<div class="progress-bar" role="progressbar" style="width: 0%;"
									aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"
									id="meter"></div>
							</div>
							<div class="textbox text-center"></div>
						</div>

						<div class="form-row">
							<div class="col-lg-7">
								<button type="submit" class="btn1 mt-3 mb-5" id="subtn">Register</button>
							</div>
						</div>
						<p>
							Already have an account? <a href="login.jsp" class="nodecor">Login
								here</a>
						</p>
					</form>

				</div>
			</div>
		</div>
	</section>


	<%@include file="footer.jsp"%>
	<%@include file="../actions/Snackbar.jsp"%>
</body>
<script>
	function showpass() {
		var x = document.getElementById("password");
		if (x.type === "password") {
			x.type = "text";
		} else {
			x.type = "password";
		}
	}
</script>
<script src="../js/checksregister.js"></script>

</html>