<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="project.ConnectionProvider"%>
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
<link rel="stylesheet" href="../css/product.css">
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<meta charset="ISO-8859-1">
<%
String id = request.getParameter("id");

try {

	Connection con = ConnectionProvider.getCon();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select *from product where productID='" + id + "'");
	while (rs.next()) {
%>
<title><%=rs.getString(2)%></title>
<style>
a:link {
	text-decoration: none;
	color: white;
}

a:visited {
	text-decoration: none;
}

a:hover {
	text-decoration: none;
	color: white;
}

a:active {
	text-decoration: none;
}

.form-popup {
	display: none;
}

input::-webkit-outer-spin-button, input::-webkit-inner-spin-button {
	-webkit-appearance: none;
	margin: 0;
}
</style>
</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<!-- Container for the image gallery -->
				<div class="container" style="padding: 30px">
					<!-- Full-width images with number text -->
					<img src="../img/<%=rs.getString(5)%>"
						style="width: 100%; border-radius: 25px">
				</div>
			</div>
			<div class="col-md-6" style="padding-right: 50px">
				<div class="product-dtl" style="padding-top: 60px">
					<div class="product-info">
						<span>Coffee syrup</span>
						<h2 style="font-weight: bold"><%=rs.getString(2)%></h2>
						<span style="color: pink; font-weight: bold">PHP<%=rs.getString(3)%></span>
					</div>
					<br>
					<p><%=rs.getString(4)%></p>
					<span><b>Expiration Date:</b> <%=rs.getString(7)%></span> <br>
					<br>

					<form
						action="../actions/AddToCartAction.jsp?id=<%=rs.getString(1)%>"
						method="post">

						<%
						if (Integer.parseInt(rs.getString(6)) >= 1) {
						%>
						<div class="product-count">
							<div class="qty-container">
								<button class="qty-btn-minus btn-light" type="button">
									<i class="fa fa-minus"></i>
								</button>
								<input type="text" name="qty" value="1" class="input-qty" />
								<button class="qty-btn-plus btn-light" type="button">
									<i class="fa fa-plus"></i>
								</button>
							</div>
							<span>Available Stocks: <%=rs.getString(6)%></span><br>
							<button class="btn1 mt-3 mb-5" style="width: 30%" type="submit">
								Add to cart <i class="fa fa-shopping-cart"></i>
							</button>
							<%
							} else {
							%>
							<h1 style="color: #F75D59">Out of Stock</h1>
							<br>

							<%
							}
							%>
						
					</form>
				</div>
			</div>
		</div>
		<%
		}
		} catch (Exception e) {
		System.out.println(e);
		}
		%>
		<div class="col-md-12">
			<div class="container">
				<h2 style="font-weight: bold; text-align: left">Customer
					Feedbacks</h2>

				<%
				int count = 0;
				int sum = 0;
				int average=0;
				try {

					Connection con = ConnectionProvider.getCon();
					Statement st2 = con.createStatement();
					ResultSet rs2 = st2.executeQuery("select * from feedbacks where productID='" + id + "'");

					while (rs2.next()) {
						sum += rs2.getInt(5);
						count += 1;

					}
					average=sum/count;

				} catch (Exception e) {
					System.out.println(e);
				}
				%>

				<div class="rating">
					<%
					if (average== 5) {
					%>
					<span class="star">&#9733;</span> <span class="star">&#9733;</span>
					<span class="star">&#9733;</span> <span class="star">&#9733;</span>
					<span class="star">&#9733;</span>
					<%
					}
					%>
					<%
					if (average== 4) {
					%>
					<span class="star">&#9733;</span> <span class="star">&#9733;</span>
					<span class="star">&#9733;</span> <span class="star">&#9733;</span>
					<span class="star">&#9734;</span>
					<%
					}
					%>
					<%
					if (average == 3) {
					%>
					<span class="star">&#9733;</span> <span class="star">&#9733;</span>
					<span class="star">&#9733;</span> <span class="star">&#9734;</span>
					<span class="star">&#9734;</span>
					<%
					}
					%>
					<%
					if (average == 2) {
					%>
					<span class="star">&#9733;</span> <span class="star">&#9733;</span>
					<span class="star">&#9734;</span> <span class="star">&#9734;</span>
					<span class="star">&#9734;</span>
					<%
					}
					%>
					<%
					if (average == 1) {
					%>
					<span class="star">&#9733;</span> <span class="star">&#9734;</span>
					<span class="star">&#9734;</span> <span class="star">&#9734;</span>
					<span class="star">&#9734;</span>
					<%
					}if (average == 0){ %>
						<span class="star">&#9734;</span> <span class="star">&#9734;</span>
					<span class="star">&#9734;</span> <span class="star">&#9734;</span>
					<span class="star">&#9734;</span>
					<% 	
					}
					%>

					<span>Based on <%
					out.println(count);
					%> reviews
					</span> <span style="float: right; color: #FFD700"><a
						href="#reviewForm" class="open-button" onclick="openForm()">Write
							a feedback</a></span>
				</div>

				<div class="form-popup" id="reviewForm">
					<div class="review">
						<form action="#" class="form-container">
							<div class="feedback-header">
								<h3>Write a feedback</h3>
								<span class="close-button" onclick="closeForm()">&times;</span>
							</div>
							<label style="color: black" for="name"><b>Name</b></label> <input
								type="text" placeholder="Enter your name" name="name" required>
							<label style="color: black" for="email"><b>Email</b></label> <input
								type="text" placeholder="Enter your email" name="email" required>
							<label style="color: black" for="rating"><b>Rating</b></label>
							<div class="star-rating">
								<input type="radio" id="5-stars" name="rating" value="5" /> <label
									for="5-stars" class="star">&#9733;</label> <input type="radio"
									id="4-stars" name="rating" value="4" /> <label for="4-stars"
									class="star">&#9733;</label> <input type="radio" id="3-stars"
									name="rating" value="3" /> <label for="3-stars" class="star">&#9733;</label>
								<input type="radio" id="2-stars" name="rating" value="2" /> <label
									for="2-stars" class="star">&#9733;</label> <input type="radio"
									id="1-star" name="rating" value="1" /> <label for="1-star"
									class="star">&#9733;</label>
							</div>

							<label style="color: black" for="fTitle"><b>Feedback
									Title</b></label> <input type="text"
								placeholder="Enter your feedback title" name="fTitle" required>

							<label style="color: black" for="review"><b>Body of
									Feedback</b></label>
							<textarea placeholder="Write your feedback here" name="review"
								required></textarea>

							<button class="btn1 mt-3 mb-5" style="width: 15%" type="submit">Submit
								Feedback</button>
						</form>
					</div>
				</div>

				<%
				try {
					Connection con = ConnectionProvider.getCon();
					Statement st = con.createStatement();
					ResultSet rs1 = st.executeQuery("select * from feedbacks where productID='" + id + "'");

					while (rs1.next()) {
				%>
				<div class="review">
					<div class="rating">
						<%
						if (rs1.getInt(5) == 5) {
						%>
						<span class="star">&#9733;</span> <span class="star">&#9733;</span>
						<span class="star">&#9733;</span> <span class="star">&#9733;</span>
						<span class="star">&#9733;</span>
						<%
						}
						%>
						<%
						if (rs1.getInt(5) == 4) {
						%>
						<span class="star">&#9733;</span> <span class="star">&#9733;</span>
						<span class="star">&#9733;</span> <span class="star">&#9733;</span>
						<span class="star">&#9734;</span>
						<%
						}
						%>
						<%
						if (rs1.getInt(5) == 3) {
						%>
						<span class="star">&#9733;</span> <span class="star">&#9733;</span>
						<span class="star">&#9733;</span> <span class="star">&#9734;</span>
						<span class="star">&#9734;</span>
						<%
						}
						%>
						<%
						if (rs1.getInt(5) == 2) {
						%>
						<span class="star">&#9733;</span> <span class="star">&#9733;</span>
						<span class="star">&#9734;</span> <span class="star">&#9734;</span>
						<span class="star">&#9734;</span>
						<%
						}
						%>
						<%
						if (rs1.getInt(5) == 1) {
						%>
						<span class="star">&#9733;</span> <span class="star">&#9734;</span>
						<span class="star">&#9734;</span> <span class="star">&#9734;</span>
						<span class="star">&#9734;</span>
						<%
						}
						%>
					</div>
					<h3>
						<%
						out.println(rs1.getString(6));
						%>
					</h3>
					<h4>
						<%
						out.println(rs1.getString(7));
						%>
						<span>on</span>
						<%
						out.println(rs1.getString(8));
						%>
					</h4>
					<p>
						<%
						out.println(rs1.getString(9));
						%>
					</p>
				</div>

				<%
				}
				} catch (Exception e) {
				System.out.println(e);
				}
				%>

			</div>
		</div>
	</div>
	</div>

	<%@include file="footer.jsp"%>
	<script>
		var buttonPlus = $(".qty-btn-plus");
		var buttonMinus = $(".qty-btn-minus");

		var incrementPlus = buttonPlus.click(function() {
			var $n = $(this).parent(".qty-container").find(".input-qty");
			$n.val(Number($n.val()) + 1);
		});

		var incrementMinus = buttonMinus.click(function() {
			var $n = $(this).parent(".qty-container").find(".input-qty");
			var amount = Number($n.val());
			if (amount > 0) {
				$n.val(amount - 1);
			}
		});
	</script>
	<script>
		function openForm() {
			document.getElementById("reviewForm").style.display = "block";
		}

		function closeForm() {
			document.getElementById("reviewForm").style.display = "none";
		}
	</script>
	<script>
		
	</script>
</body>

</html>