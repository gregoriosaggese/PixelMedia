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
import javax.servlet.http.HttpSession;

import database.DB_Conn;


@WebServlet("/removeUser")
public class removeUser extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		HttpSession session = request.getSession();
		
		try {
			String sqlQuery = "DELETE FROM `user` WHERE `user_id` = " + "'"+session.getAttribute("userID")+"'";
			String sqlQuery2 = "DELETE FROM `user-details` WHERE `user_id` = " + "'"+session.getAttribute("userID")+"'";
			
			Connection c = new DB_Conn().getConnection();
			PreparedStatement st = c.prepareStatement(sqlQuery);
			st.execute();
			st = c.prepareStatement(sqlQuery2);
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
