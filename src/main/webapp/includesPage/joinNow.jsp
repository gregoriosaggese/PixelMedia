<script type="text/javascript" src="js/headerJoinScript.js"></script>
<script type="text/javascript" src="js/RegisterLoginValidator.js"></script>


<div id="topWrapper">
	<div class="container_16">
		<div class="grid_16">
			<div id="logo" class="grid_6">
				<a class="container-logo" href="index.jsp"> <img id="img-logo"
					alt="img1" src="images/logo/pixelmediashop.png"
					style="height: 40px; width: 320px"> <img id="img-logo2"
					alt="img2" src="images/logo/pixelmediashop2.png"
					style="height: 40px; width: 320px;">
				</a>
			</div>
			<div class="grid_6" id="top">
				<ul>
					<li id="greenBtn" class="Btn showForm">Accedi - Registrati</li>
				</ul>
			</div>
		</div>
	</div>
</div>

<div id="topLogin">
	<div class="container_16">
		<div id="LoginBox" class="grid_16">
			<div class="grid_6" id="loginForm">
				<form method="post" action="loginServlet"
					name="login" onsubmit="return(loginValidator())">
					<label>Email</label> <input type="email" name="email" required />
					<label>Password</label> <input type="password" name="pass" required />
					<input type="submit" value="Accedi" id="greenBtn" />
				</form>
			</div>
			<div class="grid_6 push_2" id="RegisterForm">
				<form method="POST" action="register" name="registerServlet"
					onsubmit="return(registerValidator())">
					<label>Email</label> <input type="email" name="emailReg"
						placeholder="" required /> <label>Password</label> <input
						type="password" name="passReg" placeholder="" required /> <label>Reinserisci
						Password</label> <input type="password" id="passAgainReg" name="passAgainReg"
						placeholder="" required /> <input type="submit" value="Registrati"
						id="greenBtn" />
				</form>
			</div>
		</div>
	</div>
</div>