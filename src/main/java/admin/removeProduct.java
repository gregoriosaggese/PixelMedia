package admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.DB_Conn;

@WebServlet("/removeProduct")
public class removeProduct extends HttpServlet {
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String product = request.getParameter("buttonRemove");
		String product2 = product.substring(8, product.length());
		
		try {
			
			String sqlQuery = "DELETE FROM `products` WHERE `product-name` = " + "'"+product2+"'";
						
			Connection c = new DB_Conn().getConnection();
			PreparedStatement st = c.prepareStatement(sqlQuery);
			st.execute();
			c.close();
			response.sendRedirect(request.getContextPath()+"/admin.jsp");
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
