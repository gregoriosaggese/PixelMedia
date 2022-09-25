<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<title>PixelMedia</title>
<jsp:useBean class="product.product" id="product" scope="session"></jsp:useBean>
<%@page import="java.sql.*, database.*"%>
<%@include file="includesPage/_stylesheets.jsp"%>
<script src="js/librerieJQuery/jquery-1.7.2.min.js"></script>

<style type="text/css">
#whiteBox {
	padding-top: 10px;
	padding-bottom: 10px;
	padding: 10px;
}

#status {
	margin: 17px;
	padding: 7px;
	font-size: 17px;
	text-align: center;
}
</style>
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

		<%
			if (request.getParameter("oid") != null) {

				String OrderId = request.getParameter("oid");
				String fetchInfoSQL = "SELECT * FROM  `order` WHERE  `order_id` =  '" + OrderId + "' ; ";
				Connection c = new DB_Conn().getConnection();
				Statement st = c.createStatement();
				ResultSet rs1 = st.executeQuery(fetchInfoSQL);
				while (rs1.next()) {
					String name, email, address, mobileNum, status;
					Date ordered_on_date;
					Time ordered_on_time;

					name = rs1.getString("shippers_name");
					email = rs1.getString("shippers_email");
					address = rs1.getString("address");
					mobileNum = rs1.getString("mobile_number");
					ordered_on_date = rs1.getDate("ordered_On");
					ordered_on_time = rs1.getTime("ordered_On");
					status = rs1.getString("status");
		%>
		<div class="grid_12 push_2" id="whiteBox">
			<div class="grid_7">
				<div class="grid_2">Nome :</div>
				<div class="grid_3">
					<%=name%>
				</div>
				<div class="grid_2">Email:</div>
				<div class="grid_3">
					<%=email%>
				</div>
				<div class="grid_2">Indirizzo:</div>
				<div class="grid_3">
					<%=address%>
				</div>
				<div class="grid_2">Telefono:</div>
				<div class="grid_3">
					<%=mobileNum%>
				</div>
				<div class="grid_2">Ordinato il:</div>
				<div class="grid_3">
					<%=ordered_on_date + ":" + ordered_on_time%>
				</div>
			</div>
			<div class="grid_4">
				<div id="status" class="grid_3">
					Status
					<%=status%>
				</div>
				<div class="clear"></div>
				<br />
			</div>
		</div>
		<%
			}
		%>
		<div id="whiteBox" class="grid_12 push_2">
			<div id="CartTable" style="padding: 10px 00px" class="grid_12">
				<div class="grid_1">
					<h3>Numero Ordine</h3>
				</div>
				<div class="grid_7">
					<div class="clear"></div>
					<div class="grid_4">Prodotto</div>
					<div class="grid_2">Prezzo x Quantità</div>
				</div>
				<div class="grid_3 ">
					<h3>Totale</h3>
				</div>

				<div class="clear"></div>

				<%
					String sql = "SELECT  `order_id` ,  `product_name` ,  `product_price` ,  `product_quantity` ,  `sold_on` "
								+ " FROM  `order` o " + " INNER JOIN  `sales` s " + " USING (  `order_id` ) "
								+ " WHERE o.`order_id` = " + OrderId + " " + " ORDER BY `order_id` DESC ";

						PreparedStatement psmt = c.prepareStatement(sql);

						ResultSet rs = psmt.executeQuery();

						int oldOrder = 0;
						int newOrder;

						String product_name;
						double product_price;
						int product_quantity;
						Date sold_on_date;
						Time sold_on_time;
						double totalPrice = 0;
						double totalValue = 0;
						while (rs.next()) {
							newOrder = rs.getInt("order_id");
							product_name = rs.getString("product_name");
							product_price = rs.getDouble("product_price");
							product_quantity = rs.getInt("product_quantity");
							sold_on_time = rs.getTime("sold_on");
							sold_on_date = rs.getDate("sold_on");
							String orderDateArr[] = sold_on_date.toString().split("-");
							totalValue = product_quantity * product_price;
							totalPrice += totalValue;
							String billNo = "";
							for (int i = orderDateArr.length - 1; i >= 1; i--) {
								billNo += orderDateArr[i];
							}
							billNo += newOrder;
							if (oldOrder == newOrder) {
				%>


				<div class="grid_12">
					<div class="push_1">
						<div class="grid_7">
							<div class="grid_4 ">
								<a href="product.jsp?id="></a>
								<%=product_name%>
							</div>
							<div class="grid_2">
								&euro;
								<%=product_price%>
								x<%=product_quantity%>
							</div>
						</div>
						<div class="grid_3">
							<%=totalValue%>
						</div>
					</div>
				</div>

				<%
					} else {
				%>


				<div class="grid_12">
					<div class="grid_1">
						<a class="blue" href="showMyBill.jsp?oid=<%=newOrder%>"><%=billNo%></a>
					</div>
					<div class="grid_7">
						<div class="grid_4 ">
							<%=product_name%>
						</div>
						<div class="grid_2">
							&euro;
							<%=product_price%>
							x<%=product_quantity%>
						</div>
					</div>
					<div class="grid_3">
						<%=totalValue%>
					</div>
				</div>
				<div class="clear"></div>

				<%
					}
							oldOrder = newOrder;
						}

						totalPrice = Math.ceil(totalPrice);
				%>


				<div class="clear"></div>
				<br />
				<div class="grid_12">
					<hr class="grid_11" />
					<div class="grid_4">Totale Ordine</div>
					<div class="grid_4 push_4">
						<h1>
							&euro;
							<%=totalPrice%></h1>
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</div>

	<%
		} else {
	%>
	<div class="container_16">
		<div class="grid_12 push_2" id="whiteBox">
			<br />
			<h1>Nessun Prodotto</h1>
			<hr />
			<br />
		</div>
	</div>
	<%
		}
	%>
</body>
</html>
