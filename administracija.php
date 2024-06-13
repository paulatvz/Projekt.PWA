<?php
session_start();
include 'connect.php'; 

$uspjesnaPrijava = false;
$admin = false;

if (isset($_POST['prijava'])) {
  $prijavaImeKorisnika = $_POST['username'];
  $prijavaLozinkaKorisnika = $_POST['lozinka'];

  $sql = "SELECT korisnicko_ime, lozinka, razina FROM korisnik WHERE korisnicko_ime = ?";
  $stmt = mysqli_stmt_init($dbc);

  if (mysqli_stmt_prepare($stmt, $sql)) {
    mysqli_stmt_bind_param($stmt, 's', $prijavaImeKorisnika);
    mysqli_stmt_execute($stmt);
    mysqli_stmt_store_result($stmt);

    if (mysqli_stmt_num_rows($stmt) > 0) {
      mysqli_stmt_bind_result($stmt, $imeKorisnika, $lozinkaKorisnika, $levelKorisnika);
      mysqli_stmt_fetch($stmt);

      if (password_verify($prijavaLozinkaKorisnika, $lozinkaKorisnika)) {
        $uspjesnaPrijava = true;
        if ($levelKorisnika == 1) {
          $admin = true;
        }

        $_SESSION['username'] = $imeKorisnika;
        $_SESSION['level'] = $levelKorisnika;
      } else {
        $uspjesnaPrijava = false;
      }
    } else {
      $uspjesnaPrijava = false;
    }
  }

  mysqli_stmt_close($stmt);
}

?>

<!DOCTYPE html>
<html lang="hr">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="author" content="Paula Nikolić">
  <title>Unos novih članaka</title>
  <link rel="icon" type="image/png" href="img/logo.png">
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="style.css">
</head>

<body class="d-flex flex-column min-vh-100">
  <div class="wrapper">
    <header>
      <div class="row align-items-center">
        <img src="img/logo.png" alt="Logo">
        <h1>Novosti iz svijeta filmova i serija</h1>
      </div>
      <nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #0E3755;">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
          aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
              <a class="nav-link" href="index.php">Početna <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="kategorija.php?kategorija=filmovi">Filmovi</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="kategorija.php?kategorija=serije">Serije</a>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button"
                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Administracija
              </a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                <a class="dropdown-item" href="prijava.html">Prijava</a>
                <a class="dropdown-item" href="registracija.php">Registracija</a>
              </div>
            </li>
          </ul>
        </div>
      </nav>
    </header>

    <?php
    if ($uspjesnaPrijava && $admin) {
      echo "<a href='unos.html' class='gumb'>Unesite novi članak</a>";
      $query = "SELECT * FROM vijesti";
      $result = mysqli_query($dbc, $query);
      while ($row = mysqli_fetch_array($result)) {
        echo "<div class='forma'>
                    <form action='skripta.php' method='POST' enctype='multipart/form-data'>
                        <label for='naslov'>Naslov vijesti:</label>
      <input type='text' name='naslov' id='naslov' value='" . $row['naslov'] . "'>
      <br><br>
      <label for='kategorija'>Odaberite kategoriju vijesti</label>
      <select name='kategorija' id='kategorija' value='" . $row['kategorija'] . "'>
        <option value='filmovi'" . ($row['kategorija'] == 'filmovi' ? ' selected' : '') . ">Filmovi</option>
        <option value='serije'" . ($row['kategorija'] == 'serije' ? ' selected' : '') . ">Serije</option>
      </select>
      <br><br>
      <label for='opis'>Kratki sažetak vijesti:</label>
      <br>
      <textarea name='opis' id='opis' cols='40' rows='15'>" . $row['opis'] . "</textarea>
      <br><br>
      <label for='tekst'>Sadržaj vijesti:</label>
      <br>
      <textarea name='tekst' id='tekst' cols='40' rows='15'>" . $row['tekst'] . "</textarea>
      <br><br>
      <label for='slika'>Odaberite sliku:</label><br>
      <input type='file' id='slika' name='slika' accept='image/*'>
      <br><br>
      <img src='img/" . $row['slika'] . "' width='200px'>
      <br><br>
      <label for='arhiva'>Spremiti u arhivu</label>";
        if ($row['arhiva'] == 0) {
          echo "<input type='checkbox' name='arhiva' id='arhiva'/>";
        } else {
          echo "<input type='checkbox' name='arhiva' id='arhiva' checked/>";
        }
        echo "</label>
      <input type='hidden' name='id' value='" . $row['id'] . "'>
      <br><br>
      <div class='btn-container'>
        <input type='submit' name='update' value='Izmijeni'>
        <input type='submit' name='delete' value='Izbriši'>
      </div>
      <br><br>
                    </form>
                </div>";
      }
    } elseif ($uspjesnaPrijava && !$admin) {
      echo '<p class="porukaPrijave">Dobrodošli ' . $_SESSION['username'] . '!<br>Uspješno ste prijavljeni, ali nemate administratorska prava.</p>';
    } elseif (!$uspjesnaPrijava) {
      echo '<p class="porukaPogreske">Pogrešno korisničko ime ili lozinka. Molimo <a href="prijava.html" class="prijava">pokušajte ponovno.</a></p>';
      echo '<p class="porukaPogreske"><a href="registracija.php">Registrirajte se.</a></p>';
    }
    ?>

    <footer class="mt-auto">
      <p>Paula Nikolić | pnikolic1@tvz.hr | 2024</p>
    </footer>
  </div>

  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>