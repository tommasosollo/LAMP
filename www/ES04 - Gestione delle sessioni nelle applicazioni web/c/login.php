<?php
session_start();

require 'loginLib.php';

[$sessionRetval, $sessionRetmsg] = checkSession();

if($sessionRetval) {
    $link = 'Location: ';
    $link .= $_GET['from'] ?? 'index.php';

    header($link);
    die();
}

$err_msg = $_GET['error'] ?? '';

if($_SERVER['REQUEST_METHOD'] == 'POST') {

    $username = $_POST['username'] ?? '';
    $password = $_POST['password'] ?? '';

    [$retval, $retmsg] = login_check($username, $password);

    if($retval) {
        $_SESSION['username'] = $username;

        $link = 'Location: ';
        $link .= $_POST['from'] != null ? $_POST['from'] : 'index.php';

        header($link);
        die();
    }
    else {
        $err_msg = $retmsg;
    }
}


?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
</head>
<body>

    <h3 style='color:red'><?=$err_msg?></h3>

    <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="POST">
        <label for="username">Username</label>
        <input type="text" name="username" id="username">
        <br>
        <label for="password">Password</label>
        <input type="password" name="password" id="password">
        <br>
        <input type="submit" value="Login">

        <input type="hidden" name="from" value="<?=$_GET['from'] ?? null?>" > 
    </form>
</body>
</html>


