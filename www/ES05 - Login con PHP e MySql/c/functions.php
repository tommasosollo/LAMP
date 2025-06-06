<?php

define('DB_SERVER', 'localhost');
define('DB_USERNAME', 'ES05_user');
define('DB_PASSWORD', 'password');
define('DB_NAME', 'ES05');

function checkSession()
{
    if (isset($_SESSION['username'])) {
        return [true, 'Sessione attiva'];
    } else {
        return [false, 'Sessione non attiva'];
    }
}


function login_check($username, $password)
{
    // Connessione al database
    $conn = mysqli_connect(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_NAME);
    
    if (!$conn) {
        throw new Exception('errore connessione database');
    }
    

    // Query per selezionare tutti i record dalla tabella users
    $query = "SELECT UserID FROM Utenti where Username = '$username' and Password = SHA2('$password', 256);";

    // Esecuzione della query
    $result = mysqli_query($conn, $query);

    if ($result) {
        // Controllo se ci sono record
        if (mysqli_num_rows($result) > 0) {
            return [true, 'Login avvenuto con successo'];
        } else {
            return [false, 'Login sbagliato'];
        }

        // Liberazione dei risultati
        mysqli_free_result($result);
    } else {
        return [false, 'Errore: ' . mysqli_error($conn)];
    }

    // Chiusura della connessione
    mysqli_close($conn);
}

function logout()
{
    session_start();
    session_destroy();
    //setcookie('username', '', time() - 3600, '/');
    header('Location: login.php');
}


function isRegistered($username, $password)
{
    $conn = mysqli_connect(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_NAME);

    if (!$conn) {
        die('Connessione fallita: ' . mysqli_connect_error());
    }

    // Query per selezionare tutti i record dalla tabella users
    $query = "SELECT UserID FROM Utenti where Username = '$username'";

    // Esecuzione della query
    $result = mysqli_query($conn, $query);

    if ($result) {
        // Controllo se ci sono record
        if (mysqli_num_rows($result) > 0) {
            return true;  // nome utente gia in uso
        } else {
            return false;
        }

        // Liberazione dei risultati
        mysqli_free_result($result);
    } else {
        die('Errore: ' . mysqli_error($conn));
    }

    // Chiusura della connessione
    mysqli_close($conn);
}

function registerUser($username, $password, $email, $nome, $cognome)
{
    // Connessione al database
    $conn = mysqli_connect(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_NAME);

    if (!$conn) {
        die('Connessione fallita: ' . mysqli_connect_error());
    }

    if (isRegistered($username, $password)) {
        return [false, 'Username già in uso'];
    }

    try {
        // Query per aggiungere un nuovo record alla tabella users

        $query = "INSERT INTO Utenti (Username, Password, Email, Nome, Cognome) VALUES ('$username', SHA2('$password', 256), '$email', '$nome', '$cognome');";

        // Esecuzione della query
        $result = mysqli_query($conn, $query);

        if ($result) {
            return [true, 'Registrazione avvenuta con successo'];
        } else {
            return [false, 'Errore: ' . mysqli_error($conn)];
        }
    } catch (\Exception $e) {
        return [false, 'Errore: ' . $e->getMessage()];
    }

    mysqli_close($conn);
}

function eliminaAccount($username)
{
    // Connessione al database
    $conn = mysqli_connect(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_NAME);

    if (!$conn) {
        die('Connessione fallita: ' . mysqli_connect_error());
    }

    // Query per eliminare un record dalla tabella users
    $query = "DELETE FROM Utenti WHERE Username = '$username';";

    // Esecuzione della query
    $result = mysqli_query($conn, $query);

    if ($result) {
        return [true, 'Account eliminato con successo'];
    } else {
        return [false, 'Errore: ' . mysqli_error($conn)];
    }

    mysqli_close($conn);
}

function resetPassword($email, $password)
{
    // Connessione al database
    $conn = mysqli_connect(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_NAME);

    if (!$conn) {
        die('Connessione fallita: ' . mysqli_connect_error());
    }

    if ($_SESSION['username'] != $username) {
        return [false, 'Nome utente non valido'];
    }

    // Query per aggiornare la password di un utente
    $query = "UPDATE Utenti SET password = SHA2('$password', 256) WHERE Email = '$email';";

    // Esecuzione della query
    $result = mysqli_query($conn, $query);

    if ($result) {
        return [true, 'Password ripristinata con successo'];
    } else {
        return [false, 'Errore: ' . mysqli_error($conn)];
    }

    mysqli_close($conn);
}

function selectUsers($table) 
{
    $conn = mysqli_connect(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_NAME);

    if (!$conn) {
        throw new Exception('Connessione fallita: ' . mysqli_connect_error());
    }

    $query = 'SELECT UserID, Username, Nome, Cognome from ' .$table;

    $result = mysqli_query($conn, $query);

    if(!$result) throw new Exception("Errore nella query");
    
    
    $html_out = '<table>';

    $fields = mysqli_fetch_fields($result);

    $html_out .= '<theader>';
    foreach ($fields as $field) {
        $html_out .= "<th>$field->name</th>";
    }

    while ($row = mysqli_fetch_assoc($result)) {
        $html_out .= '<tr>';
        foreach ($row as $column) {
            $html_out .= "<td>$column</td>";
        }
        $html_out .= '</tr>';
    }
    $html_out .= '</table>';

    return $html_out;
}

?>