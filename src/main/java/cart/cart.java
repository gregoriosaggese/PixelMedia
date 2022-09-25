package cart;

import java.sql.*;
import java.util.*;
import database.DB_Conn;

public class cart {

	public ArrayList<Integer> id = new ArrayList<Integer>();
	public ArrayList<String> productCategory = new ArrayList<String>();
	public ArrayList<String> productName = new ArrayList<String>();
	public ArrayList<Double> prices = new ArrayList<Double>();
	public ArrayList<Integer> qty = new ArrayList<Integer>();

	Connection c;

	public void listItemsOfCart() throws SQLException, ClassNotFoundException {

		c = new DB_Conn().getConnection();
		Statement st = c.createStatement();
		
		for (int i = 0; i < id.size(); i++) {
			Integer getItemId = id.get(i);
			String getItemName = "SELECT  `product-name` ,  `category-name` ,  `price`, `isDiscount`, `discount`   FROM  `products` WHERE  `product_id` =" + getItemId + "";

			ResultSet rs = st.executeQuery(getItemName);
			rs.next();
			String p_name = rs.getString("product-name");
			Double p_price = rs.getDouble("price");
			String p_Category = rs.getString("category-name");
			Double p_isDiscount = rs.getDouble("isDiscount");
			Double p_discount = rs.getDouble("discount");
			
			productName.add(p_name);
			productCategory.add(p_Category);
			
			if(p_isDiscount == 1){
				p_price = p_price - p_discount/100 * p_price;
				prices.add(p_price);
			}else {
				prices.add(p_price);
			}
					
		}
	}

	public String getProductName(int id) throws SQLException, ClassNotFoundException {

		c = new DB_Conn().getConnection();
		String getProductName = "SELECT  `product-name` FROM  `products` WHERE  `product_id` =" + id + "";
		Statement st = c.createStatement();

		ResultSet rs = st.executeQuery(getProductName);
		rs.next();
		String name = rs.getString("product-name");
		return name;
	}

	public String getProductCategory(int id) throws SQLException, ClassNotFoundException {

		c = new DB_Conn().getConnection();
		String getCategoryName = "SELECT   `category-name`  FROM  `products` WHERE  `product_id` =" + id + "";
		Statement st = c.createStatement();

		ResultSet rs = st.executeQuery(getCategoryName);
		rs.next();
		String name = rs.getString("category-name");
		return name;
	}

	public double getProductPrice(int id) throws SQLException, ClassNotFoundException {
		c = new DB_Conn().getConnection();
		String getProductName = "SELECT  * FROM  `products` WHERE  `product_id` =" + id + "";
		Statement st = c.createStatement();
		ResultSet rs = st.executeQuery(getProductName);
		
		double price = 0;
		double isDiscount = 0,discount = 0;
		
		while(rs.next()){
			 price = rs.getDouble("price");
			 isDiscount = rs.getInt("isDiscount");
			 discount = rs.getInt("discount");
		}
		
		if(isDiscount == 1){
			price = price - discount/100 * price;
		}
		
		
		return price;
	}

	public double getTotalPriceOfCart() throws SQLException, ClassNotFoundException {

		ArrayList<Double> t_prices = new ArrayList<Double>(); 

		c = new DB_Conn().getConnection();
		Statement st = c.createStatement();
		
		for (int i = 0; i < id.size(); i++) {
			String sqlGetPrice = "SELECT  * FROM  `products` WHERE  `product_id` =" + id.get(i).toString() + ";";
			ResultSet rs = st.executeQuery(sqlGetPrice);
			
			double f = 0;
			double isDiscount = 0,discount = 0;
			
			while(rs.next()){
				f = rs.getFloat("price");
				isDiscount = rs.getInt("isDiscount");
				discount = rs.getInt("discount");
				
			}
			if(isDiscount == 1){
				f = f - discount/100 * f;
			}
			
			f *= qty.get(i);
			t_prices.add(f);
		}

		double sum = 0;
		for (int i = 0; i < t_prices.size(); i++) {
			double p = t_prices.get(i);
			sum += p;
		}
		
		return sum;
	}

	public boolean addProduct(int id) throws SQLException, ClassNotFoundException {

		boolean added, matches;

		c = new DB_Conn().getConnection();
		Statement st = c.createStatement();

		String sqlGetValidIds = "SELECT  `product_id` FROM  `products`;";
		ResultSet rs = st.executeQuery(sqlGetValidIds);

		while (rs.next()) {
			int id_db = rs.getInt("product_id");
			if (id_db == id) {
				matches = true;
				break;
			}
		}

		if (matches = true) {
			if (this.id.contains(id)) {
				int index = this.id.indexOf(id);
				this.qty.set(index, this.qty.get(index) + 1);
			} else {
				this.qty.add(1);
				this.id.add(id);
			}
			added = true;
		} else {
			added = false;
		}
		return added;
	}
	
	
	public boolean removeProduct(int productId) {

		boolean removed;

		if (this.id.contains(productId)) {

			int index = this.id.indexOf(productId);
			this.productCategory.remove(index);
			this.productName.remove(index);
			this.prices.remove(index);
			this.qty.remove(index);
			this.id.remove(index);
			removed = true;
		}else {
			removed = false;
		}

		return removed;
	}

	
	public ArrayList<String> getProductCategorys() {
		return productCategory;
	}

	
	public ArrayList<String> getProductNames() throws SQLException, ClassNotFoundException {
		return productName;
	}

	public ArrayList<Double> getPrices() throws SQLException, ClassNotFoundException {
		listItemsOfCart();
		return prices;
	}

	public ArrayList<Integer> getQty() {
		return qty;
	}

	public ArrayList<Integer> getId() {
		return id;
	}
}
