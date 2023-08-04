<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="css/estilos.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/hover.css/2.3.1/css/hover-min.css">
    <title>SIGEBI</title>
    <style>

        body {
            font-family: 'Montserrat', sans-serif;
            background-color: #ffffff;
            color: #eee;
            background-image: url("assets/img/bibliutez.png");
            background-size: cover;
            background-repeat: no-repeat;
        }

        .navbar {
            background-color: #009475 ;
            display: flex;
            align-items: center;
            justify-content: flex-start;
            height: 60px;
            padding-left: 20px;
            position: relative;
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


        .hero-text-box {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: rgba(0, 148, 117, 0.8);
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            padding: 30px;
            text-align: center;
            color: #fff;
            width: 100%;
            max-width: 600px;
        }

        .btn {
            display: inline-block;
            margin: 10px;
            padding: 12px 24px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
        }

        .btn-full {
            background-color: #fff;
            color: #009475;
            border: 2px solid #009475;
        }

        .btn-full:hover {
            background-color: #009475;
            color: #fff;
            transform: scale(1.05);
        }

        .btn-ghost {
            background-color: transparent;
            color: #fff;
            border: 2px solid #fff;
        }

        .btn-ghost:hover {
            background-color: #fff;
            color: #009475;
            transform: translateY(-3px);
        }

        .btn i {
            margin-right: 8px;
        }
    </style>
</head>
<body>
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
                    <a class="nav-link" href="index.jsp">Iniciar sesion</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="inicio.jsp">Inicio</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                       data-bs-toggle="dropdown" aria-expanded="false">
                        Servicios
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#">Solicitar Sala</a></li>
                        <li><a class="dropdown-item" href="#">Solicitar Libro</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="vistalibro.jsp">Bibliotecas</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="revisarUsuarios.jsp">Contacto</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="hero-text-box">
    <h1>Sesión iniciada correctamente.<br>¿Qué acción desea realizar?</h1>
    <a class="btn btn-ghost" href="revisarHistorial.jsp"><i class="fas fa-history"></i>Revisar historial</a>
    <form action="mostrarlibros" method="get">
        <input type="hidden" name="operacion" value="stocklibros">
        <button type="submit" class="btn btn-ghost" href="administrarStok.jsp">Stock de libros</button>
    </form>
    <form action="AgregarLibroServlet" method="get">
        <input type="hidden" name="operacion" value="nuevolibro">
        <button type="submit" class="btn btn-ghost" href="agregarlibro.jsp">Gestionar Libros</button>
    </form>
    <a class="btn btn-ghost" href="#"><i class="fas fa-door-open"></i>Gestionar salas</a>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>