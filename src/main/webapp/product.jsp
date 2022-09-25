<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*, database.*"%>

<!DOCTYPE HTML>
<html>
<head>
<title>PixelMedia</title>
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

	<%
		String id = request.getParameter("id");

		if (request.getParameter("id") == null) {
			response.sendRedirect("viewProducts_.jsp");
		} else {

			DB_Conn c = new DB_Conn();
			Connection con = c.getConnection();

			Statement st = con.createStatement();

			String getProductQuery = "SELECT * FROM  `products` p INNER JOIN  `images` i USING (  `product-name` ) WHERE  `product_id` ="
					+ id + " GROUP BY  `product-name` ";
			ResultSet rs = st.executeQuery(getProductQuery);

			rs.next();

			String product_id = rs.getString("product_id");

			int product_hits = rs.getInt("hits");

			String product_name = rs.getString("product-name");

			String sub_category_name = rs.getString("sub-category-name");

			String category_name = rs.getString("category-name");

			String company_name = rs.getString("company-name");

			double price = rs.getDouble("price");

			double isDiscount = rs.getDouble("isDiscount");

			double discount = rs.getDouble("discount");

			String summary = rs.getString("summary");

			String image_name = rs.getString("image-name");
	%>


	<div class="container_16">

		<div class="grid_16" id="productStrip">
			<div class="ProductHeading">
				<div class="grid_16">
					<h2 class="heading"><%=product_name%>-
						<%=company_name%>
						<%=category_name%></h2>
				</div>
			</div>

			<div class="grid_10">
				<div class="grid_10">
					<br />
					<h5>
						Categoria :<a href="#"><span class="blue"><%=category_name%></span></a>
						> <a href="#"><span class="blue"><%=sub_category_name%></span></a>
					</h5>
					<div class="clear"></div>
					<br />

					<%
						if (isDiscount == 1) {
								price = price - discount / 100 * price;
					%>
					<h5>
						Prezzo <span class="BigRed">&euro; <%=price%></span>(<label
							style="color: red;">Scontato</label>)
					</h5>
					<%
						} else {
					%>
					<h5>
						Prezzo <span class="BigRed">&euro; <%=price%></span>
					</h5>
					<%
						}
					%>

					<br /> <br /> <a href="addToCart.jsp?id=<%=product_id%>">
						<div class="grid_3" id="buy">Aggiungi</div>
					</a>

					<h1>Descrizione Oggetto</h1>
					<div class="clear"></div>
					<p><%=summary%></p>
					<p></p>
				</div>
			</div>

			<div class="grid_5">
				<div id="productImages">
					<img class="BigProductBox" alt="<%=product_name%>"
						src="<%=image_name%>" />

					<div class="clear"></div>

					<%
						rs.close();
							st.close();
						}
					%>

				</div>
				<div class="clear"></div>

			</div>

		</div>

	</div>

	<jsp:include page="includesPage/footer.jsp"></jsp:include>

</body>
</html>
