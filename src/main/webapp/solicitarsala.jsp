<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <title>Modificar Libro</title>
</head>

<body>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,400;0,700;1,400&display=swap');

    body {
        font-family: 'Montserrat', sans-serif;
        background-color: #ffffff;
        color: #eee;
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

    /* Estilo para oscurecer el fondo cuando el sidebar esté abierto */
    .sidebar-open {
        overflow: hidden;
    }

    .sidebar-open .container-tab {
        opacity: 0.6;
        pointer-events: none;
    }
    .sidebar-open .container {
        opacity: 0.6;
        pointer-events: none;
    }

    .sidebar a:hover {
        color: #71dbca;
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

    label,
    h3 {
        color: black;
    }

    .btn-solicitar {
        background-color: #005ec9;
        margin-top: 20px;
    }
</style>

<body style="display: flex; flex-direction: column; min-height: 100vh;">
<nav class="navbar">
    <div class="container d-flex justify-content-between align-items-center"> <!-- Ajustamos el contenedor con Flexbox -->
        <a class="navbar-brand" href="inicio.jsp">
            <img src="assets/img/sigebi%20logo2.png" alt="SIGEBI Logo">
            <span class="d-none d-md-inline-block">Bienvenido Usuario Utez</span> <!-- Oculta el texto en pantallas pequeñas -->
        </a>
        <div class="nav-item">
            <form class="d-flex" id="searchForm">
                <input class="form-control me-2 buscador" type="search" placeholder="Buscar por Nombre, matrícula, correo" aria-label="Buscar" id="searchInput">
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
        <li><a href="#"><i class="fas fa-history"></i> Revisar Historial</a></li>
        <li><a href="#"><i class="fas fa-box-open"></i> Administrar Stock</a></li>
        <li><a href="#"><i class="fas fa-users"></i> Revisar Usuarios</a></li>
        <li><a href="#"><i class="fas fa-sign-out-alt"></i> Cerrar Sesión</a></li>
    </ul>
</div>
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-lg-6">
            <div class="card">
                <div class="card-body">
                    <h3 class="card-title text-center mb-4">Solicitar Sala</h3>
                    <form method="post" action="PedirSalaServlet">
                        <input type="hidden" name="id_sala" value="${id_sala}">
                        <div class="form-control">
                            <label for="id_usuario">ID de Usuario:</label>
                            <input type="number" class="form-control" id="id_usuario" name="id_usuario" placeholder="Ingresa tu ID de Usuario">
                        </div>
                        <div class="form-group">
                            <label for="nombre">Nombre(s):</label>
                            <input type="text" class="form-control" id="nombre" placeholder="Ingresa tu(s) Nombre(s)" name="nombre">
                        </div>
                        <div class="form-group">
                            <label for="ape1">Apellido Paterno:</label>
                            <input type="text" class="form-control" id="ape1"
                                   placeholder="Ingresa tu Apellido Paterno" name="apellidop">
                        </div>
                        <div class="form-group">
                            <label for="ape2">Apellido Materno:</label>
                            <input type="text" class="form-control" id="ape2"
                                   placeholder="Ingresa tu Apellido Materno" name="apellidom">
                        </div>
                        <div class="form-group">
                            <label for="horaInicio">Hora de inicio del préstamo:</label>
                            <input type="time" class="form-control" id="horaInicio" name="horaInicio">
                        </div>
                        <div class="form-group">
                            <label for="horaFinal">Hora de final del préstamo:</label>
                            <input type="time" class="form-control" id="horaFinal" name="horaFinal">
                        </div>
                        <div class="form-group">
                            <label>Añadir extras a la sala:</label><br>
                            <textarea class="form-control" id="extras" name="extras" placeholder="Añadir extras a la sala" rows="5" cols="15"></textarea>
                            </label><br>
                        </div>
                        <button type="submit" class="btn btn-solicitar">Solicitar Sala</button>
                    </form>
                    <c:if test="${not empty error}">
                        <p>${error}</p>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- Agrega Font Awesome para tener acceso a los iconos -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/js/all.min.js"></script>
<script>
    function validarFormulario() {
        var horaInicio = document.getElementById("horaInicio").value;
        var horaFinal = document.getElementById("horaFinal").value;

        if (horaInicio >= horaFinal) {
            alert("La hora de inicio debe ser menor que la hora de final");
            return false; // Cancelar el envío del formulario
        }

        return true; // Permitir el envío del formulario si pasa la validación
    }
</script>
</body>
</html>
