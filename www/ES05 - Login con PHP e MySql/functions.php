<?php

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
    $host = "localhost";
    $username = "ES05_user";
    $password = "password";
    $database = "ES05";

    $conn = mysqli_connect($host, $username, $password, $database);

    if (!$conn) {
        die("Connessione fallita: " . mysqli_connect_error());
    }

    // Query per selezionare tutti i record dalla tabella users
    $query = <<<QUERY
    SELECT UserID
    FROM utenti 
    where username = '$username' and password = '$password';
    QUERY;

    // Esecuzione della query
    $result = mysqli_query($conn, $query);
    if ($result) {
        // Controllo se ci sono record        
        if (mysqli_num_rows($result) > 0) {
            // Ciclo attraverso i risultati
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

?>