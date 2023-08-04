<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <title>Modificar Libro</title>
</head>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,400;0,700;1,400&display=swap');

    body {
        font-family: 'Montserrat', sans-serif;
        background-color: #ffffff;
        color: #eee;
    }

    .navbar {
        background-color: #009475;
        display: flex;
        align-items: center;
        justify-content: flex-start;
        height: 60px;
        padding-left: 20px;
        position: relative;
        height: 100px;
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

    .navbar-nav li {
        display: inline-block;
    }

    .navbar-nav li a {
        padding: 14px 16px;
        text-decoration: none;
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

    .carousel-img {
        max-height: 500px;
    }

    .dropdown-menu {
        background-color: #ffffff00;
        color: #ffffff00;
    }

    .image-circles {
        display: flex;
        justify-content: center;
        margin-top: 30px;
    }

    .circle-image {
        width: 200px;
        height: 200px;
        border-radius: 50%;
        overflow: hidden;
        margin: 0 10px;
        position: relative;
    }

    .circle-image img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    .circle-text {
        position: absolute;
        bottom: 0;
        left: 0;
        width: 100%;
        text-align: center;
        color: #eee;
        font-size: 14px;
        font-weight: bold;
        text-transform: uppercase;
        padding: 10px;
        background-color: rgba(0, 0, 0, 0.7);
    }

    .dropdown-menu {
        background-color: #009475;
        border: none;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        border-radius: 5px;
        padding: 10px;
        font-size: 16px;
        color: #eee;
        margin-top: 8px;
        min-width: 200px;
    }

    .dropdown-menu a {
        color: #eee;
        text-decoration: none;
        display: block;
        padding: 8px 16px;
        transition: background-color 0.3s ease;
    }

    .dropdown-menu a:hover {
        background-color: #74bbac;
    }


    .dropdown-toggle[aria-expanded="true"]::after {
        transform: rotate(90deg);
    }

    .navbar-nav .nav-item .nav-link:hover {
        text-decoration: none;
    }

    label, h3 {
        color: black;
    }

    .btn-agregar {
        background-color: #005ec9;
        margin-top: 20px;
    }
</style>

<body style="display: flex; flex-direction: column; min-height: 100vh;">
<nav class="navbar">
    <a class="navbar-brand" href="index.jsp">
        <img src="assets/img/sigebi%20logo2.png" alt="SIGEBI Logo">
        Bienvenido Administrador
    </a>
    <form action="Libros" method="post" class="form-inline ml-auto d-flex">
        <!-- ml-auto para alinear el formulario a la derecha y d-flex para flexbox -->
        <input id="searchInput" class="form-control mr-2" type="search" placeholder="Buscar" aria-label="Buscar">
        <button class="btn btn-outline-success" type="button" id="searchButton">Buscar</button>
    </form>
    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#sidebarCollapse">
        <!-- Reemplazar el icono de tres líneas por uno de Font Awesome (fa-bars) -->
        <i class="fas fa-bars"></i>
    </button>
</nav>


<div class="sidebar hide">
    <ul>

        <li><a href="">Revisar Historial</a></li>
        <li><a href="#">Administrar Stock</a></li>
        <li><a href="#">Revisar Usuarios</a></li>
        <li><a href="#">Cerrar Sesión</a></li>
        <!-- Agrega más opciones de menú aquí -->
    </ul>
</div>
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-lg-6">
            <div class="card">
                <div class="card-body">
                    <h3 class="card-title text-center mb-4">Registro de Libros</h3>
                    <form method="post" action="AgregarLibroServlet">
                        <div class="form-group">
                        </div>
                        <div class="form-group">
                            <label><strong>ISBN:</strong></label>
                            <input type="text" class="form-control" id="isbn" name="isbn" placeholder="Ingresa ISBN del Libro" >
                        </div>
                        <div class="form-group">
                            <label><strong>Título:</strong></label>
                            <input type="text" class="form-control" id="titulo" name="titulo" placeholder="Ingresa Nombre del Libro" >
                        </div>
                        <div class="form-group">
                            <label><strong>Autor:</strong></label>
                            <input type="text" class="form-control" id="autor" name="autor" placeholder="Ingresa Autor del Libro" >
                            <label for="editoriales"><strong>Editorial:</strong></label>
                        </div>
                        <div class="form-group">
                            <label>
                                <c:forEach items="${editoriales}" var="e">
                                    <input type="checkbox" id="editoriales" name="editoriales" value="${e.id_editorial}"> ${e.nombre} <br>
                                </c:forEach>
                            </label> <br>
                            <label for="categorias"><strong>Categoría:</strong></label>
                        </div>
                        <div class="form-group">
                            <label>
                                <c:forEach items="${categorias}" var="c">
                                    <input type="checkbox" id="categorias" name="categorias" value="${c.id_categoria}"> ${c.nombre_categoria} <br>
                                </c:forEach>
                            </label>
                        </div>
                        <div class="form-group">
                            <label><strong>Ejemplares:</strong></label>
                            <input type="number" class="form-control" id="ejemplares" name="ejemplares" placeholder="Ingresa Ejemplares del Libro" min="1">
                        </div>
                        <div class="form-group">
                            <label><strong>Imagen:</strong></label>
                            <input type="file" class="form-control" id="imagen" name="imagen" accept="image/*">
                        </div>
                        <button type="submit" class="btn btn-agregar" name="accion ">Agregar Libro</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</html>