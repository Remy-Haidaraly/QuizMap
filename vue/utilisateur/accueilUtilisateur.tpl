<html>
    <head>
        <meta charset="utf-8">
        <title>Home page</title>
        <link rel="stylesheet" href="./vue/styleCSS/style.Css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.1/css/bulma.min.css">

        <link rel="stylesheet" href="https://unpkg.com/leaflet@1.6.0/dist/leaflet.css" integrity="sha512-xwE/Az9zrjBIphAcBb3F6JVqxf46+CDLwfLMHloNu6KEQCAWi6HcDUbeOfBIptF7tcCzusKFjFw2yuvEpDL9wQ==" crossorigin=""/>

        <script src="https://unpkg.com/leaflet@1.6.0/dist/leaflet.js" integrity="sha512-gZwIG9x3wUXg2hdXF6+rVkLF/0Vi9U8D2Ntg4Ga5I5BZpVkVxlJWbSQtXPSiUTtC0TjtGOmxa1AJPuV0CPthew==" crossorigin=""></script>

        <script type="text/javascript" src="./vue/js/scriptCarteModeLibre.js"></script>
    </head>
    <body onload="initialize()">

    <nav class="navbar">
        <?php require ("vue/utilisateur/menuUtilisateur.tpl");?>
    </nav>

    <section class="hero is-primary">
        <div class="hero-body">
            <div class="container">
                <h1 class="title"> Welcome </h1>
                <h1 class="subtitle"> Not yet registered ? Hurry up ! </h2>
            </div>
        </div>
    </section>
    <div id="map" style="width:100%; height:74%"></div>

    </body>
</html>