
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.http.*"%>
<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.http.*"%>
<%@page import="java.sql.*"%>


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
<%
}
%>


<%
String c2 = "", c3 = "", c4 = "", c5 = "", c6 = "";

try {

	Connection con = ConnectionProvider.getCon();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select *from media");
	while (rs.next()) {
		if (rs.getInt(1) == 2) {
	c2 = rs.getString(5);

		}
		if (rs.getInt(1) == 3) {
	c3 = rs.getString(3);

		}
		if (rs.getInt(1) == 4) {
	c4 = rs.getString(3);

		}
		if (rs.getInt(1) == 5) {
	c5 = rs.getString(3);

		}
		if (rs.getInt(1) == 6) {
	c6 = rs.getString(3);

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
<title>D'Trio Coffee Syrup</title>
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/homepage.css">
<link rel="stylesheet" href="../css/product.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Inconsolata">
<style>
@import
	url("https://fonts.googleapis.com/css?family=Raleway:400,700&display=swap")
	;

:root {
	box-sizing: border-box; -
	-clr-head: #0c3653; -
	-clr-accent: #f98169; -
	-clr-body: #aeb2b4; -
	-fs-h2: 3rem; -
	-fs-h4: 1.8rem; -
	-ff-body: "Raleway", sans-serif;
}

*, *::before, *::after {
	margin: 0;
	padding: 0;
	box-sizing: inherit;
}

html, body {
	min-height: 200px;
	margin-bottom: 250px;
	clear: both;
}

html {
	font-size: 62.5%;
}

body {
	color: var(- -clr-body);
	font-family: var(- -ff-body);
	font-size: 1.6rem;
	min-height: 100vh;
	line-height: 1.6;
}

h2, h4 {
	color: var(- -clr-head);
}

h2 {
	font-size: var(- -fs-h2);
}

.wrapper {
	width: 100%;
	max-width: 1200px; /* adjust the maximum width as needed */
	margin: 0 auto;
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
	width: 2000px;
	margin-top: 3em;
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
	grid-gap: 7rem;
}

.card {
	display: flex;
	flex-direction: column;
	border-radius: 13px;
	overflow: hidden;
	position: relative;
	cursor: pointer;
	transition: all 300ms ease-in-out;
	background-color: white;
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
	color: var(- -clr-accent);
}

.card__text {
	font-size: 1.4rem;
}

@import
	url(//cdn.rawgit.com/rtaibah/dubai-font-cdn/master/dubai-font.css);

*, *:after, *:before {
	margin: 0;
	padding: 0;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	-ms-box-sizing: border-box;
	-o-box-sizing: border-box;
	box-sizing: border-box;
	-webkit-user-select: none;
	-ms-user-select: none;
	-o-user-select: none;
	-moz-user-select: none;
	user-select: none;
	cursor: default;
}

.testim {
	border-radius: 13px;
	background-color: white;
	margin: 10px auto;
	margin-top: 3em;
	position: relative;
	width: 1100px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	right: 17px; /* or any value you want */
}

.testim .wrap {
	position: relative;
	width: 100%;
	max-width: 1020px;
	padding: 40px 20px;
	margin: auto;
}

.testim .arrow {
	display: block;
	position: absolute;
	color: #aaa;
	cursor: pointer;
	font-size: 2em;
	top: 50%;
	-webkit-transform: translateY(-50%);
	-ms-transform: translateY(-50%);
	-moz-transform: translateY(-50%);
	-o-transform: translateY(-50%);
	transform: translateY(-50%);
	-webkit-transition: all .3s ease-in-out;
	-ms-transition: all .3s ease-in-out;
	-moz-transition: all .3s ease-in-out;
	-o-transition: all .3s ease-in-out;
	transition: all .3s ease-in-out;
	padding: 5px;
	z-index: 22222222;
}

.testim .arrow:before {
	cursor: pointer;
}

.testim .arrow:hover {
	color: #874823;
}

.testim .arrow.left {
	left: 10px;
}

.testim .arrow.right {
	right: 10px;
}

.testim .dots {
	text-align: center;
	position: absolute;
	width: 100%;
	bottom: 60px;
	left: 0;
	display: block;
	z-index: 3333;
	height: 12px;
}

.testim .dots .dot {
	list-style-type: none;
	display: inline-block;
	width: 12px;
	height: 12px;
	border-radius: 50%;
	border: 1px solid #eee;
	margin: 0 10px;
	cursor: pointer;
	-webkit-transition: all .5s ease-in-out;
	-ms-transition: all .5s ease-in-out;
	-moz-transition: all .5s ease-in-out;
	-o-transition: all .5s ease-in-out;
	transition: all .5s ease-in-out;
	position: relative;
}

.testim .dots .dot.active, .testim .dots .dot:hover {
	background: #874823;
	border-color: #874823;
}

.testim .dots .dot.active {
	-webkit-animation: testim-scale .5s ease-in-out forwards;
	-moz-animation: testim-scale .5s ease-in-out forwards;
	-ms-animation: testim-scale .5s ease-in-out forwards;
	-o-animation: testim-scale .5s ease-in-out forwards;
	animation: testim-scale .5s ease-in-out forwards;
}

.testim .cont {
	position: relative;
	overflow: hidden;
}

.testim .cont>div {
	text-align: center;
	position: absolute;
	top: 0;
	left: 0;
	padding: 0 0 70px 0;
	opacity: 0;
}

.testim .cont>div.inactive {
	opacity: 1;
}

.testim .cont>div.active {
	position: relative;
	opacity: 1;
}

.testim .cont div .img img {
	display: block;
	width: 100px;
	height: 100px;
	margin: auto;
	border-radius: 50%;
}

.testim .cont div h2 {
	font-weight: bold;
	color: black;
	font-size: 1em;
	margin: 15px 0;
}

.testim .cont div p {
	font-size: 1.15em;
	font-style: italic;
	color: black;
	width: 80%;
	margin: auto;
}

.testim .cont div.active .img img {
	-webkit-animation: testim-show .5s ease-in-out forwards;
	-moz-animation: testim-show .5s ease-in-out forwards;
	-ms-animation: testim-show .5s ease-in-out forwards;
	-o-animation: testim-show .5s ease-in-out forwards;
	animation: testim-show .5s ease-in-out forwards;
}

.testim .cont div.active h2 {
	-webkit-animation: testim-content-in .4s ease-in-out forwards;
	-moz-animation: testim-content-in .4s ease-in-out forwards;
	-ms-animation: testim-content-in .4s ease-in-out forwards;
	-o-animation: testim-content-in .4s ease-in-out forwards;
	animation: testim-content-in .4s ease-in-out forwards;
}

.testim .cont div.active p {
	-webkit-animation: testim-content-in .5s ease-in-out forwards;
	-moz-animation: testim-content-in .5s ease-in-out forwards;
	-ms-animation: testim-content-in .5s ease-in-out forwards;
	-o-animation: testim-content-in .5s ease-in-out forwards;
	animation: testim-content-in .5s ease-in-out forwards;
}

.testim .cont div.inactive .img img {
	-webkit-animation: testim-hide .5s ease-in-out forwards;
	-moz-animation: testim-hide .5s ease-in-out forwards;
	-ms-animation: testim-hide .5s ease-in-out forwards;
	-o-animation: testim-hide .5s ease-in-out forwards;
	animation: testim-hide .5s ease-in-out forwards;
}

.testim .cont div.inactive h2 {
	-webkit-animation: testim-content-out .4s ease-in-out forwards;
	-moz-animation: testim-content-out .4s ease-in-out forwards;
	-ms-animation: testim-content-out .4s ease-in-out forwards;
	-o-animation: testim-content-out .4s ease-in-out forwards;
	animation: testim-content-out .4s ease-in-out forwards;
}

.testim .cont div.inactive p {
	-webkit-animation: testim-content-out .5s ease-in-out forwards;
	-moz-animation: testim-content-out .5s ease-in-out forwards;
	-ms-animation: testim-content-out .5s ease-in-out forwards;
	-o-animation: testim-content-out .5s ease-in-out forwards;
	animation: testim-content-out .5s ease-in-out forwards;
}

@
-webkit-keyframes testim-scale { 0% {
	-webkit-box-shadow: 0px 0px 0px 0px #eee;
	box-shadow: 0px 0px 0px 0px #eee;
}

35


%
{
-webkit-box-shadow


:


0px


0px


10px


5px


#eee
;


box-shadow


:


0px


0px


10px


5px


#eee
;


}
70


%
{
-webkit-box-shadow


:


0px


0px


10px


5px


#ea830e
;


box-shadow


:


0px


0px


10px


5px


#ea830e
;


}
100


%
{
-webkit-box-shadow


:


0px


0px


0px


0px


#ea830e
;


box-shadow


:


0px


0px


0px


0px


#ea830e
;


}
}
<<<<<<<
master

35


 % { -webkit-box-shadow


:


0px


0px


10px


5px


#eee
 ; box-shadow


:


0px


0px


10px


5px


#eee
 ; ======= @-moz-keyframes testim-scale { 0% {
	-moz-box-shadow: 0px 0px 0px 0px #eee;
	box-shadow: 0px 0px 0px 0px #eee;
}

35


%
{
-moz-box-shadow


:


0px


0px


10px


5px


#eee
;


box-shadow


:


0px


0px


10px


5px


#eee
;


}
70


%
{
-moz-box-shadow


:


0px


0px


10px


5px


#ea830e
;


box-shadow


:


0px


0px


10px


5px


#ea830e
;


}
100


%
{
-moz-box-shadow


:


0px


0px


0px


0px


#ea830e
;


box-shadow


:


0px


0px


0px


0px


#ea830e
;


}
>>>>>>>
6b4f861

 

lancer




}
<<<<<<<
master
70


 % { -webkit-box-shadow


:


0px


0px


10px


5px


#ea830e
 ; box-shadow


:


0px


0px


10px


5px


#ea830e
 ; ======= @-ms-keyframes testim-scale { 0% {
	-ms-box-shadow: 0px 0px 0px 0px #eee;
	box-shadow: 0px 0px 0px 0px #eee;
}

35


%
{
-ms-box-shadow


:


0px


0px


10px


5px


#eee
;


box-shadow


:


0px


0px


10px


5px


#eee
;


}
70


%
{
-ms-box-shadow


:


0px


0px


10px


5px


#ea830e
;


box-shadow


:


0px


0px


10px


5px


#ea830e
;


}
100


%
{
-ms-box-shadow


:


0px


0px


0px


0px


#ea830e
;


box-shadow


:


0px


0px


0px


0px


#ea830e
;


}
>>>>>>>
6b4f861

 

lancer




}
<<<<<<<
master
100


 % { -webkit-box-shadow


:


0px


0px


0px


0px


#ea830e
 ; box-shadow


:


0px


0px


0px


0px


#ea830e
 ; ======= @-o-keyframes testim-scale { 0% {
	-o-box-shadow: 0px 0px 0px 0px #eee;
	box-shadow: 0px 0px 0px 0px #eee;
}

35


%
{
-o-box-shadow


:


0px


0px


10px


5px


#eee
;


box-shadow


:


0px


0px


10px


5px


#eee
;


}
70


%
{
-o-box-shadow


:


0px


0px


10px


5px


#ea830e
;


box-shadow


:


0px


0px


10px


5px


#ea830e
;


}
100


%
{
-o-box-shadow


:


0px


0px


0px


0px


#ea830e
;


box-shadow


:


0px


0px


0px


0px


#ea830e
;


}
>>>>>>>
6b4f861

 

lancer




}
@
keyframes testim-scale { 0% {
	box-shadow: 0px 0px 0px 0px #eee;
}

35


%
{
box-shadow


:


0px


0px


10px


5px


#eee
;


}
70


%
{
box-shadow


:


0px


0px


10px


5px


#ea830e
;


}
100


%
{
box-shadow


:


0px


0px


0px


0px


#ea830e
;


}
}
@
-webkit-keyframes testim-content-in {from { opacity:0;
	-webkit-transform: translateY(100%);
	transform: translateY(100%);
}

to {
	opacity: 1;
	-webkit-transform: translateY(0);
	transform: translateY(0);
}

}
<<<<<<<
master

35


 % { -moz-box-shadow


:


0px


0px


10px


5px


#eee
 ; box-shadow


:


0px


0px


10px


5px


#eee
 ; ======= @-moz-keyframes testim-content-in {from { opacity:0;
	-moz-transform: translateY(100%);
	transform: translateY(100%);
}

to {
	opacity: 1;
	-moz-transform: translateY(0);
	transform: translateY(0);
}

>>>>>>>
6b4f861

 

lancer




}
<<<<<<<
master
70


 % { -moz-box-shadow


:


0px


0px


10px


5px


#ea830e
 ; box-shadow


:


0px


0px


10px


5px


#ea830e
 ; ======= @-ms-keyframes testim-content-in {from { opacity:0;
	-ms-transform: translateY(100%);
	transform: translateY(100%);
}

to {
	opacity: 1;
	-ms-transform: translateY(0);
	transform: translateY(0);
}

>>>>>>>
6b4f861

 

lancer




}
<<<<<<<
master
100


 % { -moz-box-shadow


:


0px


0px


0px


0px


#ea830e
 ; box-shadow


:


0px


0px


0px


0px


#ea830e
 ; ======= @-o-keyframes testim-content-in {from { opacity:0;
	-o-transform: translateY(100%);
	transform: translateY(100%);
}

to {
	opacity: 1;
	-o-transform: translateY(0);
	transform: translateY(0);
}

>>>>>>>
6b4f861

 

lancer




}
@
keyframes testim-content-in {from { opacity:0;
	transform: translateY(100%);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}
@
-webkit-keyframes testim-content-out {from { opacity:1;
	-webkit-transform: translateY(0);
	transform: translateY(0);
}

to {
	opacity: 0;
	-webkit-transform: translateY(-100%);
	transform: translateY(-100%);
}

}
<<<<<<<
master

35


 % { -ms-box-shadow


:


0px


0px


10px


5px


#eee
 ; box-shadow


:


0px


0px


10px


5px


#eee
 ; ======= @-moz-keyframes testim-content-out {from { opacity:1;
	-moz-transform: translateY(0);
	transform: translateY(0);
}

to {
	opacity: 0;
	-moz-transform: translateY(-100%);
	transform: translateY(-100%);
}

>>>>>>>
6b4f861

 

lancer




}
<<<<<<<
master
70


 % { -ms-box-shadow


:


0px


0px


10px


5px


#ea830e
 ; box-shadow


:


0px


0px


10px


5px


#ea830e
 ; ======= @-ms-keyframes testim-content-out {from { opacity:1;
	-ms-transform: translateY(0);
	transform: translateY(0);
}

to {
	opacity: 0;
	-ms-transform: translateY(-100%);
	transform: translateY(-100%);
}

>>>>>>>
6b4f861

 

lancer




}
<<<<<<<
master
100


 % { -ms-box-shadow


:


0px


0px


0px


0px


#ea830e
 ; box-shadow


:


0px


0px


0px


0px


#ea830e
 ; ======= @-o-keyframes testim-content-out {from { opacity:1;
	-o-transform: translateY(0);
	transform: translateY(0);
}

to {
	opacity: 0;
	transform: translateY(-100%);
	transform: translateY(-100%);
}

>>>>>>>
6b4f861

 

lancer




}
@
keyframes testim-content-out {from { opacity:1;
	transform: translateY(0);
}

to {
	opacity: 0;
	transform: translateY(-100%);
}

}
@
-webkit-keyframes testim-show {from { opacity:0;
	-webkit-transform: scale(0);
	transform: scale(0);
}

to {
	opacity: 1;
	-webkit-transform: scale(1);
	transform: scale(1);
}

}
<<<<<<<
master





35






%
{
-o-box-shadow






:






0px






0px






10px






5px






#eee




;
box-shadow






:






0px






0px






10px






5px






#eee




;
}
70






%
{
-o-box-shadow






:






0px






0px






10px






5px






#ea830e




;
box-shadow






:






0px






0px






10px






5px






#ea830e




;
}
100






%
{
-o-box-shadow






:






0px






0px






0px






0px






#ea830e




;
box-shadow






:






0px






0px






0px






0px






#ea830e




;
}
}
@
keyframes testim-scale { 0% {
	box-shadow: 0px 0px 0px 0px #eee;
}

35






%
{
box-shadow






:






0px






0px






10px






5px






#eee




;
}
70






%
{
box-shadow






:






0px






0px






10px






5px






#ea830e




;
}
100






%
{
box-shadow






:






0px






0px






0px






0px






#ea830e




;
}
}
@
-webkit-keyframes testim-content-in {from { opacity:0;
	-webkit-transform: translateY(100%);
	transform: translateY(100%);
}

to {
	opacity: 1;
	-webkit-transform: translateY(0);
	transform: translateY(0);
}

}
@
-moz-keyframes testim-content-in {from { opacity:0;
	-moz-transform: translateY(100%);
	transform: translateY(100%);
}

to {
	opacity: 1;
	-moz-transform: translateY(0);
	transform: translateY(0);
}

}
@
-ms-keyframes testim-content-in {from { opacity:0;
	-ms-transform: translateY(100%);
	transform: translateY(100%);
}

to {
	opacity: 1;
	-ms-transform: translateY(0);
	transform: translateY(0);
}

}
@
-o-keyframes testim-content-in {from { opacity:0;
	-o-transform: translateY(100%);
	transform: translateY(100%);
}

to {
	opacity: 1;
	-o-transform: translateY(0);
	transform: translateY(0);
}

}
@
keyframes testim-content-in {from { opacity:0;
	transform: translateY(100%);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}
@
-webkit-keyframes testim-content-out {from { opacity:1;
	-webkit-transform: translateY(0);
	transform: translateY(0);
}

to {
	opacity: 0;
	-webkit-transform: translateY(-100%);
	transform: translateY(-100%);
}

}
@
-moz-keyframes testim-content-out {from { opacity:1;
	-moz-transform: translateY(0);
	transform: translateY(0);
}

to {
	opacity: 0;
	-moz-transform: translateY(-100%);
	transform: translateY(-100%);
}

}
@
-ms-keyframes testim-content-out {from { opacity:1;
	-ms-transform: translateY(0);
	transform: translateY(0);
}

to {
	opacity: 0;
	-ms-transform: translateY(-100%);
	transform: translateY(-100%);
}

}
@
-o-keyframes testim-content-out {from { opacity:1;
	-o-transform: translateY(0);
	transform: translateY(0);
}

to {
	opacity: 0;
	transform: translateY(-100%);
	transform: translateY(-100%);
}

}
@
keyframes testim-content-out {from { opacity:1;
	transform: translateY(0);
}

to {
	opacity: 0;
	transform: translateY(-100%);
}

}
@
-webkit-keyframes testim-show {from { opacity:0;
	-webkit-transform: scale(0);
	transform: scale(0);
}

to {
	opacity: 1;
	-webkit-transform: scale(1);
	transform: scale(1);
}

}
@
-moz-keyframes testim-show {from { opacity:0;
	-moz-transform: scale(0);
	transform: scale(0);
}

to {
	opacity: 1;
	-moz-transform: scale(1);
	transform: scale(1);
}

}
@
-ms-keyframes testim-show {from { opacity:0;
	-ms-transform: scale(0);
	transform: scale(0);
}

to {
	opacity: 1;
	-ms-transform: scale(1);
	transform: scale(1);
}

}
@
-o-keyframes testim-show {from { opacity:0;
	-o-transform: scale(0);
	transform: scale(0);
}

to {
	opacity: 1;
	-o-transform: scale(1);
	transform: scale(1);
}

}
@
keyframes testim-show {from { opacity:0;
	transform: scale(0);
}

to {
	opacity: 1;
	transform: scale(1);
}

}
@
-webkit-keyframes testim-hide {from { opacity:1;
	-webkit-transform: scale(1);
	transform: scale(1);
}

to {
	opacity: 0;
	-webkit-transform: scale(0);
	transform: scale(0);
}

}
@
-moz-keyframes testim-hide {from { opacity:1;
	-moz-transform: scale(1);
	transform: scale(1);
}

to {
	opacity: 0;
	-moz-transform: scale(0);
	transform: scale(0);
}

}
@
-ms-keyframes testim-hide {from { opacity:1;
	-ms-transform: scale(1);
	transform: scale(1); ======= @ -moz-keyframes testim-show { from {
	opacity : 0;
	-moz-transform: scale(0);
	transform: scale(0);
}

to {
	opacity: 1;
	-moz-transform: scale(1);
	transform: scale(1);
}

>>>>>>>
6b4f861

 

lancer




}
@
-ms-keyframes testim-show {from { opacity:0;
	-ms-transform: scale(0);
	transform: scale(0);
}

to {
	opacity: 1;
	-ms-transform: scale(1);
	transform: scale(1);
}

}
@
-o-keyframes testim-show {from { opacity:0;
	-o-transform: scale(0);
	transform: scale(0);
}

to {
	opacity: 1;
	-o-transform: scale(1);
	transform: scale(1);
}

}
@
keyframes testim-show {from { opacity:0;
	transform: scale(0);
}

to {
	opacity: 1;
	transform: scale(1);
}

}
@
-webkit-keyframes testim-hide {from { opacity:1;
	-webkit-transform: scale(1);
	transform: scale(1);
}

to {
	opacity: 0;
	-webkit-transform: scale(0);
	transform: scale(0);
}

}
@
-moz-keyframes testim-hide {from { opacity:1;
	-moz-transform: scale(1);
	transform: scale(1);
}

to {
	opacity: 0;
	-moz-transform: scale(0);
	transform: scale(0);
}

}
@
-ms-keyframes testim-hide {from { opacity:1;
	-ms-transform: scale(1);
	transform: scale(1);
}

to {
	opacity: 0;
	-ms-transform: scale(0);
	transform: scale(0);
}

}
@
-o-keyframes testim-hide {from { opacity:1;
	-o-transform: scale(1);
	transform: scale(1);
}

to {
	opacity: 0;
	-o-transform: scale(0);
	transform: scale(0);
}

}
@
keyframes testim-hide {from { opacity:1;
	transform: scale(1);
}

to {
	opacity: 0;
	transform: scale(0);
}

}
@media all and (max-width: 300px) {
	body {
		font-size: 14px;
	}
}

@media all and (max-width: 500px) {
	.testim .arrow {
		font-size: 1.5em;
	}
	.testim .cont div p {
		line-height: 25px;
	}
}
</style>
</head>




<body>
	<section>
		<div class="circle"></div>
		<div class="content">
			<div class="textbox">
				<h2 style="color: black">
					Taste of Delight<br>It's <span>D'Trio</span>
				</h2>
				<p>
					<%
					out.println(c2);
					%><br>
				</p>
				<br> <a href="about.jsp">Learn More</a>
			</div>
			<div class="imgBox">
				<img src="../img/<%out.println(c3);%>" class="dtrio">
			</div>
		</div>
		<div class="wrapper">
			<h1 class="head-title" style="color: black; font-weight: bold;">Explore
				Our Products</h1>
			<div class="cards">
				<div class="card" style="background-color: white; cursor: pointer;">
					<a href="syrups.jsp" style="text-decoration: none;"><img
						class="card__image" src="../img/<%out.println(c4);%>" alt=""></a>
					<div class="card__content">
						<div class="card__header">
							<h4 class="card__title" style="font-weight: bold; margin: auto">Coffee
								Syrups</h4>
						</div>
					</div>
				</div>
				<div class="card" style="background-color: white; cursor: pointer;">
					<a href="beans.jsp" style="text-decoration: none;"><img
						class="card__image style=" src="../img/<%out.println(c5);%>"
						alt=""></a>
					<div class="card__content">
						<div class="card__header">
							<h4 class="card__title" style="font-weight: bold; margin: auto">Coffee
								Beans</h4>
						</div>
					</div>
				</div>
				<div class="card" style="background-color: white; cursor: pointer;">
					<a href="drinks.jsp" style="text-decoration: none;"><img
						class="card__image style=" src="../img/<%out.println(c6);%>"
						alt=""></a>
					<div class="card__content">
						<div class="card__header">
							<h4 class="card__title" style="font-weight: bold; margin: auto">Cold
								Brews</h4>
						</div>
					</div>
				</div>
			</div>
		</div>



		<h1 class="head-title"
			style="color: black; font-weight: bold; margin-top: 2em;">What
			others say for us</h1>


		<div id="testim" class="testim">
			<!--         <div class="testim-cover"> -->
			<div class="wrap">
				<span id="right-arrow" class="arrow right fa fa-chevron-right"></span>
				<span id="left-arrow" class="arrow left fa fa-chevron-left "></span>
				<ul id="testim-dots" class="dots">
					<li class="dot active"></li>
					<!--
                    -->
					<li class="dot"></li>
					<!--
                    -->
					<li class="dot"></li>
					<!--
                    -->
					<li class="dot"></li>
					<!--
                    -->
					<li class="dot"></li>
				</ul>
				<div id="testim-content" class="cont">

					<%
					try {
						Connection con = ConnectionProvider.getCon();
						Statement st = con.createStatement();
						ResultSet rs1 = st.executeQuery("select * from feedbacks ORDER BY rate DESC LIMIT 5");

						while (rs1.next()) {
					%>
					<div class="active">
						<div>

							<h2>
								<%
								out.println(rs1.getString(7));
								%>
							</h2>
							<p>
								<%
								out.println(rs1.getString(9));
								%>
							</p>


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






		</div>

		<div class="wrapper">
			<h1 class="head-title"
				style="color: black; font-weight: bold; margin-top: 2em;">This
				week's selections</h1>
			<div class="cards">
				<%
				String id = request.getParameter("id");

				try {

					Connection con = ConnectionProvider.getCon();
					Statement st = con.createStatement();
					ResultSet rs = st.executeQuery("select *from product ORDER BY sold DESC LIMIT 3");
					while (rs.next()) {
				%>

				<div class="card" style="background-color: white; cursor: pointer;">
					<a
						href="<%out.println(rs.getString(11));%>.jsp?id=<%out.println(rs.getString(1));%>"
						style="text-decoration: none;"><img class="card__image style="
						src="../img/<%out.println(rs.getString(5));%>" alt=""></a>
					<div class="card__content">
						<div class="card__header">
							<h4 class="card__title" style="font-weight: bold">
								<%
								out.println(rs.getString(2));
								%>
							</h4>
							<span class="card__price" style="font-weight: bold">PHP300</span>
						</div>
						<p class="card__text" style="color: black;">
							<%
							out.println(rs.getString(12));
							%>
						</p>
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
		>>>>>>> 6b4f861 lancer
	</section>
	<script src="https://use.fontawesome.com/1744f3f671.js"></script>
	<script>
		//vars
		'use strict'
		var testim = document.getElementById("testim"), testimDots = Array.prototype.slice
				.call(document.getElementById("testim-dots").children), testimContent = Array.prototype.slice
				.call(document.getElementById("testim-content").children), testimLeftArrow = document
				.getElementById("left-arrow"), testimRightArrow = document
				.getElementById("right-arrow"), testimSpeed = 4500, currentSlide = 0, currentActive = 0, testimTimer, touchStartPos, touchEndPos, touchPosDiff, ignoreTouch = 30;
		;
		window.onload = function() {
			// Testim Script
			function playSlide(slide) {
				for (var k = 0; k < testimDots.length; k++) {
					testimContent[k].classList.remove("active");
					testimContent[k].classList.remove("inactive");
					testimDots[k].classList.remove("active");
				}
				if (slide < 0) {
					slide = currentSlide = testimContent.length - 1;
				}
				if (slide > testimContent.length - 1) {
					slide = currentSlide = 0;
				}
				if (currentActive != currentSlide) {
					testimContent[currentActive].classList.add("inactive");
				}
				testimContent[slide].classList.add("active");
				testimDots[slide].classList.add("active");
				currentActive = currentSlide;

				clearTimeout(testimTimer);
				testimTimer = setTimeout(function() {
					playSlide(currentSlide += 1);
				}, testimSpeed)
			}
			testimLeftArrow.addEventListener("click", function() {
				playSlide(currentSlide -= 1);
			})
			testimRightArrow.addEventListener("click", function() {
				playSlide(currentSlide += 1);
			})
			for (var l = 0; l < testimDots.length; l++) {
				testimDots[l].addEventListener("click", function() {
					playSlide(currentSlide = testimDots.indexOf(this));
				})
			}
			playSlide(currentSlide);
			// keyboard shortcuts
			document.addEventListener("keyup", function(e) {
				switch (e.keyCode) {
				case 37:
					testimLeftArrow.click();
					break;

				case 39:
					testimRightArrow.click();
					break;
				case 39:
					testimRightArrow.click();
					break;
				default:
					break;
				}
			})

			testim.addEventListener("touchstart", function(e) {
				touchStartPos = e.changedTouches[0].clientX;
			})

			testim.addEventListener("touchend", function(e) {
				touchEndPos = e.changedTouches[0].clientX;

				touchPosDiff = touchStartPos - touchEndPos;

				console.log(touchPosDiff);
				console.log(touchStartPos);
				console.log(touchEndPos);

				if (touchPosDiff > 0 + ignoreTouch) {
					testimLeftArrow.click();
				} else if (touchPosDiff < 0 - ignoreTouch) {
					testimRightArrow.click();
				} else {
					return;
				}

			})
		}
	</script>
	<%@include file="footer.jsp"%>
</body>
</html>