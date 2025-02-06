<?php
require 'functions.php';

session_start();

$user = $_SESSION['username'] ?? '';

// Check if user is already logged in
if(!checkSession()[0]) {
    
    $htmlLinks = <<<HTML
    <div class="clickable-div" onclick="location.href='login.php'" >
        <h2>Pagina di Login</h2>
    </div>
    <div class="clickable-div" onclick="location.href='register.php'" >
        <h2>Pagina di Registrazione</h2>
    </div>
    HTML;
} else {
    $htmlLinks = <<<HTML
    <div class="clickable-div" onclick="location.href='riservata.php'" >
        <h2>Area Riservata</h2>
    </div>
    <div class="clickable-div" onclick="location.href='profile.php'" >
        <h2>Area Profilo</h2>
    </div>
    <div class="clickable-div" onclick="location.href='logout.php'" >
        <h2>Logout</h2>
    </div>
    HTML;
}

?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
    <title>Homepage</title>
</head>
<body>



<div id="container">
    <h1>Homepage</h1>
    <h2>Benvenuto <?=$user?></h2>

    <?=$htmlLinks?>

</div>
</body>
</html>