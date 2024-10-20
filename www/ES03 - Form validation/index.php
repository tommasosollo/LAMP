<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ES03 - Form validation</title>
</head>
<body>
    
    <form action="validation.php" method="post">
        <label for="nome">Nome*:</label>
        <input type="text" name="nome" pattern="[a-zA-Z]+" required>
        <br>
        <label for="cognome">Cognome*:</label>
        <input type="text" name="cognome" pattern="[a-zA-Z']+" required>
        <br>
        <label for="data">Data di nascita*:</label>
        <input type="date" name="data" required>
        <br>
        <label for="CF">Codice fiscale</label>
        <input type="text" name="cf" pattern="[a-zA-Z0-9]{16}" style="text-transform:uppercase">
        <br>
        <label for="email">Email*:</label>
        <input type="email" name="email" required>
        <br>
        <label for="tel">Numero cellulare (con prefisso):</label>
        <input type="tel" name="tel" pattern="[0-9]{12}">
        <br>
        <h3>Indirizzo</h3>
        <br>
        <label for="via">Via*:</label>
        <input type="text" name="via" pattern="[a-zA-Z']+" required>
        <label for="nCivico">N. Civico*:</label>
        <input type="text" name="nCivico" pattern="[0-9]+" required>
        <br>
        <label for="cap">CAP*:</label>
        <input type="number" name="cap" pattern="[0-9]{5}" required>
        <br>
        <label for="comune">Comune*:</label>
        <input type="text" name="comune" pattern="[a-zA-Z']+" required>
        <br>
        <label for="provincia">Provincia (sigla)*:</label>
        <input type="text" name="provincia" pattern="[a-zA-Z]{2}" style="text-transform:uppercase" required>
        <br>
        <label for="username">Username*:</label>
        <input type="text" name="username" pattern="[a-zA-Z0-9]{3,}" required>
        <br>
        <label for="password">Password*:</label>
        <input type="password" name="password" pattern="{8,}" required>
        
        <br>
        <input type="submit" name="submit">
    </form>

</body>
</html>