<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="database.DB_Conn"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PixelMedia</title>
<%@include file="includesPage/_stylesheets.jsp"%>
<script type="text/javascript" src="js/librerieJQuery/jquery.js"></script>

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

	<%@include file="includesPage/search_navigationbar.jsp"%>

	<div class="grid_16"></div>

	<div class="container_16">
		<div id="contents">
			<%
				Connection c = new DB_Conn().getConnection();
				Statement st = c.createStatement();
				String getCategory = "SELECT * FROM  `category` ";

				ResultSet rs = st.executeQuery(getCategory);
			%>
			<div id="leftside" class="grid_3">
				<div>
					<ul id="leftsideNav">
						<li><a href="#"><strong>Categorie</strong></a></li>

						<%
							while (rs.next()) {
								String category = rs.getString("category_name");
						%>
						<li><a href="viewProducts_.jsp"><%=category%></a></li>
						<%
							}
						%>
					</ul>
				</div>
			</div>

		</div>

		<div id="middle" class="grid_13">
			<jsp:include page="includesPage/topMostViewedProducts.jsp"></jsp:include>
		</div>
		<div id="middle" class="grid_13">
			<jsp:include page="includesPage/discountProduct.jsp"></jsp:include>
		</div>
	</div>

	<jsp:include page="includesPage/footer.jsp"></jsp:include>

</body>
</html>



