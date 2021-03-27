<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <link rel="stylesheet" href="https://unpkg.com/leaflet@1.6.0/dist/leaflet.css" integrity="sha512-xwE/Az9zrjBIphAcBb3F6JVqxf46+CDLwfLMHloNu6KEQCAWi6HcDUbeOfBIptF7tcCzusKFjFw2yuvEpDL9wQ==" crossorigin=""/>
        <script src="https://unpkg.com/leaflet@1.6.0/dist/leaflet.js" integrity="sha512-gZwIG9x3wUXg2hdXF6+rVkLF/0Vi9U8D2Ntg4Ga5I5BZpVkVxlJWbSQtXPSiUTtC0TjtGOmxa1AJPuV0CPthew==" crossorigin=""></script>
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> 
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.1/css/bulma.min.css">

        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

        <link href="./vue/styleCSS/styleGuessCountry.css" rel="stylesheet"/>

        <title>Guess the country</title>
    </head>

    <body>
        <nav class="navbar">
            <?php require ("vue/client/menuClient.tpl");?>
        </nav>

        <div id='dialog' title='Rules of the game'></div>
        <div id="dialogEnd" title="End of the game"></div>
        <div id="map" style="width:100%; height:100%"></div>

    </body>
</html>

<script type="text/javascript" src="./vue/js/countries.js"></script>
<script type="text/javascript">

    var numQuestion;
    var cptClick = 1;
    var nbQuestions = 5;
    var score = 0;
    var selectedCountry;
    var map;

    var info = L.control();

    function reloadGame() {
        
            numQuestion = Math.floor(Math.random()*questions.length);
            cptClick = 1;

            info.onAdd = function (map) {
                this._div = L.DomUtil.create('div', 'info');
                this.update();
                return this._div;
            };

            info.update = function (props) {
                this._div.innerHTML = "<h2>" + questions[numQuestion]["question"] + "</h2>";
                if (cptClick == 0) {
                    if (selectedCountry == questions[numQuestion]["reponse"]) {
                        alert("Good answer !");
                        score++;
                    } else {
                        alert("Wrong answer !");
                    }
                    cptClick--;
                }
                if (cptClick == -1) {
                    if (nbQuestions == 0) {
                        this._div.innerHTML += "Your score : " + score;
                        this._div.innerHTML += "<br/><a href=''>Restart</a>";
                    } else {
                        this._div.innerHTML += "Your score : " + score;
                        this._div.innerHTML += "<br/><a href='#' onclick='reloadGame();'>Next</a>";
                    }
                }
            };

            nbQuestions--;
            info.addTo(map);
        
    }

    window.onload = function dialogPopup() {
        $("#dialog").text("Click twice on the right country. The game is played in 5 rounds.");
        $("#dialog").dialog({
            modal: true,
            buttons: {
                Ok: function() {
                    $(this).dialog("close");
                    initialize();
                }
            }
        });
    }

    function initialize() {

        questions = [
            {question: "Where is Mauritania ?", reponse: "Mauritania"}, 
            {question: "Where is Honduras ?", reponse: "Honduras"}, 
            {question: "Where is Chile ?", reponse: "Chile"}, 
            {question: "Where is India ?", reponse: "India"}, 
            {question: "Where is Latvia ?", reponse: "Latvia"}, 
            {question: "Where is Bosnia and Herzegovina ?", reponse: "Sarajevo"}, 
            {question: "Where is South Korea ?", reponse: "South Korea"}, 
            {question: "Where is Russia ?", reponse: "Russia"}, 
            {question: "Where is Finland ?", reponse: "Finland"}, 
            {question: "Where is El Salvador ?", reponse: "El Salvador"}, 
            {question: "Where is Japan ?", reponse: "Japan"}, 
            {question: "Where is Cuba ?", reponse: "Cuba"}, 
            {question: "Where is Luxembourg ?", reponse: "Luxembourg"}, 
            {question: "Where is Uruguay ?", reponse: "Uruguay"}, 
            {question: "Where is Germany ?", reponse: "Germany"},
            {question: "Where is Namibia ?", reponse: "Namibia"},
            {question: "Where is Chad ?", reponse: "Chad"},
            {question: "Where is Democratic Republic of the Congo ?", reponse: "Democratic Republic of the Congo"},
            {question: "Where is Egypt ?", reponse: "Egypt"},
            {question: "Where is Uzbekistan ?", reponse: "Uzbekistan"}
        ]; 
        numQuestion = Math.floor(Math.random()*questions.length);

        map = L.map('map').setView([48.833, 2.333], 4);
        map.createPane('labels');
        map.getPane('labels').style.zIndex = 650;
        map.getPane('labels').style.pointerEvents = 'none';

        var CartoDB_PositronNoLabels = L.tileLayer('https://{s}.basemaps.cartocdn.com/light_nolabels/{z}/{x}/{y}{r}.png', {
            attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors &copy; <a href="https://carto.com/attributions">CARTO</a>',
            subdomains: 'abcd',
            minZoom: 3,
            maxZoom: 19
          });
    
        map.addLayer(CartoDB_PositronNoLabels);

        function showCountrySelected() {
            info.update();
            info.addTo(map);
        }

        L.geoJSON(countries, {
            style: function(feature) {
                return {
                  fillColor: "#D3D3D3", // Default color of countries.
                  fillOpacity: 0,
                  stroke: false,
                };
            },
            onEachFeature: function(feature, layer) {
                layer.on({
                    click: showCountrySelected
                });
            }
        }).bindPopup(function(layer) {
            selectedCountry = layer.feature.properties.name;
            if (cptClick > 0) {
                cptClick--;
            } else {
                return selectedCountry;
            }
        }).addTo(map);

        reloadGame();
    }

</script>