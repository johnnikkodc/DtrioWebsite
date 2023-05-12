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
</style>
<meta charset="ISO-8859-1">
<title>Pocket Beans</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<!-- Container for the image gallery -->
				<div class="container" style="padding: 30px">
					<!-- Full-width images with number text -->
					<img src="../img/Beans3.png"
						style="width: 100%; border-radius: 25px">
				</div>
			</div>
			<div class="col-md-6" style="padding-right: 50px">
				<div class="product-dtl" style="padding-top: 60px">
					<div class="product-info">
						<span>Coffee Beans</span>
						<h2 style="font-weight: bold">Pocket Beans</h2>
						<span style="color: pink; font-weight: bold">PHP250.00</span>
					</div>
					<br>
					<p>If you're having trouble choosing the perfect bean, try our
						pocket beans! These 50-gram packages, which make one or two cups,
						allow you to sample our selection of coffees. You can select one
						or both of our single-origin beans, freshly harvested: Pacamara
						#149, with tropical fruit, earl grey tea, and cacao nib notes, or
						Masha G1, with peach, lychee, berries, and jasmine tea flavors,
						both medium roasted. Additionally, you can choose to get the beans
						whole or ground to suit your preferred brewing method.</p>
					<br>
					<div class="product-count">
						<div class="qty-container">
							<button class="qty-btn-minus btn-light" type="button">
								<i class="fa fa-minus"></i>
							</button>
							<input type="text" name="qty" value="0" class="input-qty" />
							<button class="qty-btn-plus btn-light" type="button">
								<i class="fa fa-plus"></i>
							</button>
						</div>
						<form action="../actions/AddToCartAction.jsp?id=100008"
							method="post">
							<button class="btn1 mt-3 mb-5" style="width: 30%" type="submit">
								Add to cart <i class="fa fa-shopping-cart"></i>
							</button>
						</form>
					</div>
				</div>
			</div>

			<div class="col-md-12">
				<div class="container">
					<h2 style="font-weight: bold; text-align: left">Customer
						Feedbacks</h2>
					<div class="rating">
						<span class="star">&#9733;</span> <span class="star">&#9733;</span>
						<span class="star">&#9733;</span> <span class="star">&#9733;</span>
						<span class="star">&#9734;</span> <span>Based on 3 reviews</span>
						<span style="float: right; color: #FFD700"><a
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
									type="text" placeholder="Enter your email" name="email"
									required> <label style="color: black" for="rating"><b>Rating</b></label>
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


					<div class="review">
						<div class="rating">
							<span class="star">&#9733;</span> <span class="star">&#9733;</span>
							<span class="star">&#9733;</span> <span class="star">&#9733;</span>
							<span class="star">&#9734;</span>
						</div>
						<h3>New Fave</h3>
						<h4>
							Lance E. <span>on</span> Dec 14, 2022
						</h4>
						<p>I was about to order cold brew from TH via Grab but
							couldn't find a store near me so I tried to look for a different
							store and good thing I saw this. Savings + Quality coffee =
							instant fave</p>
					</div>
					<div class="review">
						<div class="rating">
							<span class="star">&#9733;</span> <span class="star">&#9733;</span>
							<span class="star">&#9733;</span> <span class="star">&#9733;</span>
							<span class="star">&#9734;</span>
						</div>
						<h3>Repeat Customer</h3>
						<h4>
							Vivian S. <span>on</span> Jul 14, 2022
						</h4>
						<p>Honestly this cold brew is saving my life!! Tastes sooo
							good! Idk why i held back so many times</p>
					</div>
					<div class="review">
						<div class="rating">
							<span class="star">&#9733;</span> <span class="star">&#9733;</span>
							<span class="star">&#9733;</span> <span class="star">&#9733;</span>
							<span class="star">&#9734;</span>
						</div>
						<h3>Feedback Title</h3>
						<h4>
							Customer Name <span>on</span> Date
						</h4>
						<p>Feedback text</p>
					</div>
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