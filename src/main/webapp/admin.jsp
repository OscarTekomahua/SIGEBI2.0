<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            background-color: #009475;
        }

        .navbar {
            background-color: #002E60 ;
            display: flex;
            flex-direction: row;
            padding-left: 20px;
            position: relative;
            align-items: center;
            text-align: center;
        }
        .navbar a {
            color: #eee;
            text-decoration: none;
            font-size: 18px;
            letter-spacing: 4px;
            transition: font-size 0.3s;
        }
        .navbar a:hover {
            transform: scale(1.2);
        }

        .navbar-brand {
            font-size: 24px;
            color: #eee;
            margin-left: 20px;
        }

        .navbar-brand img {
            height: 40px;
        }

        .navbar-nav .nav-link {
            font-size: 18px;
            color: #eee;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .navbar-nav .nav-link:hover {
            color: #ffffff;
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

        .navbar-nav .nav-item .nav-link:hover {
            text-decoration: none;
        }


        .hero-text-box {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: rgba(0, 46, 96, 0.8);
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

        .botonCerrarSesion {
            background-image: url("assets/img/cerrarsesion.png");
            background-size: cover;
            background-color: #002E60;
            width: 30px;
            height: 30px;
            border: none;
            cursor: pointer;
            margin-right: 80px;
        }

        .sigebi {
            font-family: "Source Code Pro";
            color: white;
        }

    </style>
</head>
<body>
<div class="navbar">
    <a class="navbar-brand" href="admin.jsp"><img src="assets/img/sigebi%20logo2.png"></a>
    <h4 class="sigebi">Sistema de Gestión Bibliotecaria</h4>
    <button class="botonCerrarSesion" id="botonCerrarSesion"></button>
</div>
<div class="hero-text-box">
    <h1>Administrador</h1>
    <form action="readUsersAdmin" method="get">
        <input type="hidden" name="operacion" value="usuarios">
        <button type="submit" class="btn btn-ghost"><i class="fas fa-users"> Gestionar Usuarios</i></button>
    </form>
    <form action="mostrarlibrosadmin" method="get">
        <input type="hidden" name="operacion" value="stocklibros">
        <button type="submit" class="btn btn-ghost"><i class="fas fa-stream"> Gestionar libros</i></button>
    </form>
    <form action="readEditorialAdmin" method="get">
        <input type="hidden" name="operacion" value="editoriales">
        <button type="submit" class="btn btn-ghost"><i class="fas fa-solid fa-book"> Editoriales</i></button>
    </form>
    <form action="readCategoriaAdmin" method="get">
        <input type="hidden" name="operacion" value="categorias">
        <button type="submit" class="btn btn-ghost"><i class="fas fa-solid fa-bars"> Categorias</i></button>
    </form>
    <form action="salasAdmin" method="get">
        <input type="hidden" name="operacion" value="tablasalas">
        <button type="submit" class="btn btn-ghost"><i class="fas fa-door-open"> Gestionar Salas</i></button>
    </form>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
<script>

    document.getElementById("botonCerrarSesion").addEventListener("click", function () {

        var xhr = new XMLHttpRequest();
        xhr.open("GET", "CloseSession", true);
        xhr.send();

        window.location.href = "index.jsp";

    });

</script>