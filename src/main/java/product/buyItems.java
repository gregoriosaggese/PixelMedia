package product;

import cart.cart;
import database.DB_Conn;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import user.user;


@WebServlet(name = "buyItems", urlPatterns = {"/buyItems"})
public class buyItems extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);       
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String name, address, mobile;
		int order_id;
		Connection c = null;
		HttpSession session = request.getSession();
		user User;
		User = (user) session.getAttribute("user");
		cart Cart;
		Cart = (cart) session.getAttribute("cart");

		name = request.getParameter("name");
		address = request.getParameter("address");
		mobile = request.getParameter("mobile");

		if (!(session.getAttribute("user") == null)
				&& !(session.getAttribute("cart") == null)) {

			try {
				response.setContentType("text/html;charset=UTF-8");

				c = new DB_Conn().getConnection();

				c.setAutoCommit(false);
				String insertOrder;
				insertOrder = "    INSERT INTO  `databasePW`.`order` ("
						+ "    `order_id` ,"
						+ "    `user_id` ,"
						+ "    `status` ,"
						+ "    `shippers_name` ,"
						+ "    `address` ,"
						+ "    `mobile_number` ,"
						+ "    `shippers_email` ,"
						+ "    `ordered_On` ,"
						+ "    `total_order_price`"
						+ "    )"
						+ "    VALUES ("
						+ "    NULL ,  ?,  'Spedito',  ?,  ?,  ?, ?, NOW( ) ,  ?"
						+ "    );";

				PreparedStatement preparedSQL1 =
						c.prepareStatement(insertOrder);

				preparedSQL1.setInt(1, User.getUserId()); // user iD

				preparedSQL1.setString(2, name); //`shippers_name` 

				preparedSQL1.setString(3, address); //`address` 

				preparedSQL1.setString(4, mobile); //`mobile` 

				preparedSQL1.setString(5, User.getUserEmail()); //`shippers_email` 

				preparedSQL1.setDouble(6, Cart.getTotalPriceOfCart()); //`total_order_price`` 

				int executeUpdatePreparedSQL1 = preparedSQL1.executeUpdate();

				if (executeUpdatePreparedSQL1 == 1) {
					//get the latest order id of the recent update

					String getLatestOrderId = "SELECT  `order_id` "
							+ "FROM  `order` "
							+ "WHERE  `user_id` = " + User.getUserId() + " "
							+ "ORDER BY  `ordered_On` DESC; "
							+ "";

					preparedSQL1.close();

					Statement st = c.createStatement();
					ResultSet executeQueryGetOrderId = st.executeQuery(getLatestOrderId);
					executeQueryGetOrderId.next();

					//Here we get the latest order id for the current user
					order_id = executeQueryGetOrderId.getInt("order_id");

					executeQueryGetOrderId.close();

					ArrayList<String> productNames = Cart.getProductNames();
					ArrayList<Double> prices = Cart.getPrices();
					ArrayList<Integer> qty = Cart.getQty();
					ArrayList<Integer> id = Cart.getId();

					String insertIntoSalesSQL3 = ""
							+ "INSERT INTO  `databasePW`.`sales` ("
							+ "`sales_id` ,"
							+ "`order_id` ,"
							+ "`product_id` ,"
							+ "`product_name` ,"
							+ "`product_price` ,"
							+ "`product_quantity` ,"
							+ "`sold_on` ,"
							+ "`user_id`"
							+ ")"
							+ "VALUES ("
							+ "    NULL ,  ?,  ?,  ?,  ?,  ?, NOW( ) ,  ? "
							+ "       );";

					PreparedStatement insertIntoSalesTable = c.prepareStatement(insertIntoSalesSQL3);

					for (int i = 0; i < productNames.size(); i++) {

						insertIntoSalesTable.setInt(1, order_id);

						insertIntoSalesTable.setInt(2, id.get(i));

						insertIntoSalesTable.setString(3, productNames.get(i));

						insertIntoSalesTable.setDouble(4, prices.get(i));

						insertIntoSalesTable.setInt(5, qty.get(i));

						insertIntoSalesTable.setInt(6, User.getUserId());

						insertIntoSalesTable.executeUpdate();

					}
					
					
					for (int i = 0; i < productNames.size(); i++) {
						ResultSet rs = st.executeQuery("SELECT `product_qty` FROM `products` WHERE `product_id` = " + id.get(i));
						rs.next();
						
						int q = rs.getInt("product_qty");
						int quantity = q - qty.get(i);
						
						st.addBatch(
								" UPDATE  `products` "
										+ " SET "
										+ "`product_qty` = " + quantity + ""
										+ " WHERE  `products`.`product_id` = " + id.get(i) + " "
										+ " AND "
										+ " `product-name` = '" + productNames.get(i) + "' ");
						st.executeBatch();
					}
					
					c.commit();

					response.sendRedirect(request.getContextPath()+"/userinfo.jsp");
				} 
			}
			catch (SQLException ex) {
				ex.printStackTrace();
			}
			catch (ClassNotFoundException ex) {
				ex.printStackTrace();
			}
			session.removeAttribute("cart");
		} 
	}
}
