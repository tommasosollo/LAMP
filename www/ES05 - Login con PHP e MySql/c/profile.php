<?php

require 'functions.php';

session_start();

if (!checkSession()[0]) {
    header('Location: login.php');
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
    <title>Area Profilo</title>
</head>
<body>
    <div id="container">

        <h2>Benvenuto <?= $user ?> nell'area profilo del sito</h2>

        <div class="clickable-div" onclick="location.href='index.php'" >
        <h2>Homepage</h2>
        </div>

        <div class="clickable-div" onclick="location.href='riservata.php'" >
        <h2>Area Riservata</h2>
        </div>

        <div class="clickable-div" onclick="location.href='logout.php'" >
        <h2>Logout</h2>
        </div>

        <div class="clickable-div" onclick="location.href='forgot_password.php'" >
        <h2>Modifica Password</h2>
        </div>

        <div class="clickable-div" onclick="location.href='elimina_account.php'" >
        <h2>Elimina Account</h2>
        </div>

    </div>
</body>
</html>