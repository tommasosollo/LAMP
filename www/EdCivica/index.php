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

function distanzaEuclidea($a, $b)
{
    $somma = 0;
    for ($i = 0; $i < count($a); $i++) {
        $somma += pow($a[$i] - $b[$i], 2);
    }
    return sqrt($somma);
}

function sigmoid($t)
{
    return 1 / (1 + pow(M_EULER, -$t));
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
        $origin = $item['country_tags'] ?? null;
        $packaging = $item['packaging_tags'] ?? null;

        // Converti i valori da lettere a numeri (per calcolare distanza)
        $ecoScoreMap = ['a' => 1, 'b' => 2, 'c' => 3, 'd' => 4, 'e' => 5];
        $nutriScoreMap = ['a' => 1, 'b' => 2, 'c' => 3, 'd' => 4, 'e' => 5];

        $ecoVal = $ecoScoreMap[strtolower($eco)] ?? null;
        $nutriVal = $nutriScoreMap[strtolower($nutri)] ?? null;

        if ($origin) {
            $parts = explode(':', $origin);
            $origin = strtolower($parts[1] ?? $origin);

            $nameMap = [
                // Italy
                'italie' => 'italy',
                'italien' => 'italy',
                'italia' => 'italy',
                'italy' => 'italy',
                // Spain
                'espagne' => 'spain',
                'spanien' => 'spain',
                'españa' => 'spain',
                'spain' => 'spain',
                // Belgium
                'belgique' => 'belgium',
                'belgien' => 'belgium',
                'belgio' => 'belgium',
                'belgium' => 'belgium',
                // France
                'france' => 'france',
                'francia' => 'france',
                'frankreich' => 'france',
                // Switzerland
                'suisse' => 'switzerland',
                'schweiz' => 'switzerland',
                'svizzera' => 'switzerland',
                'switzerland' => 'switzerland',
                // Poland
                'pologne' => 'poland',
                'polska' => 'poland',
                'polonia' => 'poland',
                'poland' => 'poland',
                // European Union
                'union-europeenne' => 'european-union',
                'unione-europea' => 'european-union',
                'europäische-union' => 'european-union',
                'european-union' => 'european-union',
            ];

            $origin = $nameMap[$origin] ?? $origin;

            $originScoreMap = [
                'italy' => 1,
                'spain' => 2,
                'belgium' => 3,
                'france' => 4,
                'switzerland' => 5,
                'poland' => 6,
                'european-union' => 7,
            ];

            if ($origin && isset($originScoreMap[$origin])) {
                $origin = $originScoreMap[$origin];
            } else {
                $origin = 5;
            }

            $origin = sigmoid($origin) * 5;  // Normalizza l'origine tra 0 e 5
        }

        if ($packaging) {
            $packagingScoreMap = [
                'en:glass' => 1,
                'en:metal' => 2,
                'en:cardboard' => 3,
                'en:plastic' => 4
            ];

            $packagingVal = $packagingScoreMap[$packaging[0]] ?? null;
        } else {
            $packagingVal = 5;
        }

        $vettori[] = [$ecoVal ?? 5, $nutriVal ?? 5, $origin ?? 5, $packagingVal ?? 5];
    }
    // calcolare distanza con vettore utente
    $vettoreUtente = [1, 3, 2, 1];  // esempio di vettore utente
    // 5 = Eco Score A, 2 = Nutri Score B, 2 = Origine, 1 = Packaging

    $distanze = [];
    foreach ($vettori as $index => $vettore) {
        $distanza = distanzaEuclidea($vettoreUtente, $vettore);
        $distanze[$index] = $distanza;
    }

    asort($distanze);  // ordina le distanze in ordine crescente
    $htmlout .= '<h3>Prodotti correlati ordinati per distanza:</h3>';
    $htmlout .= '<ul>';
    foreach ($distanze as $index => $distanza) {
        if (isset($relatedData['products'][$index])) {
            $relatedProduct = $relatedData['products'][$index];
            $htmlout .= '<li>';
            $htmlout .= '<h4>' . $relatedProduct['product_name'] . '</h4>';

            if (!empty($relatedProduct['image_front_small_url'])) {
                $htmlout .= "<img src='" . $relatedProduct['image_front_small_url'] . "'>";
            } else {
                $htmlout .= '<p>(Nessuna immagine disponibile)</p>';
            }

            $eco = $relatedProduct['ecoscore_grade'] ?? 0;
            $htmlout .= '<p>Eco Score: ' . strtoupper($eco) . '</p>';

            $nutri = $relatedProduct['nutriscore_grade'] ?? 0;
            $htmlout .= '<p>Nutri Score: ' . strtoupper($nutri) . '</p>';

            $origin = $relatedProduct['origins_tags'] ?? [];
            $origin = !empty($origin) ? str_replace('fr:', '', $origin[0]) : 'N/A';
            $htmlout .= '<p>Origine: ' . $origin . '</p>';

            $packaging = $relatedProduct['packaging_tags'] ?? [];
            $packaging = !empty($packaging) ? str_replace('en:', '', $packaging[0]) : 'N/A';
            $htmlout .= '<p>Packaging: ' . $packaging . '</p>';

            $htmlout .= '</li>';
        } else {
            $htmlout .= '<li>Prodotto non trovato</li>';
        }
        $htmlout .= '<p>Distanza: ' . $distanza . '</p>';
    }
    $htmlout .= '</ul>';
} else {
    if (isset($_GET['barcode']))
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