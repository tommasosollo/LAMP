<?php
require 'functions.php';

session_start();

if ($_SESSION['username'] != 'admin') {
    header('Location: index.php');
}

try {

    $html_table = selectUsers("Utenti");

} catch (Exception $e) {

    $html_table = 'errore:' . $e->getMessage();
}

mysqli_close($conn);

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
    <title>Users</title>
</head>
<body>
    <?= $html_table ?>
</body>
</html>


