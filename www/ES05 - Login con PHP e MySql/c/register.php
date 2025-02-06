<?php
require 'functions.php';

session_start();

$msg = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST['username'];
    $password = $_POST['password'];
    $nome = $_POST['nome'];
    $cognome = $_POST['cognome'];
    $email = $_POST['email'];
    
    [$regRetval, $regRetmsg] = registerUser($username, $password, $email, $nome, $cognome);

    $msg = $regRetmsg;

    if ($regRetval) {
        $_SESSION['username'] = $username;
        header('Location: index.php');
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
    <title>Registrati</title>
</head>
<body>
    <div id="login-container">

        <h2>Sign Up</h2>

        <div id="error-container"><?=$msg?></div>

        <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="POST">
            
            <input type="text" name="nome" placeholder="Nome" pattern="[a-zA-Z]+" required >
            <br>

            <input type="text" name="cognome" placeholder="Cognome" pattern="[a-zA-Z'\s]+" required>
            <br>

            <input type="email" name="email" placeholder="Email" required>
            <br>


            <input type="text" name="username" id="username" placeholder="Username" pattern=".{3,}" required title="Minimo 3 lettere">
            <br>
            
            <input type="password" name="password" id="password" placeholder="Password" pattern=".{3,}" required title="Minimo 3 lettere">
            <br>
            <input type="submit" value="Registrati" id="login-button">

        </form>
        <div id="links">
            <a href="login.php">Accedi</a>
        </div>

    </div>


</body>
</html>