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

@WebServlet("/removeDiscount")
public class removeDiscount extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		String id = request.getParameter("inserisci-ID");

		String id2;

		id2 = id.substring(0, 2);
		
		char car = id2.charAt(1);
		
		if(car == ' '){
			id2 = id.substring(0, 1);
		}

		int id3 = Integer.parseInt(id2);

		try {

			String sql = "UPDATE `products` SET  `isDiscount` = "+0 +"," + "`discount` = " + 0 +
					" WHERE `product_id` = " + id3;

			Connection c = new DB_Conn().getConnection();
			PreparedStatement st = c.prepareStatement(sql);
			st.executeUpdate();
			response.sendRedirect(request.getContextPath()+"/admin.jsp");


		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}







	}

}
