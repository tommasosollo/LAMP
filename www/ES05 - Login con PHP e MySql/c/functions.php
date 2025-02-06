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
        die("Connessione fallita: " . mysqli_connect_error());
    }

    // Query per selezionare tutti i record dalla tabella users
    $query = "SELECT UserID FROM utenti where username = '$username' and password = '$password';";
    

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
    header('Location: login.php');
    die();
}

function setLinks()
{

    if (!checkSession()[0]) {
        $links = <<<LINKS
        <a href="register.php">Registrati</a>
        <br>
        <a href="forgot_password.php">Password dimenticata?</a>
        LINKS;
    } else {
        $links = <<<LINKS
        <a href="index.php">Homepage</a>
        <br>
        <a href="logout.php">Logout</a>
        LINKS;
    }
    return $links;
}

function isRegistered($username, $password)
{

    $conn = mysqli_connect(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_NAME);

    if (!$conn) {
        die("Connessione fallita: " . mysqli_connect_error());
    }

    // Query per selezionare tutti i record dalla tabella users
    $query = "SELECT UserID FROM utenti where username = '$username'";
    
    // Esecuzione della query
    $result = mysqli_query($conn, $query);

    if ($result) {
        // Controllo se ci sono record        
        if (mysqli_num_rows($result) > 0) {
            return true; //nome utente gia in uso
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

function registerUser($username, $password)
{
    // Connessione al database
    $conn = mysqli_connect(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_NAME);
    
    if (!$conn) {
        die("Connessione fallita: ". mysqli_connect_error());
    }

    if (isRegistered($username, $password)) {
        return [false, 'Username già in uso'];
    }

    try {
    
        // Query per aggiungere un nuovo record alla tabella users
        $query = "INSERT INTO utenti (username, password) VALUES ('$username', '$password');";
        
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

function eliminaAccount($username) {
    // Connessione al database
    $conn = mysqli_connect(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_NAME);
    
    if (!$conn) {
        die("Connessione fallita: ". mysqli_connect_error());
    }
    
    // Query per eliminare un record dalla tabella users
    $query = "DELETE FROM utenti WHERE username = '$username';";
    
    // Esecuzione della query
    $result = mysqli_query($conn, $query);
    
    if ($result) {
        return [true, 'Account eliminato con successo'];
    } else {
        return [false, 'Errore: '. mysqli_error($conn)];
    }

    mysqli_close($conn);
}

function resetPassword($username, $password) {
    // Connessione al database
    $conn = mysqli_connect(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_NAME);
    
    if (!$conn) {
        die("Connessione fallita: ". mysqli_connect_error());
    }

    if ($_SESSION['username'] != $username) {
        return [false, 'Nome utente non valido'];
    }
    
    // Query per aggiornare la password di un utente
    $query = "UPDATE utenti SET password = '$password' WHERE username = '$username';";
    
    // Esecuzione della query
    $result = mysqli_query($conn, $query);
    
    if ($result) {
        return [true, 'Password ripristinata con successo'];
    } else {
        return [false, 'Errore: '. mysqli_error($conn)];
    }

    mysqli_close($conn);
}

?>