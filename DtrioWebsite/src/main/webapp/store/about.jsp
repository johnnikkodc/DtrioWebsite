<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.http.*"%>
<%@page import="java.sql.*"%>
<%@page import="project.ConnectionProvider"%>
<%@page import="javax.servlet.http.*"%>
<%
String c13 = "", c14 = "", c15 = "", c16 = "", c17 = "", c18 = "", c19 = "", c20 = "", c21 = "", c22 = "", c23 = "",
		c24 = "", c25 = "", c26 = "";

try {

	Connection con = ConnectionProvider.getCon();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select *from media");
	while (rs.next()) {
		if (rs.getInt(1) == 13) {
	c13 = rs.getString(5);

		}
		if (rs.getInt(1) == 14) {
	c14 = rs.getString(5);

		}
		if (rs.getInt(1) == 15) {
	c15 = rs.getString(5);

		}
		if (rs.getInt(1) == 16) {
	c16 = rs.getString(5);

		}
		if (rs.getInt(1) == 17) {
	c17 = rs.getString(5);

		}
		if (rs.getInt(1) == 18) {
	c18 = rs.getString(5);

		}
		if (rs.getInt(1) == 19) {
	c19 = rs.getString(5);

		}
		if (rs.getInt(1) == 20) {
	c20 = rs.getString(5);

		}
		if (rs.getInt(1) == 21) {
	c21 = rs.getString(5);

		}
		if (rs.getInt(1) == 22) {
	c22 = rs.getString(5);

		}
		if (rs.getInt(1) == 23) {
	c23 = rs.getString(5);

		}
		if (rs.getInt(1) == 24) {
	c24 = rs.getString(5);

		}
		if (rs.getInt(1) == 25) {
	c25 = rs.getString(5);

		}
		if (rs.getInt(1) == 26) {
	c26 = rs.getString(5);

		}

	}
} catch (Exception e) {
	System.out.println(e);
}
%>
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

<meta charset="ISO-8859-1">
<title>D'Trio | About us</title>
<style>
.intro, .where-Im-from, .more-about-me {
	color: black;
	max-width: 50em;
	margin-left: auto;
	margin-right: auto;
	margin-top: auto;
	text-align: left;
}

.bold {
	font-weight: bold;
}

.intro>p, .where-Im-from>p, .more-about-me>p {
	font-weight: 300;
	letter-spacing: 0.05em;
}

<<<<<<< HEAD
section>h1 {
	font-size: 32px;
	font-weight: bold;
	margin-bottom: 50px;
	padding-top: 30px;
	font-size: 32px;
	color: #874823;
=======
section > h1 {
 font-size: 32px;
  font-weight: bold;
 margin-bottom: 30px;
  padding-top: 30px;
  font-size: 32px;
color: #874823;
>>>>>>> branch 'master' of https://github.com/johnnikkodc/DTrio.git
}
</style>
</head>
<br>
<br>
<br>
<br>
<br>
<body>
	<section class="intro">
		<h1 style="padding-top: 0px;">Introduction</h1>
		<p class="text-justify">
			<%
			out.println(c13);
			%>
		</p>
		<p class="text-justify">
			<%
			out.println(c14);
			%>
		</p>
		<p class="text-justify">
			<%
			out.println(c15);
			%>.
		</p>
		<p class="text-justify">
			<%
			out.println(c16);
			%>
		</p>
		<p class="text-justify">
			<%
			out.println(c17);
			%>
		</p>
		<p class="text-justify">
			<%
			out.println(c18);
			%>
		</p>
		<p class="text-justify">
			<%
			out.println(c19);
			%>
		</p>
	</section>
	<section class="intro">
		<h1>Mission</h1>
		<p class="text-justify">
			<%
			out.println(c20);
			%>
		</p>
	</section>
	<section class="intro">
		<h1>Vision</h1>
		<p class="text-justify">
			<%
			out.println(c21);
			%>
		</p>
	</section>
	<section class="intro">
		<h1>Values</h1>
		<p class="text-justify">
			<%
			out.println(c22);
			%>
		</p>

		<p class="text-justify"><%
			out.println(c23);
			%>.</p>

		<p class="text-justify"><%
			out.println(c24);
			%></p>

		<p class="text-justify"><%
			out.println(c25);
			%></p>

		<p class="text-justify"><%
			out.println(c26);
			%></p>

	</section>


	<%@include file="footer.jsp"%>
</body>
</html>