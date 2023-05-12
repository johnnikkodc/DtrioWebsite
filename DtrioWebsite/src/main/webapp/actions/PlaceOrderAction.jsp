<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="project.ConnectionProvider"%>
<%@page import="project.Encryption"%>
<%@page import="java.time.LocalDate" %>
<%@page import="java.time.format.DateTimeFormatter" %>

<%
String email = session.getAttribute("loggedInUser").toString();
String name = request.getParameter("name");
String payment = request.getParameter("payment");
String street = request.getParameter("street");
String city = request.getParameter("city");
String province = request.getParameter("province");
String zip = request.getParameter("zip");
String mobile = request.getParameter("mobile");
String userID="";
int product_ID=0;

StringBuilder address = new StringBuilder();
List<Integer> productID = new ArrayList<>();
List<Integer> quantity = new ArrayList<>();
List<Integer> price = new ArrayList<>();
List<Integer> total = new ArrayList<>();

LocalDate currentDate = LocalDate.now();
DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
String formattedDate = currentDate.format(formatter);

address.append(street).append(" ").append(city).append(" ").append(province).append(" ").append(zip);


try {
	String secretKey = "DTRIOCOFFEESYRUP";
	Encryption en = new Encryption();
	en.setKey(secretKey);
	Connection con=ConnectionProvider.getCon();
	Statement st = con.createStatement();
	Statement st2 = con.createStatement();
	Statement st3 = con.createStatement();
	Statement st4 = con.createStatement();
	Statement st5 = con.createStatement();
	ResultSet rs = st.executeQuery("select * from users where email='"+en.encrypt(email, secretKey)+"'");
	ResultSet rs2 = st2.executeQuery("select * from cart where email='"+email+"'");
	
	try

	{
		
		while (rs.next()) {

			userID=rs.getString(1);

			
		}
		

		while (rs2.next()) {
			
			ResultSet rs4 = st.executeQuery("select * from product where productID='" + Integer.parseInt(rs2.getString(3)) + "'");
			while (rs4.next()) {
				int qty=0;
				int sold=0;
				qty=rs4.getInt(6)-Integer.parseInt(rs2.getString(5));	
				sold=rs4.getInt(8)+Integer.parseInt(rs2.getString(5));	
				st5.executeUpdate("update product set quantity='" + qty + "', sold='"+sold +"' where productID='" + Integer.parseInt(rs2.getString(3))
						+ "'");

				
			}
			
			productID.add(Integer.parseInt(rs2.getString(3)));
			quantity.add(Integer.parseInt(rs2.getString(5)));
			price.add(Integer.parseInt(rs2.getString(6)));
			total.add(Integer.parseInt(rs2.getString(7)));
			

			
		}
		PreparedStatement ps = con.prepareStatement("insert into orders values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
		ps.setInt(1, 0);
		ps.setString(2, userID);
		ps.setString(3, productID.toString());
		ps.setString(4, quantity.toString());
		ps.setString(5, price.toString());
		ps.setString(6, total.toString());
		ps.setString(7, address.toString());
		ps.setString(8, mobile);
		ps.setString(9, formattedDate);
		ps.setString(10, payment);
		ps.setString(11, "To Pay");
		ps.setString(12, "");
		ps.setString(13, "");
		ps.setString(14, name);
		ps.executeUpdate();
		ResultSet rs3 = st3.executeQuery("select * from orders where userID='"+userID+"'and orderDate='" + formattedDate + "'");
		String orderID="";
		while (rs3.next()) {

			orderID=rs3.getString(1);

			
		}
		PreparedStatement ps2 = con.prepareStatement("delete from cart where email=?");
		ps2.setString(1,email);
		ps2.executeUpdate();
		response.sendRedirect("../store/invoice.jsp?id="+orderID);
	} catch (Exception e) {
		response.sendRedirect("../store/checkout.jsp?msg=wrong");
		System.out.println(e);
	}

} catch (Exception e) {
	System.out.println(e);

}

%>