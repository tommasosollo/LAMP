<?php

/**
 * Controllo se la sessione è stata inizalizziata correttamente
 */
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
}

function setLink()
{
    if (checksession()[0]) {
        $link = "<a href='logout.php'>Logout</a>";
    } else {
        $link = "<a href='login.php'>Login</a>";
    }
    return $link;
}

?>