package project;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;



@WebServlet(name="uploadImage",urlPatterns= {"/uploadImage"})
@MultipartConfig(maxFileSize=16177216)
public class uploadImage extends HttpServlet {
	PrintWriter out;
	Connection con=ConnectionProvider.getCon();
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		out=response.getWriter();
		int result=0;
		Part part=request.getPart("image");
		if(part!=null) {
			try {
				PreparedStatement ps = con.prepareStatement("insert into product (productPhoto) values(?)");
				InputStream is=part.getInputStream();
				ps.setBlob(1, is);
				result=ps.executeUpdate();
				if(result>0) {
					response.sendRedirect("adminIndex.jsp");
				}else {
					response.sendRedirect("adminIndex.jsp?error=yes");
				}
				
			}catch(Exception e) {
				out.println(e);
			}
		}
	}

}
