<button id="snack" onclick="myFunction()" hidden>Show Snackbar</button>
<script src="../js/snackbar.js"></script>
<div id="snackbar"></div>
<%
String msg = request.getParameter("msg");
if ("registert".equals(msg)) {
%>
<script>
	document.getElementById("snack").click();
	document.getElementById("snackbar").innerText = "Account Successfully Registered!";
</script>


<%
}
if ("registerf".equals(msg)) {
%>
<script>
	document.getElementById("snack").click();
	document.getElementById("snackbar").style.backgroundColor = "#AA0000";
	document.getElementById("snackbar").innerText = "Email is already registered, Please try again!";
</script>
<%
}
%>
<%
if ("loginnotexist".equals(msg)) {
%>
<script>
	document.getElementById("snack").click();
	document.getElementById("snackbar").style.backgroundColor = "#AA0000";
	document.getElementById("snackbar").innerText = "Incorrect Email or Password";
</script>
<%
}
%>
<%
if ("added".equals(msg)) {
%>
<script>
	document.getElementById("snack").click();
	document.getElementById("snackbar").innerText = "Product Added Successfully!";
</script>
<%
}
%>
<%
if ("inc".equals(msg)) {
%>
<script>
	document.getElementById("snack").click();
	document.getElementById("snackbar").innerText = "Quantity Increased!";
</script>
<%
}
%>
<%
if ("dec".equals(msg)) {
%>
<script>
	document.getElementById("snack").click();
	document.getElementById("snackbar").style.backgroundColor = "#AA0000";
	document.getElementById("snackbar").innerText = "Quantity Decreased!";
</script>
<%
}
%>
<%
if ("qtyexceed".equals(msg)) {
%>
<script>
	document.getElementById("snack").click();
	document.getElementById("snackbar").style.backgroundColor = "#AA0000";
	document.getElementById("snackbar").innerText = "Stocks are insufficient!";
</script>
<%
}
%>
<%
if ("productdeleted".equals(msg)) {
%>
<script>
	document.getElementById("snack").click();
	document.getElementById("snackbar").style.backgroundColor = "#AA0000";
	document.getElementById("snackbar").innerText = "Product Removed Successfully!";
</script>
<%
}
%>
<%
if ("error".equals(msg)) {
%>
<script>
	document.getElementById("snack").click();
	document.getElementById("snackbar").style.backgroundColor = "#AA0000";
	document.getElementById("snackbar").innerText = "Quantity Increased!";
</script>
<%
}
%>
<%
if ("needlogin".equals(msg)) {
%>
<script>
	document.getElementById("snack").click();
	document.getElementById("snackbar").style.backgroundColor = "#AA0000";
	document.getElementById("snackbar").innerText = "Please login to continue";
</script>
<%
}
%>
<%
if ("loginfailed".equals(msg)) {
%>
<script>
	document.getElementById("snack").click();
	document.getElementById("snackbar").style.backgroundColor = "#AA0000";
	document.getElementById("snackbar").innerText = "Something went wrong, Please try again!";
</script>
<%
}
%>



<%
if ("resellersuccess".equals(msg)) {
%>
<script>
	document.getElementById("snack").click();
	document.getElementById("snackbar").innerText = "Submitted Successfully!";
</script>

<%
}
%>

<%
if ("resellerfailed".equals(msg)) {
%>
<script>
	document.getElementById("snack").click();
	document.getElementById("snackbar").style.backgroundColor = "#AA0000";
	document.getElementById("snackbar").innerText = "Something went wrong, Please try again!";
</script>

<%
}
%>
