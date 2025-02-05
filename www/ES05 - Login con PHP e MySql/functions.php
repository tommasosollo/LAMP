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
    if ($username == 'admin' && $password == 'admin') {
        $_SESSION['username'] = $username;
        return [true, 'Login successful'];
    } else {
        return [false, 'Login sbagliato'];
    }
}

function logout()
{
    session_start();
    session_destroy();
    header('Location: login.php');
    die();
}

?>