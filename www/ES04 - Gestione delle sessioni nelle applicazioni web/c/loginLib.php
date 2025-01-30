<?php

/**
 * Controllo se la sessione è stata inizalizziata corrente
 * e anche ................
 */
function checkSession($from = null, $ifIsSet = 'index.php', $err = null)
{
    if (!isset($_SESSION['username'])) {
        if ('login.php' != baseline($_SERVER[PHP_SELF])) {
            $url = 'Location: login.php';
            if ($from)
                $url .= '?from=' . $from;
            if ($err)
                $url .= '&error=' . $err;
            header($url);
            die();
        }
    } else {
        header('Location: ' . $ifIsSet);
    }
}

function login()
{
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        $username = $_POST['username'];
        $password = $_POST['password'];
        if ($username == 'admin' && $password == 'admin') {
            $_SESSION['username'] = $username;

            $url = 'Location: ';
            $url .= $_POST['from'] ?? 'index.php';

            header($url);
            die();
        } else {
            echo "<h3 style='color:red'>username o pasword sbagliati</h3>";
        }
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

function setLink()
{
    if (isset($_SESSION['username'])) {
        $link = "<a href='logout.php'>Logout</a>";
    } else {
        $link = "<a href='login.php'>Login</a>";
    }
    return $link;
}

?>