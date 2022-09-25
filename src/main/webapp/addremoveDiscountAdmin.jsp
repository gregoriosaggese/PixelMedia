

<%@page import="java.awt.Event"%>
<%@page import="javax.websocket.OnClose"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PixelMedia</title>
<jsp:useBean class="product.product" id="product" scope="session"></jsp:useBean>
<%@page import="java.sql.*, database.*"%>

<%@include file="/includesPage/_stylesheets.jsp"%>

</head>
<body>



	<jsp:include page="adminOperation/logoutAdmin.jsp"></jsp:include>



	<%
		String pName = request.getParameter("pName");

		Connection c = new DB_Conn().getConnection();

		String sql = "SELECT * FROM `products` WHERE `product-name` = " + "'" + pName + "'";

		Statement st = c.createStatement();
		ResultSet rs = st.executeQuery(sql);

		int pID = 0;
		String productName = "", category = "";
		double price = 0, isDiscount = 0, discount = 0;

		while (rs.next()) {

			pID = rs.getInt("product_id");
			productName = rs.getString("product-name");
			category = rs.getString("category-name");
			price = rs.getDouble("price");
			isDiscount = rs.getDouble("isDiscount");
			discount = rs.getDouble("discount");

		}
		c.close();
	%>

	<div class="container_16" style="width: 800px;">
		<div id="whiteBox" class="grid_16"
			style="width: 800px; text-align: center;">

			<div>
				<p></p>
				<label>ID Prodotto = <%=pID%></label>
				<p></p>
				<label>Nome Prodotto = <%=productName%></label>
				<p></p>
				<label>Categoria = <%=category%></label>
				<p></p>
				<label>Prezzo = <%=price%>&euro;
				</label>
				<p></p>
				<%
					if (isDiscount == 1) {
				%>
				<label>Scontato = Si </label>
				<%
					} else {
				%>
				<label>Scontato = No</label>
				<%
					}
				%>
				<p></p>
				<label>Sconto = <%=discount%>%
				</label>
				<p></p>
			</div>

			<div style="text-align: center;">
				<script type="text/javascript">
					function addDiscount() {

						var pDiscount = document.getElementById("pDiscount").value;

						if (pDiscount > 0 && pDiscount < 100) {
							alert("Sconto Inserito")
						} else {
							alert("Sconto non Inserito")
							return false;
						}

					}
				</script>

				<form action="addDiscount" method="post"
					onsubmit="return(addDiscount())">
					<div>
						<label>Inserisci Percentuale Sconto <input
							style="width: 80px;" type="number" name="percentualeSconto"
							id="pDiscount"></label>
					</div>

					<input style="width: 100px; color: black;" type="submit"
						name="inserisci-ID" value="<%=pID%> Inserisci">
				</form>

				<script type="text/javascript">
					function alert1() {
						alert("Sconto Rimosso")
					}
				</script>

				<form action="removeDiscount" method="post"
					onsubmit="return(alert1())">
					<input style="width: 100px; color: black;" type="submit"
						name="inserisci-ID" value="<%=pID%> Rimuovi">
				</form>

			</div>

		</div>
	</div>











</body>
</html>
