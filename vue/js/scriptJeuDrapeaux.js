
var flags;
var country;

var tabObject = [{drapeau: "fr", country: "France"},
				{drapeau: "at", country: "Austria"},
				{drapeau: "be", country: "Belgium"},
				{drapeau: "bg", country: "Bulgaria"},
				{drapeau: "cy", country: "Cyprus"},
				{drapeau: "cz", country: "Czechia"},
				{drapeau: "de", country: "Germany"},
				{drapeau: "dk", country: "Denmark"},
				{drapeau: "ee", country: "Estonia"},
				{drapeau: "es", country: "Spain"},
				{drapeau: "fi", country: "Finland"},
				{drapeau: "gr", country: "Greece"},
				{drapeau: "hr", country: "Croatia"},
				{drapeau: "hu", country: "Hungary"},
				{drapeau: "ie", country: "Ireland"},
				{drapeau: "it", country: "Italy"},
				{drapeau: "lt", country: "Lithuania"},
				{drapeau: "lu", country: "Luxembourg"},
				{drapeau: "lv", country: "Latvia"},
				{drapeau: "mt", country: "Malta"},
				{drapeau: "nl", country: "Netherlands"},
				{drapeau: "pl", country: "Poland"},
				{drapeau: "pt", country: "Portugal"},
				{drapeau: "ro", country: "Romania"},
				{drapeau: "se", country: "Sweden"},
				{drapeau: "si", country: "Slovenia"},
				{drapeau: "sk", country: "Slovakia"}];


window.onload = function () {
	country =  document.getElementById('Drag');
	flags = document.getElementById('Drop');	

	chargerJeu();
}

function chargerJeu() {	
	$(country).html("");
	$(flags).html("");
	initializeFlags();
	initializeCountry();
}

function initializeFlags(){
	var i;
	var code = "";
	tabObject.sort( function() { return Math.random() - .5 } );
	for (i = 0; i < tabObject.length; ++i) {
		code = "<div id='droppable' class='ui-widget-header'>";
		code += "<img src='./vue/image/flags/" + tabObject[i].drapeau + ".png' style='width : 100%'/>";
		code += "<p></p></div>";
		$(code).data("nomcountry", tabObject[i].country).appendTo(flags).droppable({
			drop: vérifierRéponses
		});	
	}
}

function initializeCountry() {
	var i;
	var code = "";
	tabObject.sort( function() { return Math.random() - .5 } );
	for (i = 0; i < tabObject.length; ++i) {
		code = "<div id='draggable' class='ui-widget-content'>";
		code += "<p>" + tabObject[i].country + "</p>";
		code += "</div>";
		$(code).data("nomcountry", tabObject[i].country).appendTo(country).draggable({cursor: 'move'});
	}
}

function vérifierRéponses(event, ui) {
	var d = $(this).data("nomcountry");
	var p = ui.draggable.data("nomcountry");
	if (d === p) {
		this.style.backgroundColor = "#22AA22";
		ui.draggable.draggable('disable');
		$(ui.draggable).hide();
		$(this).find("p").html(p);
	}
	else {
		$(this).effect("highlight", {color:'#FF3333'}).dequeue().effect("shake");
	}
}

