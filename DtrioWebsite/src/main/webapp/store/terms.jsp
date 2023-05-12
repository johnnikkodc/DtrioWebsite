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

<link rel=”stylesheet”
	href=”https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css”rel=”nofollow”
	integrity=”sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm”
	crossorigin=”anonymous”>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">

<meta charset="ISO-8859-1">
<title>D'Trio | Terms and Conditions</title>
<style>
.testim {
<<<<<<< HEAD
	color: black;
	max-width: 50em;
	margin-left: auto;
	margin-right: auto;
	margin-top: auto;
	text-align: left;
=======
	color:black;
  max-width: 50em;
  margin-left: auto;
  margin-right: auto;
  margin-top: auto;
  text-align: left;
  letter-spacing: 0.05em;
>>>>>>> branch 'master' of https://github.com/johnnikkodc/DTrio.git
}

.termsAndConditionsHeading {
	margin-bottom: 30px;
	font-size: 32px;
	font-weight: bold;
}

.termsParagraphIntro {
font-weight: 300;
	margin-right: 15px;
	margin-top: 15px;
	margin-bottom: 15px;
	letter-spacing: 0.05em;
}

.spangleWelcome {
	font-weight: 500;
	  letter-spacing: 0.05em;
}

.serviceLeadingSection {
	width: 80%;
	margin-top: 15px;
	margin-bottom: 15px;
}

.sn {
	font-size: 32px;
	padding-right: 5px;
	font-weight: bold;
}

.st {
	font-size: 32px;
	font-weight: bold;
}

.spl {
	margin-top: 15px;
	margin-bottom: 15px;
}

.serviceInfoContainer {
	position: relative;
	width: 100%;
}

.serviceLead {
	font-weight: 700;
	margin-left: 15px;
	margin-top: 15px;
	margin-block-end: 5px;
}

.serviceDetails {
	margin-left: 15px;
	  font-weight: 300;
  letter-spacing: 0.05em;
}

.displayNone {
	display: none;
}

.secionLine {
	height: 40px;
	width: 5px;
	position: absolute;
	top: 7px;
}
/*Font Colours below*/
.brown {
	color: #874823;
}

/*Set the colours for the lines*/
.lineColorBrown {
	background-color: #874823;
}
</style>

</head>
<br>
<br>
<br>
<br>
<br>
<body>
	<div class="testim">
		<div class="termsAndConditions">
			<h1 class="termsAndConditionsHeading brown">
				<b>Terms and Conditions</b>
			</h1>
			<h4 class="spangleWelcome">
				Welcome to <span style="color: #874823; font-weight: bold;">D'Trio</span>
			</h4>
			<p class="termsParagraphIntro">We are happy to provide you with
				delicious coffee and other products. Before you start using our
				services, please read these terms and conditions carefully. By
				accessing or using our services, you agree to be bound by these
				terms and conditions. If you do not agree to these terms and
				conditions, you should not use our services.</p>
				<%
					try {
						Connection con = ConnectionProvider.getCon();
						Statement st = con.createStatement();
						Statement st2 = con.createStatement();
						ResultSet rs1 = st.executeQuery("select distinct category from terms");

						while (rs1.next()) {
					%>
			<div class="serviceLeadingSection">
				<h4>
					
					<span class="st brown">
						<%
						out.println(rs1.getString(1));
						%>
					</span>
				</h4>

				<%
				ResultSet rs2 = st2.executeQuery("select * from terms where category='" + rs1.getString(1) + "'");
				while (rs2.next()) {
				%>
				<div class="serviceInfoContainer">

					<h6 class="serviceLead">
						<%
						out.println(rs2.getString(2));
						%>
					</h6>
					<p class="serviceDetails">
						<%
						out.println(rs2.getString(3));
						%>
					</p>
					<div class="secionLine lineColorBrown"></div>
				</div>
				<%
				}
				%>
			</div>
			<%
			}
			} catch (Exception e) {
			System.out.println(e);
			}
			%>




		</div>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>