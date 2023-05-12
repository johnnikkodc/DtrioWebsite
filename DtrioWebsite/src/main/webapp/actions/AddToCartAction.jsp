<%@page import="project.ConnectionProvider"%>"
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.http.*"%>
<%
HttpSession ses = request.getSession(false);
String email="";
if (ses == null || ses.getAttribute("loggedInUser") == null) {
	response.sendRedirect("../store/login.jsp?msg=needlogin");
} else {
	email= session.getAttribute("loggedInUser").toString();
}


String product_id = request.getParameter("id");
int qty = Integer.parseInt(request.getParameter("qty"));
int product_price = 0;
int product_total = 0;
int cart_total = 0;
String product_name="";
int z = 0;
int qty2=0;
int quantity=0;
try {
	Connection con = ConnectionProvider.getCon();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select *from product where productID='" + product_id + "'");
	while (rs.next()) {
		
		product_price = rs.getInt(3);
		product_total = product_price*qty;
		product_name=rs.getString(2);
		qty2=rs.getInt(6);
	}
	if(qty>qty2){
		response.sendRedirect("../store/cart.jsp?msg=qtyexceed");
		
	}else{
	ResultSet rs1 = st.executeQuery(
	"select *from cart where productID='" + product_id + "' and email='" + email + "'");
	while (rs1.next()) {
		cart_total = rs1.getInt(7);
		cart_total = cart_total + product_total;
		quantity = rs1.getInt(5);
		quantity = quantity + qty;
		z = 1;
	}
	if (z == 1) {
		if(quantity>qty2){
			response.sendRedirect("../store/cart.jsp?msg=qtyexceed");
			
		}else{
		st.executeUpdate("update cart set total='" + cart_total + "', quantity='" + quantity + "' where productID="
		+ product_id + " and email='" + email + "'");
		response.sendRedirect("../store/cart.jsp?msg=exist");
		}
	}
	if (z == 0) {
		PreparedStatement ps = con
		.prepareStatement("insert into cart(email,productID,product_name,quantity,price,total) values(?,?,?,?,?,?)");
		ps.setString(1, email);
		ps.setString(2, product_id);
		ps.setString(3, product_name);
		ps.setInt(4, qty);
		ps.setInt(5, product_price);
		ps.setInt(6, product_total);
		ps.executeUpdate();
		response.sendRedirect("../store/cart.jsp?msg=added");
	}
	}
} catch (Exception e) {
	System.out.println(e);
	//response.sendRedirect("../store/cart.jsp?msg=invalid");
}
%>
