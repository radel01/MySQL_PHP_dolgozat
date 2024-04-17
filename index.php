<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="stilus.css">
    <title>Document</title>
</head>
<body>
    <?php
    $sofor = ["Nagy Tibor", "Szabó Ákos", "Kovács Géza", "Hofi Géza"];
    $varos = ["Nagykanizsa", "Kőszeg", "Tata", "Gárdony"];
    $busz = [random_int(1, 200),random_int(1, 200),random_int(1, 200),random_int(1, 200)];
    $fejlec = ["Név", "Város", "Busz"];

    echo "<table><tr>";
    for ($i=0; $i < count($fejlec); $i++) { 
        echo "<th>$fejlec[$i]</th>";
    }
    echo "</tr>";
    for ($i=0; $i < count($sofor); $i++) { 
        echo "<tr><td>$sofor[$i]</td><td>$varos[$i]</td><td>$busz[$i]</td></tr>";
    }
    echo "</table";
    ?>
    
</body>
</html>