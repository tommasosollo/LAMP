<?php
    session_start();
    if(!isset($_SESSION['username'])){
        $url = 'login.php?error=Fare prima il login&from=';
        $url .= basename($_SERVER['PHP_SELF']);
        header("Location: $url");
        die();
    }
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