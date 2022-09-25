
function registerValidator(){

	var email = document.forms["registerServlet"]["emailReg"].value;
	var stringValidator = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	var nameLenght = email.indexOf("@");
	var pass = document.forms["registerServlet"]["passReg"].value;
	var passAgain = document.forms["registerServlet"]["passAgainReg"].value;

	if(email.match(stringValidator)){
		var isValid = true;
		if(isValid){
			if(nameLenght < 5){
				alert("L'email deve essere composta da minimo 5 caratteri");
				return false;
			}
		}
	}else{
		alert("Indirizzo Email non valido")  
		return (false)  
	}

	if(pass.length < 6){
		alert("La password deve essere di minimo 6 caratteri");
		return false;
	}else if(pass != passAgain){
		document.forms["registerServlet"]["passAgainReg"].value = null;
		alert("Reinserisci Password");
		return false;
	}	
}


function loginValidator(){
	
	var email = document.forms["login"]["email"].value;
	var pass = document.forms["login"]["pass"].value;
	
	if(email == ""|| pass == ""){
		alert("I campi sono obligatori");
		return false;
	}	
}








