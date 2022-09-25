
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PixelMedia</title>
<jsp:useBean class="product.product" id="product" scope="session"></jsp:useBean>
<%@page import="java.sql.*, database.*"%>
<%@include file="includesPage/_stylesheets.jsp"%>
<script src="js/librerieJQuery/jquery-1.7.2.min.js"></script>

</head>
<body>


	<%
		if (session.getAttribute("user") == null) {
	%>
	<jsp:include page="includesPage/joinNow.jsp"></jsp:include>
	<%
		} else {
	%>
	<jsp:include page="includesPage/logout.jsp"></jsp:include>
	<%
		}
	%>

	<jsp:include page="includesPage/search_navigationbar.jsp"></jsp:include>

	<div class="container_16">
		<div id="contents">
			<div id="leftside" class="grid_3">

				<%
					String category, subcategory;
					StringBuffer sql = new StringBuffer();
					sql.append("SELECT * FROM  `products` p " + "INNER JOIN  `images` i " + "USING (  `product-name` ) ");

					category = "";
					subcategory = "";
					if (session.getAttribute("cat") != null) {
						category = (String) session.getAttribute("cat");
						ArrayList<String> subCat = product.getSubcategory(category);
				%>
				<div>
					<ul id="leftsideNav">
						<li><a href="#"><strong>Sotto-Categoria</strong></a></li>
						<%
							for (int i = 0; i < subCat.size(); i++) {
						%>
						<li><a href="addProductFilters.jsp?scat=<%=subCat.get(i)%>"><%=subCat.get(i)%></a></li>
						<%
							}
								subCat.clear();
						%>
					</ul>
				</div>

				<%
					if (session.getAttribute("scat") != null) {
							subcategory = (String) session.getAttribute("scat");

						}
					} else {

						ArrayList<String> Cat = product.getCategory();
				%>
				<div>
					<ul id="leftsideNav">
						<li><a href="#"><strong>Categorie</strong></a></li>
						<%
							for (int i = 0; i < Cat.size(); i++) {
						%>
						<li><a href="addProductFilters.jsp?cat=<%=Cat.get(i)%>"><%=Cat.get(i)%></a></li>
						<%
							}
								Cat.clear();
						%>
					</ul>
				</div>
				<%
					}
				%>
			</div>
		</div>

		<div id="middle" class="grid_13">
			<div class="grid_13" id="whiteBox">
				<div class="ProductHeading">
					<div class="grid_12">
						<h2 class="heading">
							Prodotti
							<%=category%>

							<%=subcategory%>
						</h2>
					</div>
				</div>

				<div class="grid_12 productListing">

					<div class="clear"></div>
					<%
						if (session.getAttribute("cat") != null) {
							category = (String) session.getAttribute("cat");
							sql.append(" WHERE  `category-name` =  '" + category + "' ");
					%>
					<div class="grid_4 ">
						<a id="greenBtn" href="removeProductFilter.jsp?cat=<%=category%>">Categoria
							: <%=category%> [x]
						</a>
					</div>
					<%
						
					%>

					<%
						if (session.getAttribute("scat") != null) {
								subcategory = (String) session.getAttribute("scat");
								sql.append(" AND  `sub-category-name` =  '" + subcategory + "' ");
					%>
					<div class="grid_4 ">
						<a id="greenBtn"
							href="removeProductFilter.jsp?scat=<%=subcategory%>">Sotto-Categoria
							: <%=subcategory%> [x]
						</a>
					</div>
					<%
						}
					%>
					<%
						}
					%>

					<%
						DB_Conn con = new DB_Conn();
						Connection c = con.getConnection();
						Statement st = c.createStatement();
						ResultSet rs;
						if (sql.toString().equalsIgnoreCase(
								"SELECT * FROM  `products` p " + "INNER JOIN  `images` i " + "USING (  `product-name` ) ")) {

							String newSQL = "SELECT * FROM  `products` p " + "INNER JOIN  `images` i "
									+ "USING (  `product-name` ) " + " WHERE `product_qty` > 0 " + " GROUP BY  `product-name` "
									+ " ORDER BY  `hits` DESC  ";
							rs = st.executeQuery(newSQL);
						} else {

							sql.append(" AND `product_qty` > 0  " + " GROUP BY  `product-name` " + " ORDER BY  `hits` DESC  ");
							rs = st.executeQuery(sql.toString());
						}

						while (rs.next()) {
							String product_id = rs.getString("product_id");

							String product_name = rs.getString("product-name");

							String sub_category_name = rs.getString("sub-category-name");

							String category_name = rs.getString("category-name");

							String company_name = rs.getString("company-name");

							String price = rs.getString("price");

							double isDiscount = rs.getDouble("isDiscount");

							double discount = rs.getDouble("discount");

							String summary = rs.getString("summary");

							String image_name = rs.getString("image-name");
					%>
					<div class="clear"></div>
					<div class="grid_2">
						<a href="product.jsp?id=<%=product_id%>"><img
							src="<%=image_name%>" /></a>
					</div>
					<div class="grid_9">
						<div class="grid_5">
							<p>
								<a href="product.jsp?id=<%=product_id%>"><h3>
										<span class="blue"> <%=product_name%></span>
									</h3></a>Di
								<%=company_name + " " + category_name%><br />


								<%
									if (isDiscount == 1) {
								%>
								<span class="red">&euro; <%=price%> <label
									style="color: red;">-<%=discount%>%
								</label>
								</span>
								<%
									} else {
								%>
								<span class="red">&euro; <%=price%>
								</span>
								<%
									}
								%>
							</p>
						</div>
						<div class="grid_3 push_2">
							<a href="addToCart.jsp?id=<%=product_id%>" id="greenBtn">Aggiungi
								al Carrello</a>
						</div>
					</div>
					<div class="clear"></div>
					<%
						}
						rs.close();
						st.close();
						c.close();
					%>

				</div>
			</div>
		</div>

	</div>

	<jsp:include page="includesPage/footer.jsp"></jsp:include>

</body>
</html>
