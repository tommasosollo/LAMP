<?php
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $nome = trim($_POST['nome']);
    $cognome = trim($_POST['cognome']);
    $dataNascita = trim($_POST['data']);
    $cf = strtoupper(trim($_POST['cf']));
    $email = trim($_POST['email']);
    $tel = trim($_POST['tel']);
    $via = trim($_POST['via']);
    $nCivico = trim($_POST['nCivico']);
    $cap = trim($_POST['cap']);
    $comune = trim($_POST['comune']);
    $provincia = strtoupper(trim($_POST['provincia']));
    $username = trim($_POST['username']);
    $password = trim($_POST['password']);
}

// Validation
$error = '';
if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    $error .= 'Email non valida.<br>';
}
if (strpos($username, $nome) || strpos($username, $cognome)) {
    $error .= 'Username non valido.<br>';
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Validazione</title>
</head>
<body>
    <?php if ($error): ?>
        <div style="color: red;">
            <?php echo $error ?>
        </div>
    <?php else: ?>
        <h2>Dati validati con successo!</h2>
        <ul>
            <li>Nome: <?php echo $nome ?></li>
            <li>Cognome: <?php echo $cognome ?></li>
            <li>Data di nascita: <?php echo $dataNascita ?></li>
            <li>Codice fiscale: <?php echo $cf ?></li>
            <li>Email: <?php echo $email ?></li>
            <li>Numero cellulare: <?php echo $tel ?></li>
            <li>Indirizzo: <?php echo "$via $nCivico, $cap $comune ($provincia)" ?></li>
            <li>Username: <?php echo $username ?></li>
            <li>Password: <?php echo $password ?></li>
    </ul>
    <?php endif; ?>
</body>
</html>