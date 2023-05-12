<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="javax.servlet.*"%>
	<%@page import="javax.servlet.http.*"%>
	<%@page import="java.sql.*"%>
<%@page import="project.ConnectionProvider"%>
<%@page import="javax.servlet.http.*"%>
<%
HttpSession ses = request.getSession(false);
if (ses == null || ses.getAttribute("loggedInUser") == null) {

%>
<%@include file="header.jsp"%>
<% 
} else {


%>
<%@include file="header2.jsp"%>
<%} %>
<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0);
//prevents caching at the proxy server
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>D'Trio | Products Page</title>
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
@import url("https://fonts.googleapis.com/css?family=Raleway:400,700&display=swap");
:root {
  box-sizing: border-box;
  --clr-head: #0c3653;
  --clr-accent: #f98169;
  --clr-body: #aeb2b4;
  --fs-h2: 3rem;
  --fs-h4: 1.8rem;
  --ff-body: "Raleway", sans-serif;
}
*,
*::before,
*::after {
  margin: 0;
  padding: 0;
  box-sizing: inherit;
}

html,
body {
   min-height: 200px;
   margin-bottom: 250px;
   clear: both;
}
html {
  font-size: 62.5%;
}
body {
  color: var(--clr-body);
  font-family: var(--ff-body);
  font-size: 1.6rem;
  min-height: 100vh;
  line-height: 1.6;
}

h2,
h4 {
  color: var(--clr-head);
}

h2 {
  font-size: var(--fs-h2);
}

.wrapper {
  max-width: 1200px;
  width: 100%;
  margin:  3em auto;
  padding: 0 2em;
}

.head-title {
  text-align: center;
}

.head-text {
  max-width: 520px;
  margin: auto;
  margin-top: 0.5em;
}

.cards {
  max-width: 100%;
  width: 1100px;
  margin-top: 3em;
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
  grid-gap: 6rem;
}

.card {
  display: flex;
  flex-direction: column;
  border-radius: 13px;
  overflow: hidden;
  position: relative;
  cursor: pointer;
  transition: all 300ms ease-in-out;
}

.card:hover {
  transform: translateY(-5px);
  box-shadow: 10px 15px 50px 0 rgba(0, 0, 0, 0.09);
}

.card__image {
  width: 100%;
  height: 100%;
  object-fit: cover;
  object-position: center;
}

.card__content {
  padding: 2em 1.4em;
  background-color: #fff;
}

.card__header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  margin-bottom: 1em;
}

.card__price {
  font-size: 2.5rem;
  color: var(--clr-accent);
}
.card__text {
  font-size: 1.4rem;
}
</style>
</head>
<br>
<br>

<body>
<%
String c28="";
	
				try {
					
					Connection con=ConnectionProvider.getCon();
					Statement st = con.createStatement();
					ResultSet rs = st.executeQuery("select *from media");
					while (rs.next()) {
						if(rs.getInt(1)==28){
							c28=rs.getString(3);
							
						}
						
						
					}
				} catch (Exception e) {
				System.out.println(e);
				}
				%>
<div class="wrapper">
  <div class="w3-display-container w3-container" style="margin-right:45px">
			<img src="../img/<%out.println(c28); %>" alt="watch" style="width:100%; border-radius:25px">
			<div class="w3-display-topleft w3-text-white" style="padding:70px 140px">
				<h1 style="font-weight: bold">COFFEE BEANS</h1>
			</div>
		</div>
  <div class="cards">
  <%
				try {
					Connection con=ConnectionProvider.getCon();
					Statement st2 = con.createStatement();
					String type="beans";
					ResultSet rs2 = st2.executeQuery("select *from product where category='" + type + "'");
					while (rs2.next()) {
						
				%>
   <div class="card" style = "background-color:white">
      <a href="coffeebeans.jsp?id=<%=rs2.getString(1)%>" style=text-decoration:none;><img class="card__image" src="../img/<%=rs2.getString(5)%>" alt=""></a>
      <div class="card__content">
        <div class="card__header">
          <h4 class="card__title" style="font-weight: bold"><%=rs2.getString(2)%></h4>
          <span class="card__price" style="font-weight: bold">PHP<%=rs2.getString(3)%></span>
        </div>
        <p class="card__text" style="color:black;"><%=rs2.getString(12)%></p>
      </div>
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