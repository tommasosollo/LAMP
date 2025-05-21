<?php
$barcode = "3017620429484"; // Nutella

// 1. Prendi info del prodotto
$productJson = file_get_contents("https://world.openfoodfacts.org/api/v0/product/$barcode.json");
$productData = json_decode($productJson, true);

// 2. Estrai una categoria (es: chocolate-spreads)
$categories = $productData['product']['categories_tags'] ?? [];
$firstCategory = $categories[4] ?? null; // chocolate-spreads

if ($firstCategory) {
    $category = str_replace("en:", "", $firstCategory);

    // 3. Trova prodotti nella stessa categoria
    $relatedJson = file_get_contents("https://world.openfoodfacts.org/category/$category.json");
    $relatedData = json_decode($relatedJson, true);

    echo "<h2>Prodotti correlati nella categoria: $category</h2>";
    foreach ($relatedData['products'] as $item) {
        echo "<p><strong>" . htmlspecialchars($item['product_name'] ?? 'Senza nome') . "</strong></p>";
    }
} else {
    echo "Categoria non trovata.";
}
?>