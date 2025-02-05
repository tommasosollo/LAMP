<?php

require 'functions.php';

session_start();

$user = $_GET['user'];

if ($user) {

    [$delRetval, $delRetmsg] = eliminaAccount($user);

    if ($delRetval) {
        session_destroy();
        header('Location: login.php');
    }
} else {
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
    <h2 id="error-container"><?=$delRetmsg?></h2>
</body>
</html>