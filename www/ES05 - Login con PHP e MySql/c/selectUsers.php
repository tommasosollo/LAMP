<?php

session_start();

if ($_SESSION['username'] != 'admin') {
    header('Location: index.php');
}

define('DB_SERVER', 'localhost');
define('DB_USERNAME', 'ES05_user');
define('DB_PASSWORD', 'password');
define('DB_NAME', 'ES05');

try {
    $conn = mysqli_connect(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_NAME);

    $query = 'SELECT UserID, Username, Nome, Cognome from Utenti';
    $result = mysqli_query($conn, $query);

    if ($result) {
        $html_out = '<table>';
        while ($row = mysqli_fetch_assoc($result)) {
            $html_out .= '<tr>';
            foreach ($row as $column) {
                $html_out .= "<td>$column</td>";
            }
            $html_out .= '<tr>';
        }
        $html_out .= '</table>';
    }
} catch (Exception $e) {
    $html_out = 'errore:' . $e->getMessage();
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?= $html_out ?>
</body>
</html>