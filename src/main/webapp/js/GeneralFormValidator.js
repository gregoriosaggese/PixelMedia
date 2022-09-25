function validateForm() {

	var nome = document.forms["form1"]["name"].value;
	var telefono = document.forms["form1"]["mobile"].value;
	var indirizzo = document.forms["form1"]["address"].value;
	var citta = document.forms["form1"]["citta"].value;
	var isChecked = document.getElementById("rb2").checked;
	var creditCardNumber = document.forms["form1"]["cardnumber"].value;
	
	if(isChecked){
		if(isNaN(creditCardNumber) || creditCardNumber.length != 12 ){
			alert("Numero carta non valido");
			return false;
		}
	}
	
	if (nome == "" || nome == "undefined" || 
			telefono == "" || telefono == "undefined"|| 
			indirizzo == "" || indirizzo == "undefined"|| 
			citta == "" || citta == "undefined"
	) {
		alert("I campi sono obligatori");
		return false;
	}else if(nome.length < 4){
		alert("Nome non Valido");
		return false;
	}
	else if(telefono.length != 9){
		alert("Telefono non valido");
		return false;
	}else if(indirizzo.length < 6 || indirizzo.length > 30){
		alert("Indirizzo non valido");
		return false;
	}else if(citta.length < 4){
		alert("Città non valida");
		return false;
	}
	else{
		alert("Acquisto Effettuato")
	}
}

function validateForm1() {

	var nome = document.forms["form2"]["username"].value;
	var telefono = document.forms["form2"]["mobileNum"].value;
	var indirizzo = document.forms["form2"]["address"].value;
	var citta = document.forms["form2"]["citta"].value;

	if (nome == "" || nome == "undefined" || 
			telefono == "" || telefono == "undefined"|| 
			indirizzo == "" || indirizzo == "undefined"|| 
			citta == "" || citta == "undefined"
	) {
		alert("I campi sono obligatori");
		return false;
	}else if(nome.length < 4){
		alert("Nome non Valido");
		return false;
	}
	else if(telefono.length != 9){
		alert("Telefono non valido");
		return false;
	}else if(indirizzo.length < 6 || indirizzo.length > 30){
		alert("Indirizzo non valido");
		return false;
	}else if(citta.length < 4){
		alert("Città non valida");
		return false;
	}
	else{
		alert("Dettagli Aggiunti")
	}
}
