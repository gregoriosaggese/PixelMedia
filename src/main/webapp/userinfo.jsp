
<%@page import="cart.cart"%>
<%@page import="user.user"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
#leftside {
	cursor: pointer;
	position: fixed;
}
</style>

<script type="text/javascript">
	$(document).ready(function() {
		var MyOrders = $('#MyOrders');
		var MyAccount = $('#Account');
		var MySettings = $('#Settings');
		var MyUserInfo = $('#userInfo');

		var Orders = $('.MyOrders');
		var Account = $('.Account');
		var Settings = $('.Settings');

		MyOrders.click(function() {
			Orders.slideDown(700);
			Account.slideUp(700);
			Settings.slideUp(700);
		});
		MyAccount.click(function() {
			Orders.slideUp(700);
			Account.slideDown(700);
			Settings.slideUp(700);
		});
		MySettings.click(function() {
			Orders.slideUp(700);
			Account.slideUp(700);
			Settings.slideDown(700);
		});
		MyUserInfo.click(function() {
			Orders.slideDown(700);
			Account.slideDown(700);
			Settings.slideDown(700);
		});

	});
</script>

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

		user User;
		String printName = null;
		if ((session.getAttribute("user") == null)) {
			response.sendRedirect("index.jsp");
		} else {
			User = (user) session.getAttribute("user");
			String email = User.getUserEmail();
			String userName = User.getUsername();
			int uid = User.getUserId();

			if (userName == null) {
				printName = email;
			} else {
				printName = userName;
			}
	%>

	<jsp:include page="includesPage/search_navigationbar.jsp"></jsp:include>

	<div class="container_16">
		<div id="leftside" class="grid_3">
			<ul id="leftsideNav">
				<li><a id="userInfo"><strong>Profilo Utente</strong></a></li>
				<li><a id="Account">Account</a></li>
				<li><a id="MyOrders">I Miei Ordini</a></li>
				<li><a id="Settings">Impostazioni</a></li>
			</ul>
		</div>
		<div class="grid_13 push_3" id="whiteBox">
			<div class="grid_13">
				<h1 style="text-align: center; padding: 10px 0px 0px 0px;">
					Ciao
					<%=printName%></h1>
				<p></p>
			</div>
		</div>

		<div id="whiteBox" class="grid_13 push_3">
			<div
				style="text-align: center; border-top: 20px #444 solid; padding: 10px 0px 10px 0px;"
				class="grid_12 MyOrders">

				<h1 style="padding: 10px 0px 10px 0px;">I Miei Ordini</h1>

				<div id="CartTable" style="padding: 10px 00px; margin-bottom: 40px;"
					class="grid_12">
					<div class="grid_1">
						<h3>Numero Ordine</h3>
					</div>
					<div class="grid_7">
						<div class="clear"></div>
						<div class="grid_4">Prodotto</div>
						<div class="grid_2">Prezzo x Quantità</div>
					</div>
					<div class="grid_3 push_1">
						<h3>Data</h3>
					</div>

					<div class="clear"></div>

					<%
						String sql = "SELECT  `order_id` ,  `product_name` ,  `product_price` ,  `product_quantity` ,  `sold_on` "
									+ " FROM  `order` o " + " INNER JOIN  `sales` s " + " USING (  `order_id` ) "
									+ " WHERE o.`user_id` = " + uid + " " + " ORDER BY `order_id` DESC ";

							Connection c = new DB_Conn().getConnection();

							PreparedStatement psmt = c.prepareStatement(sql);

							ResultSet rs = psmt.executeQuery();

							int oldOrder = 0;
							int newOrder;

							String product_name;
							double product_price;
							int product_quantity;
							Date sold_on_date;
							Time sold_on_time;

							while (rs.next()) {
								newOrder = rs.getInt("order_id");
								product_name = rs.getString("product_name");
								product_price = rs.getDouble("product_price");
								product_quantity = rs.getInt("product_quantity");
								sold_on_time = rs.getTime("sold_on");
								sold_on_date = rs.getDate("sold_on");
								String orderDateArr[] = sold_on_date.toString().split("-");

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
								<%=sold_on_date%>
								:
								<%=sold_on_time%>
							</div>
						</div>
					</div>

					<%
						} else {
					%>

					<div class="grid_12" style="border-top: 2px #444 solid;">
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
							<%=sold_on_date%>
							:
							<%=sold_on_time%>
						</div>
					</div>
					<div class="clear"></div>

					<%
						}
								oldOrder = newOrder;
							}
					%>
				</div>
			</div>
			<div class="clear"></div>
			<div
				style="text-align: center; border-top: 20px #444 solid; padding: 10px 0px 10px 0px;"
				class="grid_9 push_1 Account">
				<h1 style="padding: 10px 0px 10px 0px;">Account Utente</h1>

				<%
					if (User.getUsername() == null) {
				%>
				<form method="post" action="addUserDetalsServlet" name="form2"
					onsubmit="return(validateForm1())">
					<div class="grid_3">Nome</div>
					<div class="grid_5">
						<input type="text" name="username" required />
					</div>
					<div class="clear"></div>
					<br />
					<div class="grid_3">Sesso</div>
					<div class="grid_5">
						<select name="gender" required>
							<option value="male">Maschio</option>
							<option value="female">Femmina</option>
						</select>
					</div>
					<div class="clear"></div>
					<br />
					<div class="grid_3">Telefono</div>
					<div class="grid_5">
						<input type="text" name="mobileNum" maxlength="10" required />
					</div>
					<div class="clear"></div>
					<br />
					<div class="grid_3">Indirizzo</div>
					<div class="grid_5">
						<textarea name="address" required></textarea>
					</div>
					<div class="clear"></div>
					<br />
					<div class="grid_3">Città</div>
					<div class="grid_5">
						<input type="text" name="citta" required /><br /> <input
							type="submit" id="greenBtn" value="Aggiungi Dettagli" />
					</div>
					<div class="clear"></div>
					<br />
				</form>
				<%
					} else {
				%>
				<form method="post" action="addUserDetalsServlet" name="form2"
					onsubmit="return(validateForm1())">
					<div class="grid_3">Nome</div>
					<div class="grid_5">
						<input type="text" name="username" value="<%=User.getUsername()%>"
							required />
					</div>
					<div class="clear"></div>
					<br />
					<div class="grid_3">Sesso</div>
					<div class="grid_5">
						<select name="gender" required>

							<%
								if (User.getGender().equals("male")) {
							%>
							<option value="male" selected>Maschio</option>
							<option value="female">Femmina</option>
							<%
								} else {
							%>
							<option value="male">Maschio</option>
							<option value="female" selected>Femmina</option>

							<%
								}
							%>
						</select>
					</div>
					<div class="clear"></div>
					<br />
					<div class="grid_3">Telefono</div>
					<div class="grid_5">
						<input type="text" name="mobileNum"
							value="<%=User.getMobileNum()%>" required>
					</div>
					<div class="clear"></div>
					<br />
					<div class="grid_3">Indirizzo</div>
					<div class="grid_5">
						<textarea name="address" required><%=User.getAddress()%></textarea>
					</div>
					<div class="clear"></div>
					<br />
					<div class="grid_3">Città</div>
					<div class="grid_5">
						<input type="text" name="citta" value="<%=User.getCitta()%>"
							required> <input type="submit" id="greenBtn"
							value="Cambia Info Account">
					</div>
					<div class="clear"></div>
					<br />
				</form>
				<%
					}
				%>

			</div>
			<div class="clear"></div>

			<div
				style="text-align: center; border-top: 20px #444 solid; padding: 10px 0px 10px 0px;"
				class="grid_9 push_1 Settings">

				<h1 style="padding: 10px 0px 10px 0px;">Impostazioni</h1>

				<form method="post" action="changeMyPass" name="form3" onsubmit="return(passValidator())">
					<div class="grid_3">Email</div>
					<div class="grid_5">
						<input type="text" name="email" value="<%=User.getUserEmail()%>"
							disabled />
					</div>
					<div class="clear"></div>
					<br />
					<div class="grid_3">Password</div>
					<div class="grid_5">
						<input type="password" name="pass" /><br /> <br /> <input
							id="greenBtn" type="submit" value="Cambia Password" />
					</div>
					<div class="clear"></div>
					<br />
				</form>
				<script type="text/javascript">
					function passValidator() {
						var pass = document.forms["form3"]["pass"].value;
						if (pass.length < 6) {
							alert("Password non Valida")
							return false;
						}else{
							alert("Password Modificata")
						}
					}
				</script>

			</div>
			<div class="clear"></div>
		</div>
	</div>
	<%
		}
	%>
	<jsp:include page="includesPage/footer.jsp"></jsp:include>
</body>
</html>
