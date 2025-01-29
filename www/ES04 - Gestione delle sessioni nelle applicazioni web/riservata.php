<?php
    session_start();
    if(!isset($_SESSION['username'])){
        header("Location: login.php?err=Login non effettuato");
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
    
</body>
</html>