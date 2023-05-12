<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<meta charset="ISO-8859-1">
<title>Forget Password Page</title>
</head>
<body>
<br><br><br>
	<section class="Form my-4 mx-5">
		<div class="container">
			<div class="row no-gutters">
				<div class="col-lg-5">
					<img src="../img/loginposter.png" class="img-fluid" alt="logo">
				</div>
				<div class="col-lg-7 px-5 pt-5">
				<img src="../img/Logo.png" class="img-fluid" alt="logo">
				<h4 class="lbl">Change Password</h4>
					<form>						
						<div class="form-row">
							<div class="col-lg-7">
								<input type="password" placeholder="Enter new password" class="form-control my-3 p-4" required>
							</div>
						</div>
						
						<div class="form-row">
							<div class="col-lg-7">
								<input type="password" placeholder="Re-enter new password" class="form-control my-3 p-4" required>
							</div>
						</div>
						
							<div class="form-row">
							<div class="col-lg-7">
								<button type="button" class="btn1 mt-3 mb-5">Save Password</button>
							</div>
						</div>
						
					</form>
				</div>
			</div>
		</div>
	</section>

	<%@include file="footer.jsp"%>
</body>
</html>