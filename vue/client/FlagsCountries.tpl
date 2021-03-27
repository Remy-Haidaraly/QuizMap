<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<title>Guess the countries</title>

	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	<script type="text/javascript" src="./vue/js/scriptJeuDrapeaux.js"></script>
	
    <link rel="stylesheet" type="text/css" href="./vue/styleCSS/styleDuJeuDrapeaux.css"/>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.1/css/bulma.min.css">

	
</head>
	<body>


		<nav class="navbar">
			<?php require ("vue/client/menuClient.tpl");?>
		</nav>

		
		<h1 style="text-align : center">Guess the countries of the European Union from the flag! </h1>
		<p>To play, drag the country names onto the corresponding flags. It's your turn to play!<a class="button" href='' onclick='chargerJeu();' style="margin-left : 40px">Reset</a></p>
		
		
		<div id="Drop" style="width : 100%%">
		
		</div>

		<div id="Drag" style="width : 100%">

		</div>
		
	</body>
</html>
