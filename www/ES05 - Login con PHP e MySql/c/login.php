<?php

require 'functions.php';

session_start();

$tempo_blocco = 60;

if($_SERVER['REQUEST_METHOD'] == 'GET') {
    $_SESSION['tentativi'] = 5;
    $_SESSION['timestamp'] = 0;
    $_SESSION['lastUsername'] = "";
}

$msg = $_GET['error'] ?? '';

if (isset($_SESSION['username'])) {

    header('Location: index.php');
    exit();
}

$username = $_COOKIE['username'] ?? '';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $username = $_POST['username'] ?? '';
    $password = $_POST['password'] ?? '';

    try {
        [$loginRetval, $loginRetmsg] = login_check($username, $password);

        $msg = $loginRetmsg;

        if ($loginRetval) {
            $_SESSION['username'] = $username;

            $link = 'Location: ';
            $link .= $_POST['from'] != null ? $_POST['from'] : 'index.php';

            header($link);
            die();
        }
    } catch (Exception $e) {
        $msg = 'Errore durante il login: ' . $e->getMessage();
    }
    else {
        if($_POST['username']==$_SESSION['lastUsername']) {
            $msg = $loginRetmsg;
            $_SESSION['tentativi']--;
            $msg .= '. Tentativi rimasti: '.$_SESSION['tentativi'];
            if($_SESSION['tentativi'] == 0) {
                $msg = 'Tentativi esauriti, account bloccato per 1 minuto';
                $_SESSION['timestamp'] = $_SERVER['REQUEST_TIME'];
            }
        }
        else {
            $_SESSION['lastUsername'] = $_POST['username'];
            $_SESSION['tentativi'] = 5;
        }
    }

} else if ($_SESSION['timestamp']) {

    if($_SESSION['timestamp'] + $tempo_blocco < $_SERVER['REQUEST_TIME']) {
        $_SESSION['tentativi'] = 5;
        $_SESSION['timestamp'] = null;
    }
    else $msg = 'Account Bloccato. Riprova tra ' . ($_SESSION['timestamp'] + $tempo_blocco - $_SERVER['REQUEST_TIME']) . " secondi";

}

// set links
if (!checkSession()[0]) {
    $links = <<<LINKS
            <a href="register.php">Registrati</a>
            <br>
            <a href="forgot_password.php">Password dimenticata?</a>
        LINKS;
} else {
    $links = <<<LINKS
            <a href="index.php">Homepage</a>
            <br>
            <a href="logout.php">Logout</a>
        LINKS;
}

// set cookies
if (isset($_POST['ricorda'])) {
    setcookie('username', $username, time() + (86400 * 30), '/');
} else {
    setcookie('username', '', time() - 3600, '/');
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
    <title>Login</title>
</head>
<body>
    <div id="login-container">

        <h2>Login</h2>

        <div id="error-container"><?= $msg ?></div>

        <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="POST">
            

        <input type="text" name="username" id="username" placeholder="Username" value = "<?= htmlspecialchars($username) ?>"  pattern=".{3,}" required title="Minimo 3 lettere">
            <br>
            
            <input type="password" name="password" id="password" placeholder="Password" pattern=".{3,}" required title="Minimo 3 lettere">
            <br>
            <input type="checkbox" name="ricorda" style="width: 5%;margin-left: 10%;"> Ricorda Username
            <input type="submit" value="Login" id="login-button">

            <input type="hidden" name="from" value="<?= $_GET['from'] ?? null ?>" > 
        </form>
        <div id="links">
            <?= $links ?>
        </div>

    </div>


</body>
</html>

