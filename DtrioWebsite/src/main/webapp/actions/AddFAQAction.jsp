<%@page import="java.sql.*"%>
<%@page import="project.ConnectionProvider"%>
<%

try {
	Connection con=ConnectionProvider.getCon();


	String question, answer;
	question=request.getParameter("question");
	answer=request.getParameter("answer");


	try

	{
		PreparedStatement ps = con.prepareStatement("insert into faq values(?,?,?)");
		ps.setInt(1, 0);
		ps.setString(2, question);
		ps.setString(3, answer);
	
		ps.executeUpdate();
		response.sendRedirect("../admin/addfaq.jsp?msg=done");
	} catch (Exception e) {
		response.sendRedirect("../admin/addfaq.jsp?msg=wrong");
		System.out.println(e);
	}

} catch (Exception e) {
	System.out.println(e);

}

%>