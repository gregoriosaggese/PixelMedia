
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PixelMedia</title>
<%@include file="includesPage/_stylesheets.jsp"%>
<script src="js/librerieJQuery/jquery-1.7.2.min.js"></script>
</head>
<body>


	<%
        if (session.getAttribute("user") == null ){
            %>
	<jsp:include page="includesPage/joinNow.jsp"></jsp:include>

	<%
        }else {
            %>
	<jsp:include page="includesPage/logout.jsp"></jsp:include>
	<%
        }
        %>

	<%@include file="includesPage/search_navigationbar.jsp"%>


	<div class="container_16">

		<div id="whiteBox" class="grid_16">

			<div style="padding: 10px;" class="grid_7 push_5 BigRed">
				<h1>
					<% out.print(request.getAttribute("message"));%>
				</h1>
				<h5 style="padding: 10px;">
					<%                                                                
                            out.print(request.getAttribute("messageDetail"));
                        %>
				</h5>
			</div>
		</div>
	</div>

	<div id="topLogin">

		<div class="container_16">
			<div id="LoginBox" class="grid_16">
				<div class="grid_6" id="loginForm">

					<form autocomplete="false" method="post" action="loginServlet"
						name="login" onsubmit="return(loginValidator())">
						<label>Email</label> <input type="email" name="email" required
							value="admin@admin.admin" /> <label>Password</label> <input
							type="password" name="pass" required value="admin" /> <input
							type="submit" value="Accedi" id="greenBtn" />
					</form>
				</div>

				<div class="grid_6 push_2" id="RegisterForm">
					<form method="POST" action="register" name="registerServlet"
						onsubmit="return(registerValidator())">
						<label>Email</label> <input type="email" name="emailReg"
							placeholder="" required /> <label>Password</label> <input
							type="password" name="passReg" placeholder="" required /> <label>Reinserisci
							Password</label> <input type="password" id="passAgainReg"
							name="passAgainReg" placeholder="" required /> <input
							type="submit" value="Registrati" id="greenBtn" />
					</form>
				</div>
			</div>
		</div>
		<script type="text/javascript">
	$(document).ready (function (){
		$('#topLogin').show();
	});
	
	
	
	</script>



	</div>
</body>
</html>
