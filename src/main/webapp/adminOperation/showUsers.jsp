<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="database.DB_Conn"%>
<jsp:include page="/includesPage/_stylesheets.jsp"></jsp:include>

<script type="text/javascript" src="js/librerieJQuery/jquery.js"></script>


<script type="text/javascript">
	$(document).ready(function() {
		$('#show').hide();
		$('#removeU').click(function() {
			$('#remove').hide();
			$('#assDiscount').hide();
			$('#show').css('display');
			$('#show').slideToggle(550);
		});
	});
</script>


<div class="container_16">

	<div class="grid_16" id="whiteBox">
		<p></p>
		<h1 style="text-align: center;">Lista Utenti</h1>
		<p></p>
		<div style="text-align: center;">
			<form style="margin: 0 auto;" action="showUsers"
				method="post" id="show">
				<%
					int i = 1;
					DB_Conn c = new DB_Conn();
					Connection con = c.getConnection();

					Statement st = con.createStatement();

					String getUserQuery = "SELECT * FROM  `user`";

					ResultSet rs = st.executeQuery(getUserQuery);

					String userName;

					while (rs.next()) {
						userName = rs.getString("email");
				%>

				<div style="margin-left: 100px;" id="productList" class="grid_3 prodGrid">
					<input style="color: black; width: 200px;" type="submit" name="buttonShow"
						value="Mostra <%=userName%>">
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
		</div>
	</div>
</div>