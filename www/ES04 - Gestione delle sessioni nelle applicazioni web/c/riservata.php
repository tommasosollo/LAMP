<?php
    require 'loginLib.php';

    session_start();

    [$sessionRetval, $sessionRetmsg] = checkSession();

    if ($sessionRetval == false) {
        $url = 'Location: login.php';
        $url .= '?from='.basename($_SERVER['PHP_SELF']);
        $url .= '&error=' . $sessionRetmsg;
        header($url);
        die();
    }

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
    <title>Pagina Riservata</title>
</head>
<body>
    <?="<h3>Benvenuto " . $_SESSION['username'] . "</h3>"?>

    <a href="index.php">Home page</a>
    <br>
    <a href="logout.php">Logout</a>
</body>
</html>