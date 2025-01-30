<?php
    require 'loginLib.php';

    session_start();

    checkSession(basename($_SERVER['PHP_SELF']), basename($_SERVER['PHP_SELF']), 'Fare prima il login');

    echo "<h3>Benvenuto " . $_SESSION['username'] . "</h3>";
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pagina Riservata</title>
</head>
<body>
    <a href="index.php">Home page</a>
    <br>
    <a href="logout.php">Logout</a>
</body>
</html>