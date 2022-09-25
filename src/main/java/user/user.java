package user;

import database.DB_Conn;
import java.sql.*;

public class user {
	public String userEmail = null;
	public int userId = 0;
	public String username;
	public String address;
	public String gender;
	public String mobileNum;
	public String citta;

	Connection c;

	public void setUserEmail (String userEmail) throws SQLException, ClassNotFoundException{
		this.userId = findUserId(userEmail);
		fetchAllValues(getUserId());
		this.userEmail = userEmail;        
	}

	public String getUserEmail (){
		return userEmail;
	}
	public int getUserId (){
		return userId;
	}
	public String getUsername (){
		return username;
	}
	public String getAddress (){
		return address;
	}
	public String getGender (){
		return gender;
	}
	public String getMobileNum (){
		return mobileNum;
	}

	public String getCitta() {
		return citta;
	}

	public int findUserId (String email) throws SQLException, ClassNotFoundException{
		String sqlGetUserId = "SELECT  `user_id` FROM  `user` WHERE  `email` =  ?";
		c= new DB_Conn().getConnection();
		PreparedStatement psmt  = c.prepareStatement(sqlGetUserId);
		psmt.setString(1, email);
		ResultSet executeQuery = psmt.executeQuery();
		executeQuery.next();
		userId = executeQuery.getInt("user_id");
		return userId;
	}

	public void fetchAllValues (int userId) throws SQLException, ClassNotFoundException{

		String fetchSql;

		fetchSql = "SELECT * FROM  `user-details` WHERE  `user_id` =? ;";
		c = new DB_Conn() .getConnection();

		PreparedStatement psmt = c.prepareStatement(fetchSql);
		psmt.setInt(1, userId);

		ResultSet executeQuery = psmt.executeQuery();
		boolean next = executeQuery.next();
		if (next){
			username = executeQuery.getString("username"); 
			address = executeQuery.getString("address");
			gender = executeQuery.getString("gender");
			mobileNum = executeQuery.getString("mobile_no");
			citta = executeQuery.getString("citta");

		}else {
			username = null;
			address = null;
			gender = null;
			mobileNum = null;
			citta = null;

		}
	}
}
