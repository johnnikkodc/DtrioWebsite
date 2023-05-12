<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/captcha.css">
<link rel="stylesheet" href="../css/snackbar.css">
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
<title>Admin Login Page</title>
</head>
<body>
	<br>
	<br>
	<br>
	<section class="Form my-4 mx-5">
		<div class="container">
			<div class="row no-gutters">
				<div class="col-lg-5">
					<img src="../img/loginposter.png" class="img-fluid" alt="logo">
				</div>
				<div class="col-lg-7 px-5 pt-5">
					<img src="../img/Logo.png" class="img-fluid" alt="logo">
					<h4 class="lbl">Admin Login</h4>
					<form action="../actions/AdminLoginAction.jsp" method="POST" id="login">
						<div class="form-row">
							<div class="col-lg-10">
								<input type="email" placeholder="Email Address" required
									class="form-control my-3 p-4" name="email">
							</div>
						</div>
						<div class="form-row">
							<div class="col-lg-10">
								<input type="password" placeholder="Password" id="password"
									required class="form-control my-3 p-4" name="password">
							</div>
						</div>


						<div class="showpass">
							<input type="checkbox" onclick="showpass()"> Show
							Password
						</div>
					</form>
					
					<br>
					<div class="form-row">
						<div class="col-lg-10">

							<center>
								<div class="wrapper" style="margin-top: -20px;">
									<div class="captcha-area">
										<div class="captcha-img">
											<img src="https://ssmalarmas.com/captcha/backgrounds/bg6.png"
												alt="Captch Background"> <span class="captcha"></span>
										</div>
										<button class="reload-btn">
											<i class="ri-restart-line"></i>
										</button>
									</div>
									<form class="input-area">
										<input type="text" class="form-control"
											placeholder="Enter captcha" maxlength="6" spellcheck="false"
											id="captchatext" required> <span class="status"></span>


									</form>
									<div class="status-text"></div>

								</div>




							</center>
						</div>
					</div>
					<div class="form-row">
						<div class="col-lg-7">
							<button type="submit" class="btn1 check-btns mt-3 mb-5"
								id="subtn">Login</button>
							<br> <a href="forgetpassword.jsp" class="nodecor">Forgot
								Password?</a>
							
						</div>
					</div>



				</div>
			</div>
		</div>
	</section>


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
<script src="../js/captcha2.js"></script>
<%@include file="../actions/Snackbar.jsp"%>
</html>