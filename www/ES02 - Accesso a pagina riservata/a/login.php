<?php

$username = $_POST['username'];
$password = $_POST['password'];

if ($username == "Mario" && $password == "Rossi") 
    $msg = "<h2>Accesso riuscito</h2>";
else
    $msg = "<h2>Accesso non riuscito</h2>";

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Accesso</title>
</head>
<body>
    <?php echo $msg ?>
</body>
</html>