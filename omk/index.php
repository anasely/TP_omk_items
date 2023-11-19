<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Affichage des Items</title>
    <style>
        /* Ajoutez votre CSS pour le style ici */
    </style>
</head>
<body>
        <h1>Athlétes :</h1> 

    <div class="container">
        <?php
           
            $api_url = 'http://localhost/omk_thyp_24/omeka-s/api/items';

            // Récupérez les données depuis l'API Omeka S
            $items = file_get_contents($api_url);

            // Décodez les données JSON en tableau PHP
            $items = json_decode($items, true);

            if ($items && is_array($items)) {
                foreach ($items as $item) {
                    echo '<div class="card">';
                    echo '<div class="card-body">';
                    echo '<h5 class="card-title">Titre : ' . $item['dcterms:title'][0]['@value'] . '</h5>';
                    echo '<p class="card-text">Description : ' . $item['dcterms:description'][0]['@value'] . '</p>';

                    // Vérifiez si la propriété "Type" existe et l'affichez si c'est le cas
                    if (isset($item['dcterms:type'])) {
                        echo '<p class="font-monospace">Type : ' . $item['dcterms:type'][0]['@value'] . '</p>';
                    }

                   // Vérifiez si la propriété "Âge" existe et l'affichez si c'est le cas
                    if (isset($item['dcterms:age'])) {
                        echo '<p class="font-monospace">Âge : ' . $item['dcterms:age'][0]['@value'] . '</p>';
                    }
        

                    echo '</div>';
                    echo '</div>';
                }
            } else {
                echo 'Aucun item n\'a été trouvé.';
            }
        ?>
    </div>
</body>
</html>
