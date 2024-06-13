<!DOCTYPE html>
<html lang="hr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="Paula Nikolić">
    <title>Registracija</title>
    <link rel="icon" type="image/png" href="img/logo.png">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="wrapper">
        <header>
            <div class="row align-items-center">
                <img src="img/logo.png" alt="Logo">
                <h1>Novosti iz svijeta filmova i serija</h1>
            </div>
            <nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #0E3755;">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
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
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
        <body class="d-flex flex-column min-vh-100">
        <main>
            <div class="container" id="registracija">
                <h2>Registracija</h2>
                <form enctype="multipart/form-data" action="" method="POST">
                    <div class="form-item">
                        <label for="ime">Ime: </label>
                        <div class="form-field">
                            <input type="text" name="ime" id="ime" class="form-field-textual">
                        </div>
                        <span id="porukaIme" class="bojaPoruke"></span>
                        <br><br>
                    </div>
                    <div class="form-item">
                        <label for="prezime">Prezime: </label>
                        <div class="form-field">
                            <input type="text" name="prezime" id="prezime" class="form-field-textual">
                        </div>
                        <span id="porukaPrezime" class="bojaPoruke"></span>
                        <br><br>
                    </div>
                    <div class="form-item">
                        <label for="username">Korisničko ime: </label>
                        <?php echo isset($msg) ? '<br><span class="bojaPoruke">' . $msg . '</span>' : ''; ?>
                        <div class="form-field">
                            <input type="text" name="username" id="username" class="form-field-textual">
                        </div>
                        <span id="porukaUsername" class="bojaPoruke"></span>
                        <br><br>
                    </div>
                    <div class="form-item">
                        <label for="pass">Lozinka: </label>
                        <div class="form-field">
                            <input type="password" name="pass" id="pass" class="form-field-textual">
                        </div>
                        <span id="porukaPass" class="bojaPoruke"></span>
                        <br><br>
                    </div>
                    <div class="form-item">
                        <label for="passRep">Ponovite lozinku: </label>
                        <div class="form-field">
                            <input type="password" name="passRep" id="passRep" class="form-field-textual">
                        </div>
                        <span id="porukaPassRep" class="bojaPoruke"></span>
                        <br><br>
                    </div>
                    <div class="form-item">
                        <button type="submit" value="Prijava" id="slanje">Prijava</button>
                    </div>
                </form>
            </div>
            <?php
            $ime = isset($_POST['ime']) ? $_POST['ime'] : '';
            $prezime = isset($_POST['prezime']) ? $_POST['prezime'] : '';
            $username = isset($_POST['username']) ? $_POST['username'] : '';
            $lozinka = isset($_POST['pass']) ? $_POST['pass'] : '';

            $dbc = mysqli_connect('localhost', 'root', '', 'vijesti_db', 3307) or die('Error connecting to MySQL server.');

            if (!empty($ime) && !empty($prezime) && !empty($username) && !empty($lozinka)) {
                $hashed_password = password_hash($lozinka, PASSWORD_BCRYPT);
                $razina = 0;
                $registriranKorisnik = '';

                $sql = "SELECT korisnicko_ime FROM korisnik WHERE korisnicko_ime = ?";
                $stmt = mysqli_stmt_init($dbc);
                if (mysqli_stmt_prepare($stmt, $sql)) {
                    mysqli_stmt_bind_param($stmt, 's', $username);
                    mysqli_stmt_execute($stmt);
                    mysqli_stmt_store_result($stmt);
                }
                if (mysqli_stmt_num_rows($stmt) > 0) {
                    $msg = 'Korisničko ime već postoji!';
                } else {
                    $sql = "INSERT INTO korisnik (ime, prezime, korisnicko_ime, lozinka, razina) VALUES (?, ?, ?, ?, ?)";
                    $stmt = mysqli_stmt_init($dbc);
                    if (mysqli_stmt_prepare($stmt, $sql)) {
                        mysqli_stmt_bind_param($stmt, 'ssssd', $ime, $prezime, $username, $hashed_password, $razina);
                        mysqli_stmt_execute($stmt);
                        $registriranKorisnik = true;
                    }
                }
                mysqli_close($dbc);
                if ($registriranKorisnik == true) {
                    echo '<p>Korisnik je uspješno registriran!</p>';
                }
            }
            ?>
            <script type="text/javascript">
                document.getElementById("slanje").onclick = function (event) {
                    var slanjeForme = true;

                    var poljeIme = document.getElementById("ime");
                    var ime = document.getElementById("ime").value;
                    if (ime.length == 0) {
                        slanjeForme = false;
                        poljeIme.style.border = "1px dashed red";
                        document.getElementById("porukaIme").innerHTML = "<br>Unesite ime!<br>";
                    } else {
                        poljeIme.style.border = "1px solid green";
                        document.getElementById("porukaIme").innerHTML = "";
                    }

                    var poljePrezime = document.getElementById("prezime");
                    var prezime = document.getElementById("prezime").value;
                    if (prezime.length == 0) {
                        slanjeForme = false;
                        poljePrezime.style.border = "1px dashed red";
                        document.getElementById("porukaPrezime").innerHTML = "<br>Unesite Prezime!<br>";
                    } else {
                        poljePrezime.style.border = "1px solid green";
                        document.getElementById("porukaPrezime").innerHTML = "";
                    }

                    var poljeUsername = document.getElementById("username");
                    var username = document.getElementById("username").value;
                    if (username.length == 0) {
                        slanjeForme = false;
                        poljeUsername.style.border = "1px dashed red";
                        document.getElementById("porukaUsername").innerHTML = "<br>Unesite korisničko ime!<br>";
                    } else {
                        poljeUsername.style.border = "1px solid green";
                        document.getElementById("porukaUsername").innerHTML = "";
                    }

                    var poljePass = document.getElementById("pass");
                    var pass = document.getElementById("pass").value;
                    var poljePassRep = document.getElementById("passRep");
                    var passRep = document.getElementById("passRep").value;
                    if (pass.length == 0 || passRep.length == 0 || pass != passRep) {
                        slanjeForme = false;
                        poljePass.style.border = "1px dashed red";
                        poljePassRep.style.border = "1px dashed red";
                        document.getElementById("porukaPass").innerHTML = "<br>Lozinke nisu iste!<br>";
                        document.getElementById("porukaPassRep").innerHTML = "<br>Lozinke nisu iste!<br>";
                    } else {
                        poljePass.style.border = "1px solid green";
                        poljePassRep.style.border = "1px solid green";
                        document.getElementById("porukaPass").innerHTML = "";
                        document.getElementById("porukaPassRep").innerHTML = "";
                    }

                    if (slanjeForme != true) {
                        event.preventDefault();
                    }
                };
            </script>
        </main>
        </body>
        <footer class="mt-auto">
            <p>Paula Nikolić | pnikolic1@tvz.hr | 2024</p>
        </footer>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </div>
</body>
</html>
