
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="database.DB_Conn"%>


<script type="text/javascript">
	$(document).ready(function() {
		$('#assDiscount').hide();
		$('#addS').click(function() {
			$('#show').hide();
			$('#remove').hide();
			$('#assDiscount').css('display');
			$('#assDiscount').slideToggle(550);
		});
	});
</script>


<div class="container_16">
	<div class="grid_16" id="whiteBox">
		<p></p>
		<h1 style="text-align: center;">Aggiungi/Rimuovi Sconti</h1>
		<p></p>
		<div style="text-align: center;">
			<div id="assDiscount">
				<%
					int i = 1;
					DB_Conn c = new DB_Conn();
					Connection con = c.getConnection();

					Statement st = con.createStatement();

					String getProductQuery = "SELECT * FROM  `products`";

					ResultSet rs = st.executeQuery(getProductQuery);

					String productName;

					while (rs.next()) {
						productName = rs.getString("product-name");
				%>

				<div style="margin-left: 90px;" id="productList"
					class="grid_3 prodGrid">
					<a href="addremoveDiscountAdmin.jsp?pName=<%=productName%>"> <input
						style="color: black; text-align: center; width: 250px;"
						type="submit" name="addDiscount"
						value="<%=productName%>"></a>
				</div>


				<%
					if (i % 3 == 0) {
				%>
				<div class="clear"></div>
				<%
					}
						i++;

					}
				%>
			</div>
		</div>
	</div>
</div>
