<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="database.DB_Conn"%>

<jsp:include page="/includesPage/_stylesheets.jsp"></jsp:include>
<script type="text/javascript" src="js/librerieJQuery/jquery.js"></script>


<script type="text/javascript">
	$(document).ready(function() {
		$('#remove').hide();
		$('#removeP').click(function() {
			$('#show').hide();
			$('#assDiscount').hide();
			$('#remove').css('display');
			$('#remove').slideToggle(550);
		});
	});
</script>


<div class="container_16">
	<div class="grid_16" id="whiteBox">
		<p></p>
		<h1 style="text-align: center;">Rimuovi Prodotti</h1>
		<p></p>
		<div style="text-align: center;">
			<form style="margin: 0 auto;" action="removeProduct" method="post"
				id="remove" onclick="return(confirmRemove())">
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

				<div style="margin-left: 100px;" id="productList"
					class="grid_3 prodGrid">
					<input style="color: black; text-align: center; width: 200px;"
						type="submit" name="buttonRemove" value="Rimuovi <%=productName%>">
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
			</form>
			<script type="text/javascript">
				function confirmRemove() {
	
					var conf = confirm("Sicuro?");
					if(conf == true){
						alert("Prodotto Rimosso")
						return true;
					}else{
						return false;
					}
		
				}
			</script>
		</div>
	</div>
</div>






