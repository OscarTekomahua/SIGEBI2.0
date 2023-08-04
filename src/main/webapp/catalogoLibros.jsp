<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="css/estilos.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/hover.css/2.3.1/css/hover-min.css">
    <title>SIGEBI</title>
    <style>
        .buscador {
            border-radius: 10px;
            border-color: white;
        }

        .dropdown-menu {
            background-color: #009475;
            color: #eee;
            border: none;
        }

        .dropdown-menu a {
            color: #eee;
            text-decoration: none;
            font-size: 16px;
            transition: color 0.3s ease;
        }

        .dropdown-menu a:hover {
            color: #002E60;
            background-color: #fff;
        }
        .navbar {
            background-color: #009475 ;
            display: flex;
            align-items: center;
            justify-content: flex-start;
            height: 60px;
            padding-left: 20px;
        }
        .navbar a {
            color: #eee;
            text-decoration: none;
            font-size: 18px;
            letter-spacing: 4px;
            margin-right: 22px;
            transition: font-size 0.3s;
        }
        .navbar a:hover {
            transform: scale(1.2);
        }

        .navbar-brand {
            font-size: 24px;
            color: #eee;
        }

        .navbar-brand img {
            height: 40px;
            margin-right: 10px;
        }

        .navbar-nav .nav-link {
            font-size: 18px;
            color: #eee;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .navbar-nav .nav-link:hover {
            color: #002E60;
        }

    </style>
</head>

<body>
<div style="background-color: #52AB90; ">
    <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
            <a class="navbar-brand" href="inicio.jsp">
                <img src="assets/img/Logo.png" alt="Logo" width="100" height="24" class="d-inline-block align-text-top">
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup"
                    aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                <div class="navbar-nav">
                    <h2 class="nav-link" style="color: black;">Biblioteca virtual UTEZ</h2>
                    <div class="container">
                        <div style="margin-left: 100px; margin-top: 10px;">
                            <form class="d-flex" id="searchForm">
                                <input class="form-control me-2 buscador" type="search" placeholder="Buscar por título, autor, editorial" aria-label="Buscar" id="searchInput">
                                <button class="btn btn-outline-success" type="submit">Buscar</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </nav>
</div>
<nav class="navbar navbar-expand-lg">
    <div class="container">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">Iniciar sesion</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="inicio.jsp">Inicio</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="" role="button" id="navbarDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                        Servicios
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="servicios.jsp">Solicitar Sala</a></li>
                        <li><a class="dropdown-item" href="libros.jsp">Solicitar Libro</a></li>

                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container">
    <h1>Libros disponibles</h1>
    <div id="bookList">
        <div class="libros">
            <img src="assets/img/book1.jpg" style="height: 120px; width: 80px;">
            <a href="vistalibro.jsp">Harry Potter y la Piedra Filosofal</a>
        </div>
        <div class="libros">
            <img src="assets/img/book2.jpg" style="height: 120px; width: 80px;">
            <a href="vistalibro.jsp">El Señor de los Anillos: La Comunidad del Anillo</a>
        </div>
        <div class="libros">
            <img src="assets/img/book3.jpg" style="height: 120px; width: 80px;">
            <a href="vistalibro.jsp">Cien años de soledad</a>
        </div>
        <div class="libros">
            <img src="assets/img/book4.jpg" style="height: 120px; width: 80px;">
            <a href="vistalibro.jsp">1984</a>
        </div>
        <!-- Agrega más ejemplos de libros si lo deseas... -->
    </div>
</div>

<script src="assets/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
<script>
    // Función para manejar la búsqueda de libros por título
    document.getElementById('searchForm').addEventListener('submit', function(event) {
        event.preventDefault(); // Prevenimos el comportamiento predeterminado del formulario

        const searchTerm = document.getElementById('searchInput').value.toLowerCase();
        const bookList = document.getElementById('bookList');
        const libros = bookList.getElementsByClassName('libros');

        // Mostrar u ocultar los libros según la búsqueda por título
        for (let libro of libros) {
            const title = libro.querySelector('a').textContent.toLowerCase();
            if (title.includes(searchTerm)) {
                libro.style.display = 'block';
            } else {
                libro.style.display = 'none';
            }
        }
    });
</script>
</body>

</html>