<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PixelMedia - Admin</title>

<jsp:include page="/includesPage/_stylesheets.jsp"></jsp:include>


</head>
<body>


	<jsp:include page="adminOperation/logoutAdmin.jsp"></jsp:include>

	<div class="container_16">
		<div id="adminM">
			<div>
				<ul>
					<li id="removeP">RIMUOVI PRODOTTI</li>
					<li id="removeU">MOSTRA/RIMUOVI UTENTI</li>
					<li id="addS">AGGIUNGI/RIMUOVI SCONTI</li>
				</ul>
			</div>
		</div>

		<jsp:include page="adminOperation/removeProduct.jsp"></jsp:include>
		<jsp:include page="adminOperation/showUsers.jsp"></jsp:include>
		<jsp:include page="adminOperation/addremoveDiscount.jsp"></jsp:include>
	</div>



</body>
</html>