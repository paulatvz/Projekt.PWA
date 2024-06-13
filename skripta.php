<!DOCTYPE html>
<html lang="hr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="Paula Nikolić">
    <title>Uređivanje Članaka</title>
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
                            <a class="nav-link" href="category.php?category=filmovi">Filmovi</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="category.php?category=serije">Serije</a>
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
                    <a href="unos.html" class="btn btn-primary">Dodaj Članak</a>
                </div>
            </nav>
        </header>

        <?php
        include "connect.php"; 
        define('UPLPATH', 'img/');

        if (isset($_POST['update'])) {
            $id = $_POST['id'];
            $title = isset($_POST['naslov']) ? mysqli_real_escape_string($dbc, $_POST['naslov']) : '';
            $about = isset($_POST['opis']) ? mysqli_real_escape_string($dbc, $_POST['opis']) : '';
            $content = isset($_POST['tekst']) ? mysqli_real_escape_string($dbc, $_POST['tekst']) : '';
            $category = isset($_POST['kategorija']) ? mysqli_real_escape_string($dbc, $_POST['kategorija']) : '';
            $archive = isset($_POST['arhiva']) ? 1 : 0;

            if (!empty($_FILES['slika']['name'])) {
                $picture = $_FILES['slika']['name'];
                $target_dir = 'img/' . $picture;
                move_uploaded_file($_FILES["slika"]["tmp_name"], $target_dir);
                $query = "UPDATE vijesti SET naslov='$title', opis='$about', tekst='$content', slika='$picture', kategorija='$category', arhiva='$archive' WHERE id='$id'";
            } else {
                $query = "UPDATE vijesti SET naslov='$title', opis='$about', tekst='$content', kategorija='$category', arhiva='$archive' WHERE id='$id'";
            }

            $result = mysqli_query($dbc, $query) or die('Error querying database: ' . mysqli_error($dbc));

            header("Location: index.php");
            exit();
        }

        if (isset($_POST['delete'])) {
            $id = $_POST['id'];
            $query = "DELETE FROM vijesti WHERE id='$id'";
            $result = mysqli_query($dbc, $query) or die('Error querying database: ' . mysqli_error($dbc));

            header("Location: index.php");
            exit();
        }

        if (isset($_GET['id'])) {
            $id = $_GET['id'];
            $query = "SELECT * FROM vijesti WHERE id='$id'";
            $result = mysqli_query($dbc, $query);
            $row = mysqli_fetch_assoc($result);
        }
        ?>

        <section class="container mt-4">
            <div class="row">
                <div class="col-lg-8 offset-lg-2">
                    <form method="POST" enctype="multipart/form-data">
                        <input type="hidden" name="id" value="<?php echo $row['id']; ?>">
                        <div class="form-group">
                            <label for="title">Naslov</label>
                            <input type="text" class="form-control" id="title" name="title" value="<?php echo $row['naslov']; ?>" required>
                        </div>
                        <div class="form-group">
                            <label for="opis">Opis</label>
                            <textarea class="form-control" id="opis" name="opis" rows="3"><?php echo $row['opis']; ?></textarea>
                        </div>
                        <div class="form-group">
                            <label for="tekst">Tekst</label>
                            <textarea class="form-control" id="tekst" name="tekst" rows="5"><?php echo $row['tekst']; ?></textarea>
                        </div>
                        <div class="form-group">
                            <label for="category">Kategorija</label>
                            <select class="form-control" id="category" name="category" required>
                                <option value="filmovi" <?php if ($row['kategorija'] == 'filmovi') echo 'selected'; ?>>Filmovi</option>
                                <option value="serije" <?php if ($row['kategorija'] == 'serije') echo 'selected'; ?>>Serije</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="picture">Nova slika</label>
                            <input type="file" class="form-control-file" id="picture" name="picture">
                        </div>
                        <div class="form-check">
                            <input type="checkbox" class="form-check-input" id="arhiva" name="arhiva" <?php if ($row['arhiva'] == 1) echo 'checked'; ?>>
                            <label class="form-check-label" for="arhiva">Arhiva</label>
                        </div>
                        <button type="submit" class="btn btn-primary mt-3" name="update">Izmijeni</button>
                        <button type="submit" class="btn btn-danger mt-3" name="delete">Izbriši</button>
                    </form>
                </div>
            </div>
        </section>
    </div>

    <footer class="mt-auto">
        <p>Paula Nikolić | pnikolic1@tvz.hr | 2024</p>
    </footer>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
