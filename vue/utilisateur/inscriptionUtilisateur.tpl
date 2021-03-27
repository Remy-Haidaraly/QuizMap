<?php
	$nom=htmlspecialchars($nom);
	$mdp=htmlspecialchars($mdp);
	$email=htmlspecialchars($email);
?>

<!doctype html>
<html lang="fr">
    <head>
    <title>Registration</title>
        <link rel="stylesheet" href="./vue/styleCSS/style.Css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.1/css/bulma.min.css">
    </head>

    <body>
    <nav class="navbar">
		<?php require ("vue/utilisateur/menuUtilisateur.tpl");?>
    </nav>
    <section class="hero is-primary">
        <div class="hero-body">
            <div class="container">
                <h1 class="title">Registration</h1>
            </div>
        </div>
    </section>
    <div class="field">
        <h2 class="title">Create an account</h2>
        <form action="index.php?controle=utilisateur&action=inscription" method="post">

        <label class="label">Name</label>
        <input class="input" placeholder="Name" name="nom" 	type="text" value= "<?php echo($nom); ?>" />

        <label class="label">Password</label>
        <input class="input" placeholder="Password" name="mdp"  type="password" value= "<?php echo($mdp) ?>" />
    
        <label class="label">Email</label>
        <input class="input" placeholder="Email" name="email"  type="text" value= "<?php echo($email) ?>" />

            <div class="msg">
                <?php echo "<p class='msg'>" . $msg . "</p>"?>
            </div>
        <input class="button is-primary" type= "submit"  value="Login">
        </form>
    </div>
</body>
</html>
