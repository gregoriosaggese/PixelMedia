package admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import database.DB_Conn;

public class Admin {

	public String email;
	public String pass;

	public void setAdmin() throws ClassNotFoundException, SQLException{

		String sqlQuery = "SELECT * FROM `administrator`";
		Connection c = new DB_Conn().getConnection();

		PreparedStatement psmt = c.prepareStatement(sqlQuery);

		ResultSet rs = psmt.executeQuery();
		
		while(rs.next()){
			email = rs.getString("email");
			pass = rs.getString("password");
		}
	}

	public String getEmail() {
		return email;
	}

	public String getPass() {
		return pass;
	}
	
	
}
