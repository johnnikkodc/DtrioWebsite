<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
		<%@page import="java.sql.*"%>
<%@page import="project.ConnectionProvider"%>
<%@page import="javax.servlet.http.*"%>
<%
String c1="",c7="",c8="",c9="",c10="",c11="",c12="";
	
				try {
					
					Connection con=ConnectionProvider.getCon();
					Statement st = con.createStatement();
					ResultSet rs = st.executeQuery("select *from media");
					while (rs.next()) {
						if(rs.getInt(1)==1){
							c1=rs.getString(3);
							
						}
						if(rs.getInt(1)==7){
							c7=rs.getString(5);
							
						}
						if(rs.getInt(1)==8){
							c8=rs.getString(5);
							
						}
						if(rs.getInt(1)==9){
							c9=rs.getString(5);
							
						}
						if(rs.getInt(1)==10){
							c10=rs.getString(5);
							
						}
						if(rs.getInt(1)==11){
							c11=rs.getString(5);
							
						}
						if(rs.getInt(1)==12){
							c12=rs.getString(5);
							
						}

					}
				} catch (Exception e) {
				System.out.println(e);
				}
				%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
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

</head>
<body>
	<footer class="footer-distributed">
		<div class="footer-left">
			<img src="../img/<%out.println(c1); %>" class="logo">

			<p class="footer-links">
				<a href="#">Home</a> | <a href="#">About us</a> | <a href="#">Products</a>
				| <a href="#">FAQ</a> | <a href="#">Reseller Application</a>
			</p>
			<p class="footer-company-name">
				Copyright © 2023 <Strong>D'Trio</Strong> All rights reserved
			</p>
		</div>
		<div class="footer-center">
			<div>
				<i class="ri-map-pin-line"></i>
				<p>
					<span><%out.println(c7); %></span> 
				</p>
			</div>
			<div>
				<i class="ri-phone-line"></i>
				<p><%out.println(c8); %></p>
			</div>
			<div>
				<i class="ri-mail-line"></i>
				<p><%out.println(c9); %></p>
			</div>
			</div>
			<div class="footer-right">
				<p class="footer-company-about">
					<span>About the company</span> <Strong>D'Trio</Strong> <%out.println(c10); %>
				</p>
				<div class="footer-icons">
					<a href="<%out.println(c11); %>"><i class="ri-facebook-circle-line"></i></a> 
					<a href="<%out.println(c12); %>"><i class="ri-instagram-line"></i></a>

				</div>
			</div>
		
	</footer>
</body>
<script src="../js/gotop.js"></script>
</html>