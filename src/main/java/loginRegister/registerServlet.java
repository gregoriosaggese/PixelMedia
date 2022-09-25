package loginRegister;

import database.DB_Conn;
import user.user;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;
import javax.servlet.RequestDispatcher;


@WebServlet("/register")
public class registerServlet extends HttpServlet {


	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String message;
		message = null;
		String email, pass;

		String messageUrl = "/message.jsp";
		RequestDispatcher dispatchMessage =
				request.getServletContext().getRequestDispatcher(messageUrl);

		email = request.getParameter("emailReg");
		pass = request.getParameter("passReg");

		HttpSession userSession = request.getSession();

		try {
			DB_Conn con = new DB_Conn();
			Connection c = con.getConnection();
			if ((request.getParameter("emailReg") != null) || (request.getParameter("emailReg") != null)){

				String sql = "INSERT INTO  `databasePW`.`user` "
						+ "(`user_id` ,`email` ,`pass` ,`registeredOn`) "
						+ "VALUES (NULL ,  ? ,  ?  , NOW( )); ";


				PreparedStatement psmt = c.prepareStatement(sql);

				psmt.setString(1, email);

				psmt.setString(2, pass);

				int i = psmt.executeUpdate();

				if (i == 1) {
					user User = new user();
					User.setUserEmail(email);
					userSession.setAttribute("user", User);
					response.sendRedirect(request.getContextPath());
				}

			}
		} catch (SQLIntegrityConstraintViolationException ex) {
			String messageDetail = "Effettua di nuovo la registrazione";
			message = "Account Utente Esistente";
			request.setAttribute("message", message);
			request.setAttribute("messageDetail", messageDetail);
			dispatchMessage.forward(request, response);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}
