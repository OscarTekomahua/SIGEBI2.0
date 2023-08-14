<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto&display=swap">
    <link rel="stylesheet" type="text/css" href="css/estilos.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/hover.css/2.3.1/css/hover-min.css">
    <title>Libros</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,400;0,700;1,400&display=swap');

        body {
            font-family: 'Montserrat', sans-serif;
            background-color: #f2f2f2;
            color: #333;
            margin: 0;
        }

        /* Estilos del Navbar */
        .navbar {
            background-color: #009475;
            height: 100px;
            display: flex;
            align-items: center;
            justify-content: flex-end; /* Alinea los elementos del navbar a la derecha */
            padding: 0 20px;
            position: relative;
            z-index: 999;
        }

        .navbar-brand {
            display: flex;
            align-items: center;
            font-size: 24px;
            color: #eee;
            text-decoration: none;
        }

        .navbar-brand img {
            height: 40px;
            margin-right: 10px;
        }

        .navbar-nav {
            display: flex;
            align-items: center;
        }

        .navbar-nav .nav-item {
            margin-right: 20px;
        }

        .navbar-nav .nav-link {
            color: #eee;
            text-decoration: none;
            font-size: 18px;
            letter-spacing: 4px;
            transition: color 0.3s;
        }

        .navbar-nav .nav-link:hover {
            color: #002E60;
        }

        /* Estilos del Menú Lateral */
        .sidebar {
            position: fixed;
            top: 0;
            right: -250px; /* Posiciona el sidebar en el lado derecho (inicialmente oculto) */
            height: 100%;
            width: 250px;
            background-color: rgba(255, 255, 255, 0.8);
            padding-top: 100px;
            transition: transform 0.3s;
            z-index: 2; /* Asegura que el menú esté por encima del contenido */
        }

        .sidebar.show {
            right: 0; /* Despliega el sidebar hacia la derecha cuando está abierto */
        }

        .sidebar ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .sidebar li {
            padding: 10px;
        }

        .sidebar a {
            color: #000000; /* Cambia el color del texto en el menú lateral a blanco */
            text-decoration: none;
            font-size: 18px;
            display: block;
            padding: 10px;
            letter-spacing: 1px;
            transition: color 0.3s;
        }

        .sidebar a:hover {
            color: #71dbca;
        }

        /* Estilos de la tabla */


        /* Estilos de los botones */
        .btn-group {
            display: flex;
            justify-content: center;
            margin-top: 10px;
        }

        .btn {
            padding: 10px 20px;
            margin: 5px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            color: #ffffff;
            transition: background-color 0.3s;
        }

        .btn-eliminar {
            background-color: #e74c3c;
        }

        .btn-aceptar {
            background-color: #2ecc71;
        }

        .btn:hover {
            opacity: 0.8;
        }

        /* Estilo para oscurecer el fondo cuando el sidebar esté abierto */
        .sidebar-open {
            overflow: hidden;
        }

        .sidebar-open .container {
            opacity: 0.6;
            pointer-events: none;
        }
        /* Agrega estos estilos al bloque <style> en la etiqueta <head> */
        .navbar-right-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar-toggler {
            margin-left: 20px; /* Agrega el margen deseado */
        }

        .libros {
            display: flex;
            align-items: center;
            padding: 10px;
            border-bottom: 1px solid #ccc;
        }

        .libros img {
            height: 120px;
            width: 80px;
            margin-right: 10px;
        }

        .libros a {
            color: #333;
            text-decoration: none;
            font-size: 18px;
            transition: color 0.3s ease;
        }

        .libros a:hover {
            color: #002E60;
        }

        .titulo-libros {
            font-size: 36px;
            margin: 40px 0;
            color: #009475;
            text-align: center;
            font-family: 'Roboto', sans-serif;
            animation: fadeIn 1s ease;
        }
        .buscador {
            width: 450px; /* Cambia este valor según tus preferencias */
        }
        /* Estilos para los detalles del libro */
        .libro-info {
            display: flex;
            align-items: center;
            padding: 10px;
            border-bottom: 1px solid #ccc;
        }

        .libro-imagen {
            height: 120px;
            width: 80px;
            margin-right: 10px;
        }

        .libro-detalles {
            flex: 1;
        }

        .libro-titulo {
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .libro-autor {
            font-size: 16px;
            margin-bottom: 5px;
        }

        .libro-isbn,
        .libro-ejemplares {
            font-size: 14px;
            color: #777;
        }

        /* Estilos para el botón Solicitar */
        .btn-solicitar {
            margin-top: 10px; /* Agrega espacio entre detalles y botón */
            padding: 8px 15px;
            background-color: #009475;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.3s, opacity 0.3s;
        }

        .btn-solicitar:hover {
            background-color: #00815e;
            opacity: 0.8;
        }
    </style>
</head>

<body>
<nav class="navbar">
    <div class="container d-flex justify-content-between align-items-center"> <!-- Ajustamos el contenedor con Flexbox -->
        <a class="navbar-brand" href="inicio.jsp">
            <img src="assets/img/sigebi%20logo2.png" alt="SIGEBI Logo">
            <span class="d-none d-md-inline-block">Bienvenido Usuario Utez</span> <!-- Oculta el texto en pantallas pequeñas -->
        </a>
        <div class="nav-item">
            <form class="d-flex" id="searchForm">
                <input class="form-control me-2 buscador" type="search" placeholder="Buscar por Título" aria-label="Buscar" id="searchInput">
                <button class="btn btn-outline-success" type="submit">Buscar</button>
            </form>
        </div>
        <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#sidebarCollapse">
            <!-- Reemplazar el icono de tres líneas por uno de Font Awesome (fa-bars) -->
            <i class="fas fa-bars"></i>
        </button>
    </div>
</nav>

<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/js/all.min.js"></script>
<div class="sidebar hide">
    <ul>
        <!-- Agregamos los iconos de Font Awesome a las opciones del menú -->
        <li><a href="#"><i class="fas fa-home"></i> Inicio</a></li>
        <li><a href="#"><i class="fas fa-calendar-alt"></i> Solicitar Sala</a></li>
        <li><a href="#"><i class="fas fa-book"></i> Solicitar Libro</a></li>
        <li><a href="#"><i class="fas fa-list"></i> Categorías</a></li>
        <li><a href="#"><i class="fas fa-sign-out-alt"></i> Cerrar Sesión</a></li>
        <!-- Agrega más opciones de menú aquí -->
    </ul>
</div>

<div class="container">
    <h1>Libros disponibles</h1>
    <div id="bookList">
        <c:forEach items="${tablalibros}" var="libro">
            <div class="libros">
                <div class="libro-info">
                    <img src="${libro.imagen}" class="libro-imagen">
                    <div class="libro-detalles">
                        <p class="libro-titulo">${libro.titulo}</p>
                        <p class="libro-autor">Autor: ${libro.autor}</p>
                        <p class="libro-isbn">ISBN: ${libro.isbn}</p>
                        <button class="btn btn-solicitar">Solicitar</button> <!-- Botón dentro de los detalles -->
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<script src="assets/js/bootstrap.js"></script>
<script src="assets/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- Agrega Font Awesome para tener acceso a los iconos -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/js/all.min.js"></script>

<script>
    $(document).ready(function () {
        // Función para mostrar/ocultar el menú lateral y el fondo con efecto de deslizamiento
        $(".navbar-toggler").click(function () {
            $(".sidebar").toggleClass("show hide");
            $(".navbar-toggler").toggleClass("hidden"); // Agrega la clase 'hidden' al botón del icono
            $("body").toggleClass("sidebar-open");
        });

        // Cierra el menú cuando se hace clic fuera del menú
        $(document).click(function (event) {
            if (!$(event.target).closest(".sidebar, .navbar-toggler").length) {
                $(".sidebar").removeClass("show").addClass("hide");
                $(".navbar-toggler").removeClass("hidden"); // Elimina la clase 'hidden' del botón del icono
                $("body").removeClass("sidebar-open");
            }
        });
    });

</script>

<script>
    // Función para manejar la búsqueda de libros por título
    document.getElementById('searchForm').addEventListener('submit', function(event) {
        event.preventDefault(); // Prevenimos el comportamiento predeterminado del formulario

        const searchTerm = document.getElementById('searchInput').value.toLowerCase();
        const bookList = document.getElementById('bookList');
        const libros = bookList.getElementsByClassName('libros');

        // Mostrar u ocultar los libros según la búsqueda por título
        for (let libro of libros) {
            const title = libro.querySelector('p').textContent.toLowerCase();
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