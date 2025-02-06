<?php

// Costanti per la connessione al database
define('DB_SERVER', 'localhost');
define('DB_USERNAME', 'ES05_user');
define('DB_PASSWORD', 'password');
define('DB_NAME', 'ES05');

$html_out = '';

try {
    // Connessione al database
    $conn = mysqli_connect(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_NAME);

    // Verifica della connessione
    if (!$conn) {
        // die("Connessione fallita: " . mysqli_connect_error());
        $html_out = 'Attenzione! Connessione al database fallita.' . mysqli_connect_error();
    }
    $html_out = 'Connessione al database riuscita.';
    // ... successivamente eseguire le query qui ...

    // Chiusura della connessione
    mysqli_close($conn);
} catch (Exception $e) {
    $html_out = "Attenzione! Si è verificata un'eccezione. " . $e->getMessage();
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Test Connessione Database</title>
</head>
<body>
    <h1>Test Connessione Database</h1>
    <h3><?= $html_out ?></h3>
</body>
</html>