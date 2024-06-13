<?php 
include 'connect.php'; 

$picture = $_FILES['slika']['name']; 
$title = $_POST['naslov']; 
$about = $_POST['opis']; 
$content = $_POST['tekst']; 
$category = $_POST['kategorija']; 
$date = date('Y-m-d H:i:s');

if(isset($_POST['arhiva'])){ 
    $archive = 1; 
} else { 
    $archive = 0; 
} 

$target_dir = 'img/' . $picture; 
move_uploaded_file($_FILES["slika"]["tmp_name"], $target_dir); 

$query = "INSERT INTO vijesti (naslov, opis, tekst, kategorija, arhiva, slika, datum) 
          VALUES ('$title', '$about', '$content', '$category', '$archive', '$picture', '$date')"; 

$result = mysqli_query($dbc, $query) or die('Error querying database: ' . mysqli_error($dbc)); 
mysqli_close($dbc); 

header('Location: index.php');
exit();
?>