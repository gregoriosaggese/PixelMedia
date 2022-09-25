package database;

import java.sql.*;

public class DB_Conn {

	private Connection con;

	public Connection getConnection() throws SQLException, ClassNotFoundException  {
		
		String DRIVER = "com.mysql.jdbc.Driver";

		String url = "jdbc:mysql://localhost:3306/databasePW";

		Class.forName(DRIVER);

		String user = "root";

		con = DriverManager.getConnection(url,user,null);

		return con;
	}

}
