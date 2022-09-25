
<%@page import="user.user"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PixelMedia</title>
<jsp:useBean class="product.product" id="product" scope="session"></jsp:useBean>
<%@page import="java.sql.*, database.*"%>
<%@include file="includesPage/_stylesheets.jsp"%>
<script src="js/librerieJQuery/jquery-1.7.2.min.js"></script>
<script src="js/GeneralFormValidator.js"></script>

<style type="text/css">
.shippingAddress {
	background: #EEE;
	padding: 10px;
	border-radius: 50px 40px 40px 4px;
	cursor: pointer;
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

	<%
		user User;
		String email = null;
		if ((session.getAttribute("user") == null)) {
		} else {
			User = (user) session.getAttribute("user");
			email = User.getUserEmail();
	%>

	<div class="container_16">
		<div class="grid_16" id="whiteBox" style="padding: 10px;">
			<div class="grid_8">
				<br />
				<form method="post" action="buyItems" name="form1"
					onsubmit="return(validateForm())">
					<div class="grid_2" style="margin-top: 15px;">Nome</div>
					<div class="grid_5">
						<input type="text" class="name" name="name" required="required" />
					</div>
					<div class="clear"></div>
					<br />
					<div class="grid_2" style="margin-top: 17px;">Numero Telefono</div>
					<div class="grid_5">
						<input type="text" class="mobile" maxlength="10" name="mobile"
							required="required" />
					</div>
					<div class="grid_2" style="margin-top: 15px;">Indirizzo</div>
					<div class="grid_5">
						<textarea class="address" name="address" required="required"></textarea>
					</div>
					<div class="grid_2" style="margin-top: 15px;">Città</div>
					<div class="grid_5">
						<input type="text" class="citta" name="citta" required="required" />
					</div>
					<div class="grid_2" style="margin-top: 12px;">Metodo di pagamento</div>
					<div class="grid_5">
					
						<p style="position: absolute; top: 350px;">Contrassegno</p>
						
						<input id="rb1" style="position: absolute; top: 360px; left: 400px;" type="radio" value="Contrassegno" checked="checked" /> 
						
						<p style="position: absolute; top: 350px; left: 450px;">Carta di credito </p>
						
						<input id="rb2" style="position: absolute; top: 360px; left: 550px;" type="radio" value="Carta di credito" /> 
						
					</div>
					
					<div class="clear"></div>
					
					<div id="payments">
					<div class="grid_2" style="margin-top: 30px;">Tipo Carta</div>
					<div class="grid_5" style="margin-top: 30px;">
						<select name="cardType">
							<option value="visa">Visa</option>
							<option value="mastercard">Mastercard</option>
							<option value="paypal">Paypal</option>
						</select>					
					</div>
					
					<div class="grid_2" style="margin-top: 38px;">Numero Carta di Credito</div>
					<div class="grid_5" style="margin-top: 30px;">
						<input type="text" class="cardnumber" name="cardnumber" >				
					</div>
				</div>

<script type="text/javascript">
$(document).ready (function (){
	$('#payments').hide();
	
	$('#rb2').click(function(){
		document.getElementById("rb1").checked = false;
		
		$('#payments').css('display');
		$('#payments').slideDown(500);
	});
	
	$('#rb1').click(function(){
		document.getElementById("rb2").checked = false;
		
		$('#payments').css('display');
		$('#payments').slideUp(500);
	});
});

</script>


					<div class="clear"></div>
					<br />
					<div class="grid_5">
						<input type="submit" id="greenBtn" value="Compra" />
					</div>
				</form>
			</div>
			<%
				if (User.getAddress() != null && User.getMobileNum() != null && User.getUserEmail() != null
							&& User.getUsername() != null) {
			%>
			<div class="grid_7 shippingAddress" id="useInfo">
				<p style="font-size: 20px; margin: 0 auto; margin-left: 20px;">
					Completamento Rapido</p>
				<br />
				<div class="grid_1">Nome</div>
				<div class="grid_5">
					<span id="userName"><%=User.getUsername()%></span>
				</div>
				<div class="clear"></div>
				<div class="grid_1">Telefono</div>
				<div class="grid_5">
					<span id="mobile"><%=User.getMobileNum()%></span>
				</div>
				<div class="grid_1">Indirizzo</div>
				<div class="grid_5">
					<span id="useAddress"><%=User.getAddress()%></span>
				</div>
				<div class="grid_1">Città</div>
				<div class="grid_5">
					<span id="citta"><%=User.getCitta()%></span>
				</div>

				<div class="clear"></div>
			</div>
			<script type="text/javascript" src="js/librerieJQuery/jquery.js"></script>
			<script type="text/javascript">
				$(document).ready(function() {
					$('#useInfo').click(function() {
						var userName = $('#userName').text();
						var mobile = $('#mobile').text();
						var address = $('#useAddress').text();
						var citta = $('#citta').text();

						$('.name').attr('value', userName);
						$('.address').attr('value', address);
						$('.mobile').attr('value', mobile);
						$('.citta').attr('value', citta);
					});
				});
			</script>
			<%
				} else {
			%>
			<a href="userinfo.jsp">
				<div class="grid_7 shippingAddress">
					<p style="font-size: 20px; margin: 0 auto; margin-left: 20px;">
						Aggiungi Dettagli Account</p>
				</div>
			</a>
			<%
				}
				}
			%>
		</div>
	</div>
</body>
</html>
