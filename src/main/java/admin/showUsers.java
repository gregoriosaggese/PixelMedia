package admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.mysql.fabric.Server;

import database.DB_Conn;

@WebServlet("/showUsers")
public class showUsers extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		String email = request.getParameter("buttonShow");
		String email2 = email.substring(7, email.length());

		try {

			String sqlQuery = "SELECT * FROM `user` WHERE `email` = " + "'"+email2+"'";
			
			Connection c = new DB_Conn().getConnection();
			
			Statement st = c.createStatement();
			ResultSet rs = st.executeQuery(sqlQuery);
			
			rs.next();
			
			String userId = rs.getString("user_id");
			
			
			HttpSession session = request.getSession();
			
			session.setAttribute("userID", userId);
			
			c.close();
			response.sendRedirect(request.getContextPath()+"/showUserAdmin.jsp");

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}
