<?php
    session_start();
    if(isset($_SESSION['username'])){
        header('Location: restricted_page.php');
        die();
    }

    if($_SERVER["REQUEST_METHOD"] == "POST"){
        $username = $_POST["username"];
        $password = $_POST["password"];
        if($username == "admin" && $password == "admin"){
            $_SESSION['username'] = $username;
            header('Location: index.php');
            die();
        }
        else{
            echo "<h3 style='color:red'>username o pasword sbagliati</h3>";
        }
    }

    if($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['err'])){
        echo "<h3 style='color:red'>".$_GET['err']."</h3>";
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
    <form action="<?php echo $_SERVER["PHP_SELF"]; ?>" method="POST">
        <label for="username">Username</label>
        <input type="text" name="username" id="username">
        <label for="password">Password</label>
        <input type="password" name="password" id="password">
        <input type="submit" value="Login">
    </form>
</body>
</html>