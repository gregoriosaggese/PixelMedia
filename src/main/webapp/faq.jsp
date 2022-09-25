
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PixelMedia FAQ</title>
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

	<%@include file="includesPage/search_navigationbar.jsp"%>


	<div class="container_16">
		<div id="whiteBox" style="padding: 10px;">
			<br />
			<h1 style="text-align: center;">FAQ</h1>
			<hr />
		</div>
	</div>

	<div class="container_16">
		<div id="whiteBox" class="grid_16" style="padding: 10px;">
			<div name="top" class="push_1">
				<br /> <br /> <a href="#1">&bull; Dove posso cambiare la
					destinazione per la spedizione del mio ordine? </a> <br /> <br /> <a
					href="#2">&bull; Quanto costa la spedizione a domicilio della
					merce?</a> <br /> <br /> <a href="#3">&bull; Perch&egrave; il mio
					ordine non viene accettato?</a> <br /> <br /> <a href="#4">&bull;
					Come posso conoscere la disponibilit&agrave; degli articoli in
					vendita online?</a> <br /> <br /> <a href="#5">&bull; Qualli sono
					i metodi di pagamento?</a> <br /> <br /> <a href="#6">&bull;
					&Egrave; possibile annullare un ordine effettuato?</a> <br /> <br />

			</div>
			<br /> <br />
			<hr />
			<a href="#top" name="1">&bull; Dove posso cambiare la
				destinazione per la spedizione del mio ordine?</a>
			<div>

				<p>Per specificare una destinazione dove vuoi che siano spediti
					i tuoi ordini, &egrave; sufficiente andare nel tuo profilo ed
					impostare l&lsquo;indirizzo desiderato. Nota: la nuova destinazione
					non sar&agrave; applicata agli ordini gi&agrave; effettuati. Se
					necessario, puoi richiedere di cambiare la destinazione di un
					ordine gi&agrave; effettuato, e che non &egrave; ancora stato
					preparato per la spedizione, chiamando il numero 056-783329023,
					avendo il numero di riferimento dell&lsquo;ordine.</p>
			</div>
			<br /> <br /> <a href="#top" name="2">&bull; Quanto costa la
				spedizione a domicilio della merce?</a>
			<div>
				<p>Il costo della spedizione varia da corriere a corriere. Le
					spedizioni che includono anche di pi&ugrave; prodotti
					contemporaneamente, sono soggette ad un incremento del costo di
					spedizione, come se si trattasse di pi&ugrave; ordini.</p>
			</div>
			<br /> <br /> <a href="#top" name="3">&bull; Perch&egrave; il
				mio ordine non viene accettato?</a>
			<div>
				<p>L&lsquo;ordine non pu&ograve; essere accettato se viene
					ordinato materiale non disponibile. La merce ordinata non viene
					messa da parte se l&lsquo;ordine non &egrave; completamente
					accettabile; se la merce &egrave; completamente disponibile basta
					attendere, e il vostro ordine verr&agrave; accettato.</p>
			</div>
			<br /> <br /> <a href="#top" name="4">&bull; Come posso
				conoscere la disponibilit&agrave; degli articoli in vendita online?</a>
			<div>
				<p>Gli articoli visibili sul sito sono tutti disponibili ed
					acquistabili. Gli articoli non disponibili vengono immediatamente
					eliminati dal sistema.</p>
			</div>
			<br /> <br /> <a href="#top" name="5">&bull; Qualli sono i
				metodi di pagamento?</a>
			<div>
				<p>
					Sono consentite le seguenti modalit&agrave; di pagamento:<br>
					Contrassegno. Il pagamento ver&agrave; effettuato alla consegna del
					prodotto. <br>Visa. PayPal. Mastercar. <br>I pagamenti
					sono effettuabili tramite le carte di credito elecate sopra.
				</p>
			</div>
			<br /> <br /> <a href="#top" name="6">&bull; &Egrave; possibile
				annullare un ordine effettuato?</a>
			<div>
				<p>No</p>
			</div>
			<br /> 
		</div>
	</div>
	<jsp:include page="includesPage/footer.jsp"></jsp:include>
</body>
</html>
