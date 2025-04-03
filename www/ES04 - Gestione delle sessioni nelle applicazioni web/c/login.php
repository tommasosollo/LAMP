<?php

require 'loginLib.php';

session_start();

checkSession();

login();

if ($_SERVER['REQUEST_METHOD'] == 'GET' && isset($_GET['error'])) {
    echo "<h3 style='color:red'>" . $_GET['error'] . '</h3>';
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


