<?php

require 'functions.php';

session_start();

if(!checkSession()[0]) {
    header('Location: login.php?from=' . $_SERVER['PHP_SELF']);
    exit;
}

$user = $_SESSION['username'];



?>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
    <title>Area Riservata</title>
</head>
<body>
    <div id="container">

        <h2>Benvenuto <?=$user?> nell'area riservata del sito</h2>

        <div class="clickable-div" onclick="location.href='index.php'" >
        <h2>Homepage</h2>
        </div>

        <div class="clickable-div" onclick="location.href='profile.php'" >
        <h2>Area Profilo</h2>
        </div>

        <div class="clickable-div" onclick="location.href='logout.php'" >
        <h2>Logout</h2>
        </div>

    </div>
</body>
</html>