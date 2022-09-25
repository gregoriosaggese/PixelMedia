
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="database.DB_Conn"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>

<style type="text/css">
.prodGrid {
	margin: 10px;
	margin-right: -12px;
	margin-left: 36px;
}
</style>
<div class="grid_13" id="productStrip">
	<a href="viewProducts_.jsp">
		<div class="ProductHeading">
			<div class="grid_12">
				<h2 class="heading">Prodotti Scontati</h2>
			</div>

		</div>
	</a>
	<div class="clear"></div>
	<%
		String sqlTopMostProds = "SELECT * " + " FROM  `products` p" + " INNER JOIN  `images` i"
				+ " USING (  `product-name` ) " + "WHERE `product_qty` > 0 " + " GROUP BY  `product-name` "
				+ " ORDER BY  `isDiscount` DESC " + " LIMIT  8";

		Connection c = new DB_Conn().getConnection();
		Statement st = c.createStatement();
		ResultSet rs = st.executeQuery(sqlTopMostProds);
		String name, productId, category, subCategory, company, imageName, price;
		double isDiscount,discount;
		int i = 1;

		while (rs.next()) {

			price = rs.getString("price");
			imageName = rs.getString("image-name");
			productId = rs.getString("product_id");
			name = rs.getString("product-name");
			subCategory = rs.getString("sub-category-name");
			category = rs.getString("category-name");
			company = rs.getString("company-name");
			isDiscount = rs.getInt("isDiscount");
			discount = rs.getInt("discount");
			
	%>
	<div id="productList" class="grid_3 prodGrid">
		<a href="product.jsp?id=<%=productId%>"><img src="<%=imageName%>" /></a>
		<p style="color: red;">
			<a href="product.jsp?id="><span class="blue"><%=name%></span></a><br />
			<%=company%>
			<%=category%><br /> <span class="red">&euro; <%=price%></span>

			<%if(isDiscount == 1){
				%>
				<span>- &euro; <%=discount%>%</span>
			<% 
			}
				%>


		</p>
	</div>
	<%
		if (i % 4 == 0) {
	%>
	<div class="clear"></div>
	<%
		}
			i++;
		}
	%>
</div>