

<div id="topSearch">
	<div class="container_16">
		<div class="grid_16">
			<div class="grid_9">
				<input type="text" id="search" class="searchBox"
					placeholder="Cerca un elemento..." />
			</div>
			<div class="grid_6" id="topNav">
				<ul>
					<li><a href="index.jsp">HOME</a></li>
					<li><a href="viewProducts_.jsp">PRODOTTI</a></li>
					<li><a href="contact-support.jsp">CONTATTACI</a></li>
					<li><a href="faq.jsp">FAQ</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(document).ready(function() {

		var message = "Nessun Prodotto Trovato";

		$('#search').keyup(function() {
			searchbar = $('#search').attr('value');
			if (searchbar.length >= 3) {

				$('#loadSearches').css('display');
				$.get('findProductLoad_1.jsp', { searchbar : searchbar},function(data) {

					if (data.length > 760) {
						$('#loadSearches').html(data).slideDown(500);
					} else {
						$('#loadSearches').slideUp(500);
						$('#loadSearches').html("");
					}
				});
				
			} else {
				$('#loadSearches').slideUp(500);
				$('#loadSearches').html("");
			}
		});
	});
</script>

<div class="container_16" id="loadSearches"></div>
