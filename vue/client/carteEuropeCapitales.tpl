
<!DOCTYPE html>
<html>
	<head>
		
		<title>Map of the Europe capitals</title>

		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		
		<link rel="shortcut icon" type="image/x-icon" href="docs/images/favicon.ico" />
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.1/css/bulma.min.css">

	    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A==" crossorigin=""/>
	    <script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js" integrity="sha512-XQoYMqMTK8LvdxXYG3nZ448hOEQiglfqkJs1NOQV44cWnUrBc8PkAOcXy20w0vlaXaVUearIOBhiXZ5V3ynxwA==" crossorigin=""></script>

	    <link href="./vue/styleCSS/styleCapitals.css" rel="stylesheet"/>

	</head>

	<body>
		<nav class="navbar">
	        <?php require ("vue/client/menuClient.tpl");?>
	    </nav>

		<div id='map' style="width:100%; height:94%"></div>

		<script type="text/javascript" src="./vue/js/europe-capitals.js"></script>

		<script type="text/javascript">

			var map = L.map('map').setView([48.833, 2.333], 4);

			L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
				minZoom: 3,
				maxZoom: 18,
				attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors, ' +
					'Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
				id: 'mapbox/light-v9',
				tileSize: 512,
				zoomOffset: -1
			}).addTo(map);


			// control that shows state info on hover
			var info = L.control();

			info.onAdd = function (map) {
				this._div = L.DomUtil.create('div', 'info');
				this.update();
				return this._div;
			};

			info.update = function (props) {
				this._div.innerHTML = '<h4>Europe capitals</h4>' +  (props ?
					'<b>' + props.name + '</b><br/> Capital : ' + props.capital
					: 'Hover over a country');
			};

			info.addTo(map);


			function style(feature) {
				return {
					weight: 2,
					opacity: 1,
					color: '#D3D3D3',
					dashArray: '3',
					fillOpacity: 0,
					fillColor: '#D3D3D3'
				};
			}

			function highlightFeature(e) {
				var layer = e.target;

				layer.setStyle({
					weight: 5,
					color: '#666',
					dashArray: '',
					fillOpacity: 0.7
				});

				if (!L.Browser.ie && !L.Browser.opera && !L.Browser.edge) {
					layer.bringToFront();
				}

				info.update(layer.feature.properties);
			}

			var geojson;

			function resetHighlight(e) {
				geojson.resetStyle(e.target);
				info.update();
			}

			function zoomToFeature(e) {
				map.fitBounds(e.target.getBounds());
			}

			function onEachFeature(feature, layer) {
				layer.on({
					mouseover: highlightFeature,
					mouseout: resetHighlight,
					click: zoomToFeature
				});
			}

			geojson = L.geoJson(statesData, {
				style: style,
				onEachFeature: onEachFeature
			}).addTo(map);

		</script>

	</body>
</html>
