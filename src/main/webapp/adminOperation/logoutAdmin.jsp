
<%@page import="admin.Admin"%>
<jsp:include page="/includesPage/_stylesheets.jsp"></jsp:include>

<%
	Admin admin = (Admin) session.getAttribute("admin");
	String emailAdmin = admin.getEmail();
%>

<div id="topWrapper">
	<div class="container_16">
		<div class="grid_16">
			<div id="logo" class="grid_6">
				<a class="container-logo" href="admin.jsp"> <img id="img-logo"
					alt="img1" src="images/logo/pixelmediashop.png"
					style="height: 40px; width: 320px"> <img id="img-logo2"
					alt="img2" src="images/logo/pixelmediashop2.png"
					style="height: 40px; width: 320px">
				</a>
			</div>
			<div class="grid_9" id="top">
				<ul>
					<a href="_logoutServlet"><li id="greenBtn" class="Btn showForm">Logout</li></a>
					<a href="admin.jsp"><li class="Btn showForm"><%=emailAdmin%></li></a>
				</ul>
			</div>
		</div>
	</div>
</div>