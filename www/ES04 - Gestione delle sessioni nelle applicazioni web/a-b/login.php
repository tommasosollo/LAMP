<?php
session_start();
if (isset($_SESSION['username'])) {
    header('Location: index.php');
    die();
}

if (isset($_GET['error'])) {
    $err_msg = "<h3 style='color:red'>" . $_GET['error'] . '</h3>';
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $username = $_POST['username'];
    $password = $_POST['password'];
    if ($username == 'admin' && $password == 'admin') {

        $_SESSION['username'] = $username;
        
        $url = 'Location: ';
        $url .= $_POST['from'] == null ? 'index.php' : $_POST['from'];

        header($url);
        die();

    } else {
        $err_msg = "<h3 style='color:red'>username o pasword sbagliati</h3>";
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
    <?=$err_msg?>

    <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="POST">
        <label for="username">Username</label>
        <input type="text" name="username" id="username">
        <br>
        <label for="password">Password</label>
        <input type="password" name="password" id="password">
        <br>
        <input type="submit" value="Login">

        <input type="hidden" name="from" value="<?=$_GET['from'] ?? null ?>" >
    </form>
</body>
</html>


