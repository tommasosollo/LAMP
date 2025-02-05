<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
    <title>Password Dimenticata</title>
</head>
<body>
    <div id="login-container">

        <h2>Password Dimenticata</h2>

        <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="POST">
            
            <input type="text" name="username" id="username" placeholder="Username">
            <br>
            
            <input type="email" name="email" id="email" placeholder="Email">
            <br>
            <input type="submit" value="Invia Email" id="login-button">

            <input type="hidden" name="from" value="<?=$_GET['from'] ?? null?>" > 
        </form>
        <div id="links">
            <a href="register.php">Registrati</a>
        </div>

    </div>


</body>
</html>