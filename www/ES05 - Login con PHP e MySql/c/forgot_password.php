<?php

require 'functions.php';

session_start();

$msg = '';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $username = $_POST['username'];
    $nuovaPwd = $_POST['nuovaPwd'];
    $ripNuovaPwd = $_POST['ripNuovaPwd'];

    if ($nuovaPwd === $ripNuovaPwd) {
        [$resetRetval, $resetRetmsg] = resetPassword($username, $nuovaPwd);

        $msg = $resetRetmsg;
    } else {
        $msg = 'Le due password non coincidono';
    }

    if ($resetRetval) {
        session_unset();
        header('Location: login.php?error=Password%20reset%20effettuato%20con%20successo');
        die();
    }
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
    <title>Password Dimenticata</title>
</head>
<body>
    <div id="login-container">

        <h2>Password Dimenticata</h2>

        <div id="error-container"><?=$msg?></div>

        <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="POST">
            
            <input type="text" name="username" id="username" placeholder="Username" pattern=".{3,}" required title="Minimo 3 lettere">
            <br>
            
            <input type="password" name="nuovaPwd" id="nuovaPwd" placeholder="Nuova Password" pattern=".{3,}" required title="Minimo 3 lettere">
            <br>
            <input type="password" name="ripNuovaPwd" id="ripNuovaPwd" placeholder="Ripeti Nuova Password" pattern=".{3,}" required title="Minimo 3 lettere">
            <br>

            <input type="submit" value="Reset Password" id="login-button">

            <input type="hidden" name="from" value="<?=$_GET['from'] ?? null?>" > 
        </form>
        <div id="links">
            <a href="index.php">Homepage</a>
        </div>

    </div>


</body>
</html>