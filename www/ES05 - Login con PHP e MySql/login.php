<?php

require 'functions.php';

session_start();
$msg = '';

if($_SERVER['REQUEST_METHOD'] == 'POST') {
    $username = $_POST['username'] ?? '';
    $password = $_POST['password'] ?? '';
    
    [$loginRetval, $loginRetmsg] = login_check($username, $password);
    
    $msg = $loginRetmsg;
    
    if($loginRetval) {
        $_SESSION['username'] = $username;    
    }
}




?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
    <title>Document</title>
</head>
<body>
    <div id="login-container">

        <h2>Login</h2>

        <div id="error-container"><?=$msg?></div>

        <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="POST">
            
            <input type="text" name="username" id="username" placeholder="Username">
            <br>
            
            <input type="password" name="password" id="password" placeholder="Password">
            <br>
            <input type="submit" value="Login" id="login-button">

            <input type="hidden" name="from" value="<?=$_GET['from'] ?? null?>" > 
        </form>
        <div id="links">
            <a href="register.php">Registrati</a>
            <br>
            <a href="forgot_password.php">Password dimenticata?</a>
        </div>

    </div>


</body>
</html>