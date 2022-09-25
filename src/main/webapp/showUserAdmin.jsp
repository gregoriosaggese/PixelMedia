

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PixelMedia</title>
<jsp:useBean class="product.product" id="product" scope="session"></jsp:useBean>
<%@page import="java.sql.*, database.*"%>
<%@include file="/includesPage/_stylesheets.jsp"%>


</head>
<body>



	<jsp:include page="adminOperation/logoutAdmin.jsp"></jsp:include>



	<%
		Connection c = new DB_Conn().getConnection();
		String userID = (String) session.getAttribute("userID");

		String sql = "SELECT * FROM `user-details` WHERE `user_id` = " + "'" + userID + "'";

		Statement st = c.createStatement();
		ResultSet rs = st.executeQuery(sql);

		String username = "", mobileN = "", address = "", gender = "", citta = "", pass = "";

		while (rs.next()) {
			username = rs.getString("username");
			mobileN = rs.getString("mobile_no");
			address = rs.getString("address");
			gender = rs.getString("gender");
			citta = rs.getString("citta");
		}
		rs.close();

		String sql2 = "SELECT * FROM `user` WHERE `user_id` = " + "'" + userID + "'";
		ResultSet rs2 = st.executeQuery(sql2);
		rs2.next();
		pass = rs2.getString("pass");
		
		c.close();
		if (username == "") {
	%>

	<div class="container_16" style="width: 400px">
		<div id="whiteBox" class="grid_16" style="width: 400px;">
			<p></p>
			<h1>Questo utente non ha regitrato dati</h1>
			<p></p>
			<form action="removeUser" method="post">
				<div style="text-align: center;">
					<input style="width: 100px; color: black;" type="submit"
						value="Rimuovi">
				</div>
			</form>

		</div>
	</div>
	<%
		} else {
	%>

	<div class="container_16" style="width: 800px;">
		<div id="whiteBox" class="grid_16"
			style="width: 800px; text-align: center;">

			<div>
				<p></p>
				<label>User ID = <%=userID%></label>
				<p></p>
				<label>Username = <%=username%></label>
				<p></p>
				<label>Password = <%=pass%></label>
				<p></p>
				<label>Numero Telefono = <%=mobileN%></label>
				<p></p>
				<label>Indirizzo = <%=address%></label>
				<p></p>
				<label>Sesso = <%=gender%></label>
				<p></p>
				<label>Citt&agrave; = <%=citta%></label>
				<p></p>
			</div>

			<form action="removeUser" method="post">
				<div style="text-align: center;">
					<input style="width: 100px; color: black;" type="submit"
						value="Rimuovi">
				</div>
			</form>
		</div>
	</div>
	<%
		}
	%>









</body>
</html>
