<?php
$t = FALSE;
if($_SERVER['REQUEST_METHOD'] == 'GET' && isset($_GET['nums'])){
    $n = $_GET['nums'];


    $table = "<h3> Quadrato e Cubo dei numeri fino a $n </h3><table><tr><td> N </td><td> quadrato </td><td> cubo </td></tr>";

    for($i = 1; $i <= $n; $i++) {
        $quadro = $i * $i;
        $cubo = $quadro * $i;
        $table = $table . "<tr><td> $i </td><td> $quadro </td><td> $cubo </td></tr>";
    }
    $table = $table . "</table>";
    $t = TRUE;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Calcolo Quadrati e Cubi</title>
    <style>
        body {
            font-family: monospace;
        }

        table {
        border: 1px solid black;
        padding: 0;
        margin-top: 50px;
        }
        
        td {
            width: 20px;
            height: 20px;
            padding: 20px;
            text-align: center;
            border: 1px solid black;
            margin: 0 auto;
        }
    </style>
    
</head>
<body>

<form action="<?php echo $_SERVER["PHP_SELF"]; ?>" method="get">

<?php 
    if(!isset($_GET['nums'])) {
        echo '<label for="nums">Scegli un numero:</label>

        <select name="nums">
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
            <option value="6">6</option>
            <option value="7">7</option>
            <option value="8">8</option>
            <option value="9">9</option>
            <option value="10">10</option>
        </select>

        <input type="submit">';
    }
?>

</form>

    <?php if($t) echo $table ?>
</body>
</html>