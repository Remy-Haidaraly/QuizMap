<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf8" />
        <title>Quiz: Guess this country flag</title>
        <link href="https://fonts.googleapis.com/css2?family=Merriweather:wght@700&family=Montserrat&display=swap" rel="stylesheet">
        <script src="./vue/js/jquery-3.6.0.js"></script>
        <link rel="stylesheet" href="./vue/styleCSS/style.Css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.1/css/bulma.min.css">
        <link href="./vue/styleCSS/stylePlayFlag.css" rel="stylesheet" />
    </head>
    <body>

        <nav class="navbar">
            <?php require ("vue/client/menuClient.tpl");?>
        </nav>

        <div id="question-panel">
            <h4>Guess this flag</h4>
            <small></small>
            <div>
                <img class="img" />
            </div>
            <ul></ul>
        </div>
        <div id="answer-panel">
            <h2></h2>
            <p></p>
            <button>Next question</button>
        </div>
        <div id="end-panel">
            <h2>Game completed!</h2>
            <button id ="replay">Replay ?</button>
            <p></p>
        </div>

        <script src="./vue/js/generateQuestion.js"></script>
        <script src="./vue/js/mainPlayFlag.js"></script>
    </body>
</html>