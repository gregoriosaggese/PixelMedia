package product;

import database.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class product {

	private ArrayList<String> category = new ArrayList<String>();
	private ArrayList<String> subcategory = new ArrayList<String>();;
	private ArrayList<String> company = new ArrayList<String>();;
	private Connection con;


	public int getId (String productName) throws SQLException{
		int id;
		String getIdSQL = "SELECT  `product_id` " +
				"FROM  `products` " +
				"WHERE  `product-name` = '"+productName+"'; ";

		Statement st = con.createStatement();
		ResultSet executeQuery = st.executeQuery(getIdSQL);
		executeQuery.next();
		id = executeQuery.getInt("product_id");
		return id;
	}
	public ArrayList<String> getCategory() throws SQLException, ClassNotFoundException {
		DB_Conn c = new DB_Conn();
		con = c.getConnection();
		String getCategorySQL = "SELECT  `category_name` FROM  `category`; ";
		PreparedStatement psmt = con.prepareStatement(getCategorySQL);
		ResultSet executeQuery = psmt.executeQuery();
		while (executeQuery.next()){
			String category1 = executeQuery.getString ("category_name");
			this.category.add(category1);
		}
		return category;
	}

	public ArrayList<String> getSubcategory() throws SQLException, ClassNotFoundException {
		DB_Conn c = new DB_Conn();
		con = c.getConnection();
		String getCategorySQL = "SELECT  `sub-category_name` " +
				"FROM  `sub-category`;";
		PreparedStatement psmt = con.prepareStatement(getCategorySQL);
		ResultSet executeQuery = psmt.executeQuery();
		while (executeQuery.next()){
			String subcategory1 = executeQuery.getString ("sub-category_name");
			this.subcategory.add(subcategory1);
		}
		return subcategory;
	}

	public ArrayList<String> getSubcategory(String category) throws SQLException, ClassNotFoundException {
		DB_Conn c = new DB_Conn();
		con = c.getConnection();
		String getCategorySQL = "SELECT  `sub-category_name` " +
				"FROM  `sub-category` " +
				"WHERE  `category_name` =  ?;";

		PreparedStatement psmt = con.prepareStatement(getCategorySQL);
		psmt.setString(1, category);
		ResultSet executeQuery = psmt.executeQuery();
		while (executeQuery.next()){
			String subcategory1 = executeQuery.getString ("sub-category_name");
			this.subcategory.add(subcategory1);
		}
		return subcategory;
	}

	public ArrayList<String> getCompany(String category) throws SQLException, ClassNotFoundException {

		DB_Conn c = new DB_Conn();
		con = c.getConnection();
		String getCategorySQL = "SELECT  `company-name` " +
				"FROM  `products` " +
				"GROUP BY  `company-name` ;";

		PreparedStatement psmt = con.prepareStatement(getCategorySQL);
		psmt.setString(1, category);
		ResultSet executeQuery = psmt.executeQuery();
		while (executeQuery.next()){
			String company_name = executeQuery.getString ("company-name");
			this.company.add(company_name);
		}
		return company;
	}

	public ArrayList<String> getCompany() throws SQLException, ClassNotFoundException {

		DB_Conn c = new DB_Conn();
		con = c.getConnection();
		String getCategorySQL = "SELECT  `company-name` " +
				"FROM  `products` " +
				"GROUP BY  `company-name` ;";

		PreparedStatement psmt = con.prepareStatement(getCategorySQL);

		ResultSet executeQuery = psmt.executeQuery();
		while (executeQuery.next()){
			String company_name = executeQuery.getString ("company-name");
			this.company.add(company_name);
		}
		return company;
	}

}
