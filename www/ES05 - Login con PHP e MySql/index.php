<?php

define('DB_SERVER', 'localhost');
define('DB_USERNAME', 'ES05_user');
define('DB_PASSWORD', 'password');
define('DB_NAME', 'ES05');

$html = '';


try {
    $conn = mysqli_connect(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_NAME);

    if (!$conn) {
        die("Connessione Fallita: ". mysqli_connect_error());
    }

    $html .= "Connessione Riuscita";
} catch (Exception $e) {
    $html .= "Errore: " . $e->getMessage();
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Test</title>
</head>
<body>
    <h2>Test Connessione DB</h2>
    <?=$html?>
</body>
</html>
