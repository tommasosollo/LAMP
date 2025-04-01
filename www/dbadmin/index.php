<?php 
//http://204.216.213.176/inf3myphp/dbadmin/show_table_ordered_page.php 

//recupero dati querystring
$tab = $_GET["tab"] ?? "";
$col = $_GET["col"] ?? "";
$srt = $_GET["srt"] ?? "ASC";
$new_srt = $srt=="ASC" ? "DESC" : "ASC";

// Impostazioni per la paginazione
$per_page = $_GET["per_page"] ?? 10;
$page = isset($_GET['page']) ? $_GET['page'] : 1;
$start_from = ($page - 1) * $per_page;

// Definizione delle costanti per la connessione al database 
define('DB_SERVER', 'localhost'); //getenv('DB_HOST')
define('DB_NAME', 'gestione_voli');
define('DB_USER', 'dbadmin'); //TODO: Errore!: SQLSTATE[HY000] [1044] Access denied for user 'lamp'@'%' to database 'gestione_voli'
define('DB_PASSWORD', 'lamp');

$dbconn;

function open_db(&$pdo) {
    $host = '127.0.0.1';
    $port = 3306;
    $dbname = 'gestione_voli';
    $username = 'dbadmin';
    $password = 'lamp';

    try {
        $dsn = "mysql:host=$host;port=$port;dbname=$dbname;charset=utf8";
        //$pdo = new PDO($dsn, $username, $password);
        $pdo = new PDO("mysql:host=".DB_SERVER.";port=3306;dbname=".DB_NAME, DB_USER, DB_PASSWORD);
    } catch (PDOException $e) {
        print "Errore!: " . $e->getMessage() . "<br/>";
        die();
    }
}

function close_db(&$pdo) {
    // Chiusura della connessione al database
    $pdo = null;
}
  
function show_table(&$pdo, $dbtable) {
    global $new_srt, $srt, $col, $tab;
    global $start_from, $per_page, $page;

    //Creazione ed esecuzione della query
    if($col == "" || $tab != $dbtable) {
        $stmt = $pdo->prepare("SELECT * FROM $dbtable LIMIT :start_from, :per_page"); //TODO limitare i record
    } else {
        $stmt = $pdo->prepare("SELECT * FROM $dbtable ORDER BY ".$col." ".$srt." LIMIT :start_from, :per_page");
    }
   
    try {
        // Query per selezionare i dati
        $stmt->bindParam(':start_from', $start_from, PDO::PARAM_INT);
        $stmt->bindParam(':per_page', $per_page, PDO::PARAM_INT);
        $stmt->execute();

        // Stampa l'intestazione della tabella
        echo "<table id=\"tb_$dbtable\">";
        echo "<thead><tr>";
        for ($i = 0; $i < $stmt->columnCount(); $i++) {
            $meta = $stmt->getColumnMeta($i);
            $href="?tab=".$dbtable."&col=".$meta['name']."&srt=".$new_srt;
            echo "<th><a href=\"".$href."\">" . $meta['name'] . "</a></th>";
        }
        echo "</tr></thead>";

        // Stampa i dati della tabella
        while ($row = $stmt->fetch(PDO::FETCH_NUM)) {
            echo "<tr>";
            for ($i = 0; $i < count($row); $i++) {
                echo "<td>" . $row[$i] . "</td>";
            }
            echo "</tr>";
        }
        echo "</table>";

        // Pulsanti per accedere ai gruppi di record successivi
        $stmt = $pdo->prepare("SELECT COUNT(*) AS total_rows FROM $dbtable");
        $stmt->execute();
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        $total_pages = ceil($row['total_rows'] / $per_page);

        // Build the pagination links
        if ($page > 1) {
            echo '<a href="?page='.($page - 1).'">Indietro</a> ';
        }
        for ($i = 1; $i <= $total_pages; $i++) {
            echo '<a href="?page='.$i.'">'.$i.'</a> ';
        }
        if ($page < $total_pages) {
            echo '<a href="?page='.($page + 1).'">Avanti</a>';
        }

        // Build the select box for choosing the number of records per page
        $optionsArray = [10, 25, 50, 100, 'ALL'];
        $options = '';
        foreach ($optionsArray as $option) {
            $selected = "";
            if($option == $per_page){
                $selected = "selected";
            }
            $options .= "<option value='$option' $selected>$option</option>";
        }
        
        // Output the select box for choosing the number of records per page
        echo "<form method='GET'>";
        echo "  <select name='per_page' onchange='this.form.submit()'>$options</select>";
        echo "</form>";
        
    } catch (PDOException $e) {
        print "Error!: " . $e->getMessage() . "<br/>";
        die();
    }
}
?>
<html>
<head>
    <style>
        table, th, td {border: 1px solid black; border-collapse: collapse; padding: 5px;}
        #tb_aeroporti th {background-color: #DE639A;}
        #tb_aeroporti tr:nth-child(even) {background-color: #F7B2B7;}
        #tb_aerei {width: 100%; background-color: #b5e48c;}
        #tb_aerei th {background-color: #1a759f;}
    </style>
</head>
<body>
    <?= open_db($dbconn); ?>
    <?= show_table($dbconn, 'aerei'); ?>
    <br />
    <?= show_table($dbconn, 'aeroporti'); ?>
    <br />
    <?= show_table($dbconn, 'voli'); ?>
    <!--<?= show_table($dbconn, 'voli'); ?>-->
    <?= close_db($dbconn); ?>
</body>
</html>