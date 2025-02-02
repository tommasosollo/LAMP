<?php
    session_start();

    require 'loginLib.php';

    $link = setLink();

?>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
    <title>Pagina di Benvenuto</title>
</head>
<body>
    <h1>Benvenuto!</h1>
    <a href="riservata.php">Accedi alla pagina riservata</a>
    <br>
    <?php echo $link; ?>
</body>
</html>