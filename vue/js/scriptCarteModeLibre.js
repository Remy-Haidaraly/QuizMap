function initialize() {

    var mbUrl = 'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw';

    var grayscale = L.tileLayer(mbUrl, {id: 'mapbox/light-v9', tileSize: 512, zoomOffset: -1}),
        streets = L.tileLayer(mbUrl, {id: 'mapbox/streets-v11', tileSize: 512, zoomOffset: -1}),
        Esri_WorldImagery = L.tileLayer('https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}');

    var map = L.map('map', {
        center: [48.833, 2.333],
        zoom: 4,
        layers: [streets]
    });
        
    var baseLayers = {
        "Streets": streets,
        "Grayscale": grayscale,
        "World Imagery":Esri_WorldImagery
    };

    var legend = L.control({position: 'topright'});

    legend.onAdd = function (map) {

        var div = L.DomUtil.create('div', 'info legend');
        div.innerHTML = "World Map";

        return div;
    };

    legend.addTo(map);
    L.control.layers(baseLayers).addTo(map);
}