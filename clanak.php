<!DOCTYPE html>
<html lang="hr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="Paula Nikolić">
    <title>Članak</title>
    <link rel="icon" type="image/png" href="img/logo.png">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
</head>

<body>
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
    include 'connect.php';
    define('UPLPATH', 'img/');

    if (isset($_GET['id'])) {
        $id = $_GET['id'];

        $query = "SELECT * FROM vijesti WHERE id='$id'";
        $result = mysqli_query($dbc, $query);

        if (mysqli_num_rows($result) > 0) {
            $row = mysqli_fetch_assoc($result);
    ?>
            <section role="main" class="container">
                <div class="row">
                    <div class="col-lg-8 offset-lg-2">
                        <section class="slika text-center">
                            <?php echo '<img src="' . UPLPATH . $row['slika'] . '" class="img-fluid" alt="Slika članka">'; ?>
                        </section>
                        <h1 class="title text-center"><?php echo $row['naslov']; ?></h1>
                        <section class="sadrzaj">
                            <p>
                                <?php echo $row['tekst']; ?>
                            </p>
                        </section>
                        <p class="text-right">OBJAVLJENO: <?php echo "<span>" . $row['datum'] . "</span>"; ?></p>
                    </div>
                </div>
            </section>
    <?php
        } else {
            echo "Članak nije pronađen.";
        }
    } else {
        echo "Članak nije odabran.";
    }
    ?>

    <footer>
        <p>Paula Nikolić | pnikolic1@tvz.hr | 2024</p>
    </footer>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>
