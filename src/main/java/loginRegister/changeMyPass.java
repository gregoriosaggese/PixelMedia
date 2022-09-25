package loginRegister;

import database.DB_Conn;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import user.user;

@WebServlet(name = "changeMyPass", urlPatterns = {"/changeMyPass"})
public class changeMyPass extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {try {        

				String email = request.getParameter("email");
				String pass = request.getParameter("pass");
				if (email == null){
					HttpSession session = request.getSession();
					user User = (user)session.getAttribute ("user");
					email = User.getUserEmail();
				}

				String changePassword = 
						"UPDATE  "
								+ "`databasePW`.`user` "
								+ " SET  `pass` =  '"+pass+"'  "
								+ "WHERE  `user`.`email` ='"+email+"';";

				DB_Conn con = new DB_Conn();
				Connection c  = con.getConnection();
				Statement psmt = c.createStatement();

				psmt.executeUpdate(changePassword);
				response.sendRedirect(request.getContextPath()+"/userinfo.jsp");

			} catch (SQLException ex) {
				ex.printStackTrace();
			} catch (ClassNotFoundException ex) {
				ex.printStackTrace();
			}

	}
}
