<?php
    session_start();
    if(isset($_SESSION['username'])){
        $link = "<a href='logout.php'>Logout</a>";
    } else {
        $link = "<a href='login.php'>Login</a>";
    }

?>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pagina di Benvenuto</title>
</head>
<body>
    <h1>Benvenuto!</h1>
    <a href="riservata.php">Accedi alla pagina riservata</a>
    <br>
    <?php echo $link; ?>
</body>
</html>