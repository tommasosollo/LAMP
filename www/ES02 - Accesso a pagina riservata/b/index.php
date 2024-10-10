<?php
$c = TRUE;
if($_SERVER['REQUEST_METHOD'] == 'POST'){
    $username = $_POST['username'];
    $password = $_POST['password'];

    if ($username == "Mario" && $password == "Rossi") {
        $msg = "<h2>Accesso riuscito</h2>";
        $c = FALSE;
    }
    else {
        $msg = "<h2>Accesso non riuscito</h2>";
        $c = TRUE;
    }
        

        echo $msg;
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
    <?php if($c) echo "<h4>Inserisci credenziali per l'accesso</h4>"; ?>
    <br>

    <form action="<?php echo $_SERVER["PHP_SELF"]; ?>" method="post">
    <?php
    if($c) {
        
            echo '<label for="username">Username:</label>
            <input type="text" name="username" required>
            <br>
            <label for="password">Password:</label>
            <input type="password" name="password" required>
            <br>
            <input type="submit" value="Invia">';
    }
    ?>
    </form>
</body>
</html>