<?php

function getProduct($barcode)
{
    $url = "https://world.openfoodfacts.org/api/v0/product/$barcode.json";

    $response = file_get_contents($url);
    $data = json_decode($response, true);

    if ($data && $data['status'] == 1) {
        return [true, $data];
    } else {
        return [false, $data];
    }
}

function distanzaEuclidea($a, $b) {
    $somma = 0;
    for ($i = 0; $i < count($a); $i++) {
        $somma += pow($a[$i] - $b[$i], 2);
    }
    return sqrt($somma);
}


$htmlout = '';

if (isset($_GET['barcode'])) {
    [$retval, $data] = getProduct($_GET['barcode']);

    if ($retval) {
        $htmlout .= '<h1>' . $data['product']['product_name'] . '</h1>';
        $htmlout .= "<img src='" . $data['product']['image_front_small_url'] . "'>";
        $htmlout .= '<h3>Ingredienti: </h3>';
        $htmlout .= '<p>' . $data['product']['ingredients_text'] . '</p>';
        $htmlout .= '<h3>Eco Score: </h3>';
        $htmlout .= '<p>' . strtoupper($data['product']['ecoscore_grade']) . '</p>';
    } else
        $htmlout = '<h2>Prodotto non trovato</h2>';
}

$categories = $data['product']['categories_tags'] ?? [];
$firstCategory = $categories[4] ?? null;  // chocolate-spreads

$vettori = [];

if ($firstCategory) {
    $category = str_replace('en:', '', $firstCategory);

    // 3. Trova prodotti nella stessa categoria
    $relatedJson = file_get_contents("https://world.openfoodfacts.org/category/$category.json");
    $relatedData = json_decode($relatedJson, true);

    $htmlout .= "<h2>Prodotti correlati nella categoria: $category</h2>";
    $vettori = [];

    foreach ($relatedData['products'] as $item) {
        $eco = $item['ecoscore_grade'] ?? null;
        $nutri = $item['nutriscore_grade'] ?? null;
        $price = $item['price'] ?? null; // probabilmente sarà NULL, Open Food Facts non lo ha

        // Converti i valori da lettere a numeri (per calcolare distanza)
        $ecoScoreMap = ['a' => 5, 'b' => 4, 'c' => 3, 'd' => 2, 'e' => 1];
        $nutriScoreMap = ['a' => 5, 'b' => 4, 'c' => 3, 'd' => 2, 'e' => 1];

        $ecoVal = $ecoScoreMap[strtolower($eco)] ?? null;
        $nutriVal = $nutriScoreMap[strtolower($nutri)] ?? null;

        // Salta se mancano dati
        if ($ecoVal !== null && $nutriVal !== null) {
            $vettori[] = [$ecoVal, $nutriVal, $price ?? 0];
        }
    }

    //calcolare distanza con vettore utente

} else {
    $htmlout .= 'Categoria non trovata.';
}

// una volta trovati i prodotti correlati, calcolare la distanza tra essi e il vettore dell'utente in base a:
// prezzo, eco-score, nutriscore
/**
 * {
* "product_name": "Nutella",
 * "ecoscore_grade": "e",
 * "nutriscore_grade": "e",
 * "labels_tags": ["palm-oil", "non-vegan", "non-vegetarian"],
 * "ingredients": [...],
 * "origins_tags": ["fr:italie"],
 * "packaging_tags": ["en:glass", "en:plastic"],
 * "brands_tags": ["ferrero"]
 *  }
 */

?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
    <script src="https://unpkg.com/html5-qrcode" type="text/javascript"></script>
    <title>Educazione Civica</title>
</head>
<body>
    <div id="reader" style="width:300px;"></div>
    <div id="container">
        <form action="">
            <input type="text" name="barcode" id="result" placeholder="Inserisci il codice a barre">
            <button type="submit">Cerca</button>
        </form>

        <?= $htmlout ?>

    </div>
</body>
</html>

<script>
        function onScanSuccess(decodedText, decodedResult) {
            // Mostra il risultato
            document.getElementById('result').value = decodedText;
        }

        const html5QrcodeScanner = new Html5QrcodeScanner(
            "reader", { fps: 10, qrbox: 250 });
        html5QrcodeScanner.render(onScanSuccess);
</script>