<?php 
	/*Fonctions-contrôle mettant en place des fonctionnalités pour les inscrits*/
	
	/* Permet d'être dirigé vers l'accueil des inscrits 
	 */
	function accueilC() {
		require_once("modele/clientBD.php");
		require("vue/client/accueilClient.tpl");
	}

	/* Permet au inscrits de se déconnecter et d'être redirigé vers l'accueil des utilisateurs
	 */
	function bye() {
		session_destroy();
		$nexturl = "index.php";
		header("Location:" . $nexturl);
	}

	
	function PLayFlag()
	{
		require("vue/client/PlayFlag.tpl");
	}

	/* Permet de visualiser la carte des capitales européennes
	*/
	function mapCapitals() {
		require("vue/client/carteEuropeCapitales.tpl");
	}

	function FlagsCountries() {
		require("vue/client/FlagsCountries.tpl");
	}

	function GuessCapital() {
		require("vue/client/guessCapital.tpl");
	}

	function GuessCountry() {
		require("vue/client/guessCountry.tpl");
	}

	
?>
	
	