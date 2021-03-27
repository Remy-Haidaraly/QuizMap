
var numQuestion;
questions = [
		{question: "What is the capital of France ?", choix: ["London", "Paris", "Kiev", "Berlin"], reponse: "Paris"}, 
		{question: "What is the capital of Sweden ?", choix: ["Stockholm", "Reykjavik", "Tallin", "Dublin"], reponse: "Stockholm"}, 
		{question: "What is the capital of Iceland ?", choix: ["Sofia", "Warsaw", "Kiev", "Reykjavik"], reponse: "Reykjavik"}, 
		{question: "What is the capital of Italy ?", choix: ["Riga", "Paris", "Rome", "Madrid"], reponse: "Rome"}, 
		{question: "What is the capital of Latvia ?", choix: ["Riga", "Tallin", "Vilnius", "Bucharest"], reponse: "Riga"}, 
		{question: "What is the capital of Bosnia and Herzegovina ?", choix: ["Oslo", "Vienna", "Tirania", "Sarajevo"], reponse: "Sarajevo"}, 
		{question: "What is the capital of Belarus ?", choix: ["Helsinki", "Minsk", "Prague", "Bratislava"], reponse: "Minsk"}, 
		{question: "What is the capital of Moldova ?", choix: ["Skopje", "Chișinău", "San Marino", "Ljubljana"], reponse: "Chișinău"}, 
		{question: "What is the capital of Czech Republic ?", choix: ["Prague", "Belgrade", "Tórshavn", "Amsterdam"], reponse: "Prague"}, 
		{question: "What is the capital of Faroe Islands ?", choix: ["Reykjavik", "Copenhague", "Podgorica", "Tórshavn"], reponse: "Tórshavn"}, 
		{question: "What is the capital of Liechtenstein ?", choix: ["Vaduz", "Zagreb", "Athens", "Monaco"], reponse: "Vaduz"}, 
		{question: "What is the capital of Monaco ?", choix: ["Prague", "Paris", "Monaco", "Berlin"], reponse: "Monaco"}, 
		{question: "What is the capital of Luxembourg ?", choix: ["Rome", "Brussels", "Madrid", "Luxembourg"], reponse: "Luxembourg"}, 
		{question: "What is the capital of Denmark ?", choix: ["Copenhague", "Vilnius", "Oslo", "Helsinki"], reponse: "Copenhague"}, 
		{question: "What is the capital of Germany ?", choix: ["Bern", "Budapest", "Brussels", "Berlin"], reponse: "Berlin"}
	]; 

var score = 0;
var nbQuestions = 5;

//****************************************************************//
window.onload = function () {
	g =  document.getElementById('Game');
	s = document.getElementById('Score');
	launch();
}

function launch() {
	$("#dialog").text("Selects the capital that corresponds to the country. The game is played in 5 rounds.");
	$("#dialog").dialog({
		modal: true,
      	buttons: {
	        Ok: function() {
		        $(this).dialog("close");
		        numQuestion = Math.floor(Math.random()*questions.length);
				g.innerHTML = question();
				response();
	        }
    	}
    });
}

function reload () {
	$("p.choice").html("");
	numQuestion=Math.floor(Math.random()*questions.length);
	g.innerHTML = question();
	response();
}

//****************************************************************//

function question() {
	if (nbQuestions == 0) {
		g.innerHTML = "";
	    s.innerHTML = "";
		$("#dialog").text("Your score is : " + score);
		$("#dialog").dialog({
			modal: true,
	      	buttons: {
		        Restart: function() {
			        $(this).dialog("close");
			        window.location.reload();
		        }
	    	}
	    });
	} else {
		var statement;

		statement = "<h2 class='title'>" + questions[numQuestion]["question"] + "</h2>";
		statement += "<fieldset class='fieldset'><legend>Select a capital: </legend>";

		for (var i = 0; i < questions[numQuestion]["choix"].length; i++) {
			statement += selectResponse(i,questions[numQuestion]["choix"][i]); 
		}

		statement += "</fieldset>";
		nbQuestions--;

		return statement;
	}
}

function selectResponse(numQ, text) {
	$("input").checkboxradio();
    $("fieldset").controlgroup();

    var choices;
    choices = "<input type='radio' name='radio' id='radio-" + numQ + "' value='" + text;
    choices += "'></input><label for='radio-" + numQ + "'> ";
    choices += text;
    choices += "</label><br/>";

    return choices;
}

function response() {
	$("input[name='radio']").click(function() {
		if ($("input[name='radio']:checked")) {
			if($("input[name='radio']:checked").val() == questions[numQuestion].reponse) {
				$("p.choice").html("Good answer !").css('color', 'green');
				score++;
			} else {
				$("p.choice").html("Wrong Answer. The correct answer was " + questions[numQuestion].reponse).css('color', 'red');
			}
			$("input[name='radio']").prop("disabled", "true");
			s.innerHTML = "<br/>Your score : " + score;
			s.innerHTML += "<br/><a href='#' onclick='reload();'>Next</a>";
		}
		
	});
	
}