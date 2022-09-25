package user;

import database.DB_Conn;
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

@WebServlet(name = "addUserDetalsServlet", urlPatterns = {"/addUserDetalsServlet"})
public class addUserDetalsServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Connection c;

		String username, gender, address, mobileNum_s,citta;
		username = request.getParameter("username");
		gender = request.getParameter("gender");
		address = request.getParameter("address");
		mobileNum_s = request.getParameter("mobileNum");
		citta = request.getParameter("citta");

		response.setContentType("text/html;charset=UTF-8");
		user User;
		HttpSession session = request.getSession();
		User = (user) session.getAttribute("user");


		if (User != null) {
			try {
				String addressSess = User.getAddress();
				c = new DB_Conn().getConnection();
				if (addressSess == null) {
					String insertDetails = "INSERT INTO  `databasePW`.`user-details` ("
							+ "`userDetail_Id` ,"
							+ "`user_id` ,"
							+ "`username` ,"
							+ "`address` ,"
							+ "`gender` ,"
							+ "`mobile_no` ,"
							+ "`citta`"
							+ " )"
							+ "VALUES ("
							+ "NULL,?,?,?,?,?,?"
							+ ");";
					PreparedStatement psmt = c.prepareStatement(insertDetails);
					psmt.setInt(1, User.getUserId());
					psmt.setString(2, username);
					psmt.setString(3, address);
					psmt.setString(4, gender);
					psmt.setString(5, mobileNum_s);
					psmt.setString(6, citta);
					psmt.executeUpdate();
					User.setUserEmail(User.getUserEmail());

				} else {

					String insertDetails = " UPDATE  `user-details` "
							+ "SET  " +
							"`username` =  ?," +
							"`address` =  ?," +
							"`gender` =  ?,"
							+ "`mobile_no` = ?,"
							+ "`citta` = ?"
							+ " WHERE  `user-details`.`user_id` =  ?;" ;

					PreparedStatement psmt = c.prepareStatement(insertDetails);
					psmt.setInt(6, User.getUserId());
					psmt.setString(1, username);
					psmt.setString(2, address);
					psmt.setString(3, gender);
					psmt.setString(4, mobileNum_s);
					psmt.setString(5, citta);
					psmt.executeUpdate();
					User.setUserEmail(User.getUserEmail());
				}   
				response.sendRedirect(request.getContextPath()+"/userinfo.jsp");
			} 
			catch (NumberFormatException ex){
				ex.printStackTrace();
			}
			catch (SQLException ex) {
				ex.printStackTrace();
			} catch (ClassNotFoundException ex) {
				ex.printStackTrace();
			}
		} else { 
			response.sendRedirect(request.getContextPath());
		}
	}
}
