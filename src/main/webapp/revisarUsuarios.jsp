<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <title>Revisar Historial</title>
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

    .search-input {
        margin-top: 30px;
        margin-left: 20px;
        width: 450px;
        height: 30px;
        border-radius: 15px;
        text-align: center;
    }

    .btn-buscar {
        background-color: #5cb85c;
        margin-left: 500px;
        margin-top: -50px;
    }

    h2 {
        color: black;
    }

    .btn-modificar {
        background-color: #5cb85c;
    }
</style>

<body style="display: flex; flex-direction: column; min-height: 100vh;">
<nav class="navbar navbar-expand-lg">
    <div class="container">
        <a class="navbar-brand" href="inicio.jsp">
            <img src="assets/img/sigebi%20logo2.png" alt="SIGEBI Logo">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="revisarHistorial.html">Revisar Historial</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="administarStok.html">Administrar Stock</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="revisarUsuarios.html">Revisar Usuarios</a>
                </li>
                <li class="nav-item">
                    <input type="text" class="form-control search-input"
                           placeholder="Buscar usuario (nombre, matricula).">
                    <button type="button" class="btn btn-buscar">Buscar</button>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container my-5">
    <div class="table-responsive">
        <h2 class="text-center mb-4">Revisión de Usuarios</h2>
        <table class="table table-bordered table-striped">
            <thead>
            <tr>
                <th>Matricula</th>
                <th>Nombre(s)</th>
                <th>Apellido Paterno</th>
                <th>Apellido Materno</th>
                <th>Libros Prestados</th>
                <th>Libros Devueltos</th>
                <th>Ir a Historial</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>20223TN050</td>
                <td>Irving Uriel</td>
                <td>Espinosa</td>
                <td>Hernández</td>
                <td>3</td>
                <td>3</td>
                <td>
                    <button type="button" class="btn btn-modificar">Ir</button>
                </td>
            </tr>
            <tr>
                <td>20223TN074</td>
                <td>José Antonio</td>
                <td>Díaz</td>
                <td>García</td>
                <td>5</td>
                <td>4</td>
                <td>
                    <button type="button" class="btn btn-modificar">Ir</button>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
</body>

</html>