<?php

require 'functions.php';

session_start();

if (!checkSession()[0]) {
    header('Location: index.php');
    exit;
}

[$retval, $retmsg] = eliminaAccount($_SESSION['username']);
if ($retval) {
    session_destroy();
    header('Location: index.php');
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Errore Eliminazione Account</title>
</head>
<body>
    <h2 id="error-container"><?= $delRetmsg ?></h2>
</body>
</html>