<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
	<jsp:include page="includesPage/search_navigationbar.jsp"></jsp:include>

	<div class="container_16">
		<div id="whiteBox" style="padding: 10px;">
			<br />
			<h1>Contattaci</h1>
			<hr />
		</div>
	</div>

	<div class="container_16">
		<div id="whiteBox" class="grid_16">
			<div class="grid_7 push_1">
				<div class="grid_5" id="whiteBox" style="margin: 15px;">
					<div class="grid_5">
						<div class="grid_3 ">PixelMedia</div>
						<div class="clear "></div>
						<div class="grid_1">Email:</div>
						<div class="grid_3">supporto@pixelmedia.com</div>
						<div class="grid_1">Indirizzo:</div>
						<div class="grid_3">PixelMedia Capitale sociale €2.000.000
							i.v. Sede legale in via E. Fermi 4, 24035 Curno (BG) - P.I.
							02630120166, C.C.I.A.A. Bergamo, Vendite soggette agli artt.
							45/67 "Dei diritti dei consumatori" del Codice del Consumo
							(D.lgs. 206/05)</div>
						<div class="grid_1">Telefono:</div>
						<div class="grid_3">056-783329023</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
