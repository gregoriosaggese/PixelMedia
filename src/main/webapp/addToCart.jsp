    
<%@page import="java.util.ArrayList"%>
<%@page import="user.user"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PixelMedia - Carrello</title>
<%@include file="includesPage/_stylesheets.jsp"%>
<script type="text/javascript" src="js/librerieJQuery/jquery.js"></script>

<style type="text/css">
#loginBtn {
	margin: 15px auto;
	padding: 5px;
	background: #FAD201;
	border-radius: 30px 20px 20px 4px;
	text-align: center;
}

#loginBtn:hover {
	background: #000;
	color: #FFF;
	border-radius: 30px 20px 20px 4px;
	text-align: center;
	cursor: pointer;
}
</style>
</head>
<body>
	<jsp:useBean id="cart" scope="session" class="cart.cart"></jsp:useBean>

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


	<div class="container_16">
		<div class="grid_16" id="whiteBox">

			<div class="grid_8 push_3">
				<h1 class="push_2" style="padding: 10px 00px; margin-left: 80px;">Prodotti
					Nel Carrello</h1>

				<%
					user User = new user();
					session.getAttribute("user");
					User = (user) session.getAttribute("user");
					if (session.getAttribute("user") == null) {
				%>
				<h3 class="showForm" id="loginBtn" style="padding: 10px 00px">Accedi
					Prima di Comprare</h3>

				<%
					} else {
				%>

				<%
					String sid = request.getParameter("id");
						System.out.println(sid);

						int id;

						if (request.getParameter("id") == null) {
							response.sendRedirect("viewProduct_.jsp");
						} else {
							id = Integer.parseInt(sid);

							boolean b = cart.addProduct(id);

							if (b == true) {
								System.out.println("product view"+cart.getProductPrice(id));
								out.println(
										"Prodotto Aggiunto <br> <br>  Prezzo: " + cart.getProductPrice(id) + " &euro; <br>");
							} else {
								out.println("Non Aggiunto");
							}

							out.println("<br/>Prezzo Totale: " + cart.getTotalPriceOfCart());
							ArrayList<String> productNames = new ArrayList<String>();
							ArrayList<Double> productPrices = new ArrayList<Double>();
							ArrayList<Integer> Qty = new ArrayList<Integer>();
							ArrayList<Integer> ids = new ArrayList<Integer>();

							productNames = cart.getProductNames();
							productPrices = cart.getPrices();
							Qty = cart.getQty();
							ids = cart.getId();
				%>


				<div id="CartTable" style="padding: 10px 00px" class="grid_11">
					<div class="grid_5">
						<h2>Nome Prodotto</h2>
						<br>
					</div>
					<div class="grid_2">
						<h2>Prezzo</h2>
						<br>
					</div>
					<div class="grid_2">
						<h2>Quantità</h2>
						<br>
					</div>

					<%
						for (int i = 0; i < productNames.size(); i++) {
					%>

					<div class="grid_5">
						<%=productNames.get(i)%>
					</div>
					<div class="grid_2">
						&euro;
						<%=productPrices.get(i)%>
					</div>
					<div class="grid_1">
						x<%=Qty.get(i)%>
					</div>
					<div class="grid_2">
						&euro;
						<%=Qty.get(i) * productPrices.get(i)%>
					</div>

					<%
						}
								productNames.clear();
								productPrices.clear();
					%>
					<br />

					<div class="grid_5">
						<strong>Prezzo Totale del Carrello:</strong>
					</div>

					<div class="grid_3 push_3">
						&euro;
						<%= cart.getTotalPriceOfCart() %>
					</div>
					<div class="clear"></div>

					<br /> <br /> <a href="buyItems.jsp">
						<div class="grid_3" id="greenBtn">Compra</div>
					</a> <a href="viewProducts_.jsp">
						<div class="grid_3" id="greenBtn">Continua lo Shopping</div>
					</a>
				</div>

				<br> <br> <br>
				<%
					}

					}
				%>
			</div>

		</div>
	</div>
</body>
</html>
