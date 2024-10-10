<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PHP</title>
    <style>body {font-family: monospace;}</style>
</head>
<body>
    <?php
        echo "(a)";
        echo "<br>";
        for($i = 0; $i < 10; $i++) {
            for($j = 0; $j < $i+1; $j++) {
                echo "*";
            }
            echo "<br>";
        }
        echo "<br>";

        echo "(b)";
        echo "<br>";
        for($i = 0; $i < 10; $i++) {
            for($j = 0; $j < 10-$i; $j++) {
                echo "*";
            }
            echo "<br>";
        }
        echo "<br>";

        echo "(c)";
        echo "<br>";
        for($i = 0; $i < 10; $i++) {
            for($z = 0; $z < $i; $z++) {
                echo "&nbsp";
            }
            for($j = 0; $j < 10-$i; $j++) {
                echo "*";
            }
            echo "<br>";
        }
        echo "<br>";

        echo "(d)";
        echo "<br>";
        for($i = 0; $i < 10; $i++) {
            for($z = 0; $z < 10-$i; $z++) {
                echo "&nbsp";
            }
            for($j = 0; $j < $i; $j++) {
                echo "*";
            }
            echo "<br>";
        }
        echo "<br>";

    ?>
</body>
</html>