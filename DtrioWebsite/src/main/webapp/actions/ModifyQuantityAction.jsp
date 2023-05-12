<%@page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@page import="project.ConnectionProvider"%>
<%
String email = session.getAttribute("loggedInUser").toString();
String id = request.getParameter("id");
String incdec = request.getParameter("quantity");
int price = 0;
int quantity = 0;
int total = 0;
int final_total = 0;
int product_ID=0;
try {
	Connection con = ConnectionProvider.getCon();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from cart where email='" + email + "' and transactionID='" + id + "'");
	while (rs.next()) {
		price = rs.getInt(6);
		total = rs.getInt(7);
		quantity = rs.getInt(5);
		product_ID= rs.getInt(3);
	}
	if (quantity == 1 && incdec.equals("dec"))
		response.sendRedirect("../store/cart.jsp?msg=remove");
	else if (quantity != 1 && incdec.equals("dec")) {
		total = total - price;
		quantity = quantity - 1;
		st.executeUpdate("update cart set total='" + total + "',quantity='" + quantity + "' where email='" + email
		+ "' and transactionID='" + id + "'");
		response.sendRedirect("../store/cart.jsp?msg=dec");
	} else {
		int qty2=0;
		Statement st2 = con.createStatement();
		ResultSet rs2 = st.executeQuery("select *from product where productID='" + product_ID + "'");
		while (rs2.next()) {
			
			qty2=rs2.getInt(6);
		}
		if(quantity<qty2){
			total = total + price;
			quantity = quantity + 1;
			st.executeUpdate("update cart set total='" + total + "',quantity='" + quantity + "' where email='" + email
			+ "' and transactionID='" + id + "'");
			response.sendRedirect("../store/cart.jsp?msg=inc");
		}else{
			response.sendRedirect("../store/cart.jsp?msg=qtyexceed");
		}
		
	}
} catch (Exception e) {
	System.out.println(e);

}
%>