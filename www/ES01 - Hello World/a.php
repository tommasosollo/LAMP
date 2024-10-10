<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PHP</title>
</head>
<body>
    <?php
        echo '<table border="1">';
        for($i=1; $i<11; $i++) {
            echo "<tr>";
            for($j=1; $j<11; $j++) {
                $b = $i*$j;
                echo "<td>$b</td>";
            }    
            echo "</tr>";
        }
    ?>
</body>
</html>