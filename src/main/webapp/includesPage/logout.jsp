
<%-- <%@page import="javafx.scene.control.Alert"%> --%>
<%@page import="java.util.ArrayList"%>
<%@page import="user.user"%>


<style type="text/css">
.backRed {
	background: #CC0000;
	padding: 3px 7px;
	margin-right: 3px;
}
</style>
<jsp:useBean id="cart" scope="session" class="cart.cart"></jsp:useBean>
<%

	ArrayList<Integer> Qty = new ArrayList<Integer>();
	Qty = cart.getQty();
	int totalQty = 0;
	for (int i = 0; i < Qty.size(); i++) {
		totalQty += Qty.get(i);
	}

	user User = (user) session.getAttribute("user");
	String email = User.getUserEmail();
	String userName = User.getUsername();
	int uid = User.getUserId();

	String printName;
	if (userName == null) {
		printName = email;
	} else {
		printName = userName;
	}
%>

<div id="topWrapper">
	<div class="container_16">
		<div class="grid_16">
			<div id="logo" class="grid_6">
				<a class="container-logo" href="index.jsp"> <img id="img-logo"
					alt="img1" src="images/logo/pixelmediashop.png"
					style="height: 40px; width: 320px"> <img id="img-logo2"
					alt="img2" src="images/logo/pixelmediashop2.png"
					style="height: 40px; width: 320px">
				</a>
			</div>
			<div class="grid_9" id="top">
				<ul>
					<a href="_logoutServlet"><li id="greenBtn" class="Btn showForm">Logout</li></a>
					<a href="userinfo.jsp?uid=<%=uid%>"><li class="Btn showForm"><%=printName%></li></a>
					<a href="addToCart_view.jsp"><li class="Btn showForm"><span
							id="bottone" class="backRed"><%=totalQty%></span>Carrello</li></a>

				</ul>
			</div>
		</div>
	</div>
</div>
