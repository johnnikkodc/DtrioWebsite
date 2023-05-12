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

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/snackbar.css">
<link
	href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
<meta charset="ISO-8859-1">
<title>Cart</title>

</head>
<body>
	<br>
	<br>
	<br>
	<br>
	<section class="h-100">
		<div class="container h-100 py-5">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-10">

					<div class="d-flex justify-content-between align-items-center mb-4">
						<h1 class="fw-normal p-4 mb-0 text-black">
							Shopping Cart
							</h3>
							<div></div>
					</div>



					<%
					if (ses == null || ses.getAttribute("loggedInUser") != null) {
						String email = "";
						int total = 0;
						email = session.getAttribute("loggedInUser").toString();
						try {
							Connection con = ConnectionProvider.getCon();
							Statement st = con.createStatement();
							ResultSet rs = st.executeQuery("select *from cart");

							while (rs.next()) {
					%>
					<div class="card rounded-3 mb-4">
						<div class="card-body p-4">
							<div
								class="row d-flex justify-content-between align-items-center">
								<div class="col-md-2 col-lg-2 col-xl-2">
									<%
									try {

										Statement st2 = con.createStatement();
										ResultSet rs2 = st2.executeQuery("select *from product where productID='" + rs.getString(3) + "'");

										while (rs2.next()) {
									%>


									<img src='../img/<%out.println(rs2.getString(5));%>'
										class="img-fluid rounded-3" style="width: 100%; border-radius: 25px;padding:15px" alt="img">
									<%
									}
									} catch (Exception e) {
									System.out.println(e);
									}
									%>
								</div>
								<div class="col-md-3 col-lg-3 col-xl-3">
									<p class="lead fw-normal mb-2"><%=rs.getString(4)%></p>
									<p>
										<span class="text-muted">Product ID: </span><%=rs.getString(3)%>
									</p>
								</div>
								<div class="col-md-3 col-lg-3 col-xl-2 d-flex">
									<a class="btn btn-link px-2"
										href="../actions/ModifyQuantityAction.jsp?id=<%=rs.getString(1)%>&quantity=dec">
										<i class="ri-subtract-line"></i>
									</a> <input id="form1" name="quantity" value="<%=rs.getString(5)%>"
										type="text" disabled class="form-control" /> <a
										class="btn btn-link px-2"
										href="../actions/ModifyQuantityAction.jsp?id=<%=rs.getString(1)%>&quantity=inc">
										<i class="ri-add-circle-fill"></i>
									</a>
								</div>
								<div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
									<h5 class="mb-0">
										P<%=rs.getInt(7)%></h5>
								</div>
								<div class="">
									<a
										href="../actions/DeleteItemAction.jsp?id=<%=rs.getString(1)%>"><i
										class="ri-close-circle-fill nodecor"></i></a>
								</div>
								<div class="col-md-1 col-lg-1 col-xl-1 text-end">
									<a href="#!" class="text-danger"><i
										class="fas fa-trash fa-lg"></i></a>
								</div>
							</div>
						</div>
					</div>

					<%
					}
					} catch (Exception e) {
					System.out.println(e);
					}
					%>
					<%
					email = session.getAttribute("loggedInUser").toString();
					try {
						Connection con = ConnectionProvider.getCon();
						Statement st = con.createStatement();
						ResultSet rs1 = st.executeQuery("select sum(total) from cart where email='" + email + "'");
						while (rs1.next()) {
							total = rs1.getInt(1);
						}
					%>
					<div class="card mb-4">
						<div class="card-body p-4 d-flex flex-row">
							<div class="form-outline flex-fill">
								<label class="form-label" for="form1">Total Amount To
									Pay</label> <input type="text" id="form1" value=<%out.println(total);%>
									class="form-control form-control-lg" disabled />
							</div>

						</div>
					</div>
					<div class="card">

						<div class="card-body">
							<a href="products.jsp"><button type="button"
									class="btn1 btn-lg">Continue Shopping</button></a>

						</div>
						<div class="card-body">
							<a href="checkout.jsp"><button type="button"
									class="btn1 btn-lg">Proceed To Checkout</button></a>

						</div>
					</div>
					<%
					} catch (Exception e) {
					System.out.println(e);
					}
					} else {
					%>
					<div class="card rounded-3 mb-4">
						<div class="card-body p-4">
							<h1>Your cart is empty!</h1>
						</div>
					</div>
					<div class="card">

						<div class="card-body">
							<a href="products.jsp"><button type="button"
									class="btn1 btn-lg" href="products.jsp">View Products</button></a>
						</div>
					</div>
					<%
					}
					%>


				</div>
			</div>
		</div>
	</section>
	<br>

</body>
<%@include file="footer.jsp"%>
<%@include file="../actions/Snackbar.jsp"%>
</html>