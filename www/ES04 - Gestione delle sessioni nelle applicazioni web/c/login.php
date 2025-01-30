<?php
session_start();
require 'loginLib.php';
//checkSession();

$username = $_POST['username'] ?? '';
$password = $_POST['password'] ?? '';
$err_msg = $_GET['error'] ?? '';


[$retval, $retmsg] = login_check($username, $password );

?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
</head>
<body>

    <h3 style='color:red'><?=err_msg?></h3>

    <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="POST">
        <label for="username">Username</label>
        <input type="text" name="username" id="username">
        <br>
        <label for="password">Password</label>
        <input type="password" name="password" id="password">
        <br>
        <input type="submit" value="Login">

        <input type="hidden" name="from" value="<?php echo $_GET['from']; ?>" >
    </form>
</body>
</html>


