<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="project.Encryption"%>

<%@page import="project.ConnectionProvider"%>
<%String email = session.getAttribute("loggedInUser").toString();
	String orderID = request.getParameter("id");

	%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<link
	href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css"
	rel="stylesheet">
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="../css/invoice.css">
<title>Sales Invoice</title>
</head>
<body>
	<%
	String userID="";
				try {
					Connection con=ConnectionProvider.getCon();
					int total=0;
					String secretKey = "DTRIOCOFFEESYRUP";
					Encryption en = new Encryption();
					en.setKey(secretKey);
					Statement st = con.createStatement();
					ResultSet rs1 = st.executeQuery("select * from users where email='"+en.encrypt(email, secretKey)+"'");
					while (rs1.next()) {

						userID=rs1.getString(1);

						
					}
					
					ResultSet rs = st.executeQuery("select *from orders where userID='" + userID
					+ "'and orderID='" + orderID + "'");
					
					while (rs.next()) { 
						
				%>
	<div class="card">
		<div class="card-body">
			<div class="container mb-5 mt-3">
				<div class="row d-flex align-items-baseline">
					<div class="col-xl-9">
						<img src="../img/Logo.png" class="logo">
						<p font-size: 20 px;">
							 <strong>Order ID: <%=rs.getString(1)%></strong>
						</p>
					</div>
					<div class="col-xl-3 float-end">
						<a class="btn btn-light text-capitalize border-0"
							data-mdb-ripple-color="dark" onclick="window.print();"><i
							class="fas fa-print text-primary"></i> Print/Download</a> <a
							class="btn btn-light text-capitalize border-0" href="index.jsp"
							 data-mdb-ripple-color="dark"><i
							class="fas fa-print text-primary"></i> Go Home</a>
					</div>
					<hr>
				</div>

				<div class="container">
					<div class="col-md-12">
						<div class="text-center">
							<i class="fab fa-mdb fa-4x ms-0" style="color: #5d9fc5;"></i>

						</div>

					</div>


					<div class="row">
						<div class="col-xl-8">
							<ul class="list-unstyled">
								<li class="text-muted">To: <span><%=rs.getString(14)%></span></li>
								<li class="text-muted"><%=rs.getString(7)%></li>
								<li class="text-muted"><i class="fas fa-phone"></i><%=rs.getString(8)%></li>
							</ul>
						</div>
						<div class="col-xl-4">
							<p class="text-muted">Sales Invoice</p>
							<ul class="list-unstyled">
								<li class="text-muted"><i class="fas fa-circle"
									style="color: #84B0CA;"></i> <span class="fw-bold">User
										ID:</span> <%out.println(userID); %></li>
								<li class="text-muted"><i class="fas fa-circle"
									style="color: #84B0CA;"></i> <span class="fw-bold">Order
										Date: </span> <%=rs.getString(9)%></li>
								<li class="text-muted"><i class="fas fa-circle"
									style="color: #84B0CA;"></i> <span class="me-1 fw-bold">Status:
								</span><span class="badge bg-warning text-black fw-bold"> To Pay</span></li>
							</ul>
						</div>
					</div>

					<div class="row my-2 mx-1 justify-content-center">
						<table class="table table-striped table-borderless">
							<thead style="background-color: #874823;" class="text-white">
								<tr>

									<th scope="col">Product Name</th>
									<th scope="col">Qty</th>
									<th scope="col">Unit Price</th>
									<th scope="col">Amount</th>
								</tr>
							</thead>
							<tbody>

								<tr>

									<td>
										<%
								
									Statement st2 = con.createStatement();
											String pname = rs.getString(3);
											pname = pname.substring(1, pname.length() - 1);
											String[] substrings1 = pname.split(",");
											int[] arr1 = new int[substrings1.length];
											for (int i = 0; i < substrings1.length; i++) {
												arr1[i] = Integer.parseInt(substrings1[i].trim());
											}
											for (int i = 0; i < arr1.length; i++){
												ResultSet rs2 = st2.executeQuery("select *from product where productID='" + arr1[i]
														+ "'");
												while (rs2.next()) {
													out.print(rs2.getString(2));
													%> <br> <% 
												}
											}
											
											
											%>
									</td>
									<td>
										<%
											String quant = rs.getString(4);
											quant = quant.substring(1, quant.length() - 1);
											String[] substrings = quant.split(",");
											int[] arr = new int[substrings.length];
											for (int i = 0; i < substrings.length; i++) {
											    arr[i] = Integer.parseInt(substrings[i].trim());
											}
											for(int x=0;x<arr.length;x++){
												out.print(arr[x]);%> <br /> <% }%>







									</td>
									<td>
										<%
											String price = rs.getString(5);
									price = price.substring(1, price.length() - 1);
											String[] substrings2 = price.split(",");
											int[] arr2 = new int[substrings2.length];
											for (int i = 0; i < substrings2.length; i++) {
											    arr2[i] = Integer.parseInt(substrings2[i].trim());
											}
											for(int x=0;x<arr2.length;x++){
												out.print(arr2[x]);%> <br /> <% }%>

									</td>
									<td>
										<%
											String subtotal = rs.getString(6);
									subtotal = subtotal.substring(1, subtotal.length() - 1);
											String[] substrings3 = subtotal.split(",");
											int[] arr3 = new int[substrings3.length];
											for (int i = 0; i < substrings3.length; i++) {
											    arr3[i] = Integer.parseInt(substrings3[i].trim());
											}
											for(int x=0;x<arr3.length;x++){
												out.print(arr3[x]);
													total+=arr3[x];%> <br /> <% }%>



									</td>
									</td>
								</tr>

							</tbody>

						</table>

					</div>
					<div class="row">
						<div class="col-xl-8"></div>
						<div class="col-xl-3">

							<p class="text-black float-start">
								<span class="text-black me-3"> Total Amount: </span><span
									style="font-size: 25px;"> <%out.print(total); %>
								</span>
							</p>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-xl-12">
							<%if(rs.getString(10).equals("GCASH")){%>
							<h2>GCASH Payment Instruction</h2>
							<p>1. On your GCASH homepage, tap send</p>
							<p>2. Tap express send</p>
							<p>
								3. Input the GCASH resgistered mobile number <strong>(09178982217)</strong>
								and amount <strong>(P <%out.print(total); %>)
								</strong> and tap next
							</p>
							<p>4. Review all the details and click send</p>
						</div>
						<%} %>

					</div>
					<div class="row">
						<div class="col-xl-12">
							<%if(rs.getString(10).equals("BPI Bank Transfer")){%>
							<h2>BPI Bank Transfer Payment Instruction</h2>
							<p>1. Login to BPI Online or the BPI Mobile app</p>
							<p>2. Select "Transfer Money" from the menu.</p>
							<p>3. Select your source account.</p>
							<p>
								4. Fill in details of the amount <strong>(P<%out.print(total); %>)
								</strong> and select "Transfer to 3rd party".
							</p>
							<p>
								5. Input details of the destination account by manually
								keying-in the account number <strong>93204312</strong>
							</p>
							<p>6. Confirm details.</p>
							<p>7. For unenrolled accounts, you will be asked to
								authenticate your transaction via Mobile Key.</p>
							<p>8. You're done!</p>
						</div>
						<%} %>

					</div>
					<div class="row">
						<div class="col-xl-12">
							<%if(rs.getString(10).equals("Paypal")){%>
							<h2>Paypal Payment Instruction</h2>
							<p>
								1. Enter the recipients email address <strong>naokillose@gmail.com</strong>
							</p>
							<p>
								2. Enter the amount to pay or send <strong>P<%out.print(total); %></strong>
							</p>
							<p>3. Choose your preferred way to pay and send it securely.</p>
						</div>
						<%} %>

					</div>

					<%	}
				
				}
				
				catch (Exception e) {
				System.out.println(e);
				}
				%>



				</div>
			</div>
		</div>
	</div>

</body>


</html>