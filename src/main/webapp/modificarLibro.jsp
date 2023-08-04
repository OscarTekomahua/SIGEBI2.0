<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="css/estilos.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/hover.css/2.3.1/css/hover-min.css">
    <title>Modificar Libros</title>
</head>
<body style="display: flex; flex-direction: column; min-height: 100vh;">
<nav class="navbar">
    <a class="navbar-brand" href="index.jsp">
        <img src="assets/img/sigebi%20logo2.png" alt="SIGEBI Logo">
        Bienvenido Administrador
    </a>
    <form class="form-inline ml-auto d-flex">
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

        <li><a href="#">Revisar Historial</a></li>
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
                        <h3 class="card-title text-center mb-4">Modificar Libros</h3>
                        <form>
                            <div class="form-group">
                                <label for="id">ID:</label>
                                <input type="number" class="form-control" id="id" placeholder="Ingresa ID del Libro" min="1">
                            </div>
                            <div class="form-group">
                                <label for="isbn">ISBN:</label>
                                <input type="text" class="form-control" id="isbn" placeholder="Ingresa ISBN del Libro">
                            </div>
                            <div class="form-group">
                                <label for="nombre">Nombre:</label>
                                <input type="text" class="form-control" id="nombre" placeholder="Ingresa Nombre del Libro">
                            </div>
                            <div class="form-group">
                                <label for="autor">Autor:</label>
                                <input type="text" class="form-control" id="autor" placeholder="Ingresa Autor del Libro">
                            </div>
                            <div class="form-group">
                                <label for="autor">Categoria:</label>
                                <input type="text" class="form-control" id="Categoria" placeholder="Ingresa Categoria del Libro">
                            </div>
                            <div class="form-group">
                                <label for="editorial">Editorial:</label>
                                <input type="text" class="form-control" id="editorial" placeholder="Ingresa Editorial del Libro">
                            </div>
                            <div class="form-group">
                                <label for="stock">Stock:</label>
                                <input type="number" class="form-control" id="stock" placeholder="Ingresa Stock del Libro" min="1">
                            </div>
                            <div class="form-group">
                                <label for="imagen">Imagen:</label>
                                <input type="file" class="form-control" id="imagen" accept="image/*">
                            </div>
                            <button type="button" class="btn btn-agregar">Agregar Libro</button>
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
</html>
