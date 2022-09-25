package loginRegister;

import database.DB_Conn;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

import admin.Admin;
import user.user;

@WebServlet(name = "loginServlet", urlPatterns = {"/loginServlet"})
public class loginServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}


	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email, pass;

		String db_email, db_pass;

		boolean isLoggedIn = false;

		HttpSession userSession = request.getSession();

		email = request.getParameter("email");

		pass = request.getParameter("pass");

		if(email.equals("admin@admin.admin") && pass.equals("admin")){

			HttpSession adminSession = request.getSession();
			
			Admin admin = new Admin();
			try {
				admin.setAdmin();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			adminSession.setAttribute("admin", admin);
			response.sendRedirect(request.getContextPath()+"/admin.jsp");
		}
		
		
		else{

			String message, messageDetail;

			message = "Email non Esistente";
			messageDetail = "Effettua la registrazione";

			String messageUrl = "/message.jsp";
			RequestDispatcher dispatchMessage =
					request.getServletContext().getRequestDispatcher(messageUrl);

			try {

				DB_Conn con = new DB_Conn();
				Connection c = con.getConnection();
				String sqlGetUsers = "SELECT  `email` ,  "
						+ "`pass` FROM  `user`; ";

				PreparedStatement st = c.prepareStatement(sqlGetUsers);
				ResultSet rs = st.executeQuery();

				while (rs.next()) {
					db_email = rs.getString("email");
					db_pass = rs.getString("pass");

					if (email.equals(db_email)) {

						if (pass.equals(db_pass)) {
							isLoggedIn = true;
							user User = new user();
							User.setUserEmail(email);
							userSession.setAttribute("user", User);
							response.sendRedirect(request.getContextPath()+"/index.jsp");
						}
						else {
							isLoggedIn = false;
							message = "Password Sbagliata";
							messageDetail = "Rieffettua l'accesso";
							break;
						}
					}
					else {
						message = "Email non esistente";
						messageDetail = "Effettua la registrazione";
						isLoggedIn = false;
					}
				}
				if (isLoggedIn == false){
					request.setAttribute("message", message);
					request.setAttribute("messageDetail", messageDetail);
					dispatchMessage.forward(request, response);
				}
			} catch (SQLException e) {
				e.printStackTrace();        
			} catch (Exception e) {
				e.printStackTrace();        
			}
		}
	}
}
