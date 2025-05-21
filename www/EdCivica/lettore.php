<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Scanner Codice a Barre</title>
    <script src="https://unpkg.com/html5-qrcode" type="text/javascript"></script>
</head>
<body>
    <h2>Scansiona un codice a barre</h2>
    <div id="reader" style="width:300px;"></div>
    <div id="result"></div>

    <script>
        function onScanSuccess(decodedText, decodedResult) {
            // Mostra il risultato
            document.getElementById('result').innerText = "Codice letto: " + decodedText;
        }

        const html5QrcodeScanner = new Html5QrcodeScanner(
            "reader", { fps: 10, qrbox: 250 });
        html5QrcodeScanner.render(onScanSuccess);
    </script>
</body>
</html>
