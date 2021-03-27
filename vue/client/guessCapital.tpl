<!doctype html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<title>Guess the capital</title>

		<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
		<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> 
		<link rel="shortcut icon" type="image/x-icon" href="docs/images/favicon.ico" />
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.1/css/bulma.min.css">
		<link rel="stylesheet" href="/resources/demos/style.css">
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

		<script type="text/javascript" src="./vue/js/scriptCapital.js"></script>

		<style>
			h2 {
				margin-top: 10px;
				text-align: center;

			}
			legend {
				text-align: center;
			}
			fieldset {
				width: 300px;
				margin: auto;
				border-width: 1px;
				border-style: solid;
				border-color: black;
			}
			#Score, .choice {
				text-align: center;
			}
		</style>
	</head>

	<body> 
		<nav class="navbar">
	        <?php require ("vue/client/menuClient.tpl");?>
	    </nav>
	    <div id="Corps">
			<div id="dialog" title="Rules of the game"></div>

			<div id="dialogEnd" title="End of the game"></div>

			<div id="Game"></div>

			<p class="choice"></p>

			<div id="Score"></div>
		</div>

	</body>
</html>