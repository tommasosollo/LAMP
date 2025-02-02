<?php
session_start();


if($_SERVER['REQUEST_METHOD'] == 'GET') {
    $_SESSION['tentativi'] = 5;
    $_SESSION['timestamp'] = null;
}

require 'loginLib.php';

[$sessionRetval, $sessionRetmsg] = checkSession();

if($sessionRetval) {
    $link = 'Location: ';
    $link .= $_GET['from'] ?? 'index.php';

    header($link);
    die();
}

$err_msg = $_GET['error'] ?? '';

if($_SERVER['REQUEST_METHOD'] == 'POST' AND (!$_SESSION['timestamp'] OR $_SESSION['timestamp'] + 60 < $_SERVER['REQUEST_TIME'])) {

    $username = $_POST['username'] ?? '';
    $password = $_POST['password'] ?? '';

    [$retval, $retmsg] = login_check($username, $password);

    if($retval) {
        session_unset();

        $_SESSION['username'] = $username;

        $link = 'Location: ';
        $link .= $_POST['from'] != null ? $_POST['from'] : 'index.php';

        header($link);

        die();
    }
    else {
        $err_msg = $retmsg;
        $_SESSION['tentativi']--;
        $err_msg .= '. Tentativi rimasti: '.$_SESSION['tentativi'];
        if($_SESSION['tentativi'] == 0) {
            $err_msg = 'Tentativi esauriti, account bloccato per 1 minuto';
            $_SESSION['timestamp'] = $_SERVER['REQUEST_TIME'];
        }
    }
    
}
else if($_SESSION['timestamp']) {

    if($_SESSION['timestamp'] + 60 < $_SERVER['REQUEST_TIME']) {
        $_SESSION['tentativi'] = 5;
        $_SESSION['timestamp'] = null;
    }
    else $err_msg = 'Account Bloccato. Riprova tra ' . $_SESSION['timestamp'] + 60 - $_SERVER['REQUEST_TIME'] . " secondi";

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

        <div id="error-container"><?=$err_msg?></div>

        <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="POST">
            
            <input type="text" name="username" id="username" placeholder="Username">
            <br>
            
            <input type="password" name="password" id="password" placeholder="Password">
            <br>
            <input type="submit" value="Login" id="login-button">

            <input type="hidden" name="from" value="<?=$_GET['from'] ?? null?>" > 
        </form>

    </div>
</body>
</html>


