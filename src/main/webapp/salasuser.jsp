<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="assets/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/estilos.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/hover.css/2.3.1/css/hover-min.css" />
    <title>Pedir Sala</title>
</head>

<style>
    @import url('https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,400;0,700;1,400&display=swap');
    body {
        font-family: 'Montserrat', sans-serif;
        background-color: #f2f2f2;
        color: #333;
        margin: 0;
        background-size: auto;
    }

    .navbar {
        background-color: #009475;
        height: 100px;
        display: flex;
        align-items: center;
        justify-content: flex-end;
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

    .sidebar {
        position: fixed;
        top: 0;
        right: -250px;
        height: 100%;
        width: 250px;
        background-color: rgba(255, 255, 255, 0.8);
        padding-top: 100px;
        transition: transform 0.3s;
        z-index: 2;
    }

    .sidebar.show {
        right: 0;
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
        color: #000000;
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

    .container-tab {
        margin-left: 10px;
        margin-right: 10px;
        padding-top: 50px;
    }

    .table-container {
        max-width: 100%;
        overflow-x: auto;
    }

    .table {
        width: 100%;
    }

    .table thead th {
        background-color: #009475;
        color: #fff;
        padding: 15px;
        text-align: center;
        white-space: nowrap;
    }

    .table tbody td {
        padding: 15px;
        text-align: center;
        border-bottom: 1px solid #ccc;
        white-space: nowrap;
    }

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

    .btn-solicitar {
        background-color: #009475;
        color: #fff;
        transition: background-color 0.3s;
    }

    .btn-solicitar:hover {
        background-color: #2ECC71;
    }
</style>

<body>

<nav class="navbar">
    <div class="container d-flex justify-content-between align-items-center">
        <a class="navbar-brand" href="inicio.jsp">
            <img src="assets/img/sigebi%20logo2.png" alt="SIGEBI Logo">
        </a>
        <div class="nav-item">

        </div>
        <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#sidebarCollapse">
            <i class="fas fa-bars"></i>
        </button>
    </div>
</nav>

<div class="sidebar hide">
    <ul>
        <li><a href="inicio.jsp" class="fas fa-home"> Inicio</a></li>
        <li><a href="#" class="fas fa-users"> Revisar Usuarios</a></li>
        <li><a id="cerrarSesion" href="index.jsp"><i class="fas fa-sign-out-alt"></i>Cerrar Sesión</a></li>
    </ul>
</div>

<div class="container-tab">
    <div class="table-container">
        <h2 class="text-center mb-4">Salas</h2>

        <table class="table table-bordered table-striped">
            <thead>
            <tr>
                <th>Sala</th>
                <th>Capacidad Maxima</th>
                <th>Estado</th>
                <th>Solicitar sala</th>
            </tr>
            </thead>
            <c:forEach items="${tablasalas}" var="s">
                <tbody>
                <tr>
                    <td>${s.nombre}</td>
                    <td>${s.capacidad_maxima}</td>
                    <td>${s.estadoTexto}</td>
                    <td><a class="btn btn-solicitar" href="${pageContext.request.contextPath}/PedirSalaServlet?id=${s.id_sala}">Solicitar Sala</a></td>
                </tr>
                </tbody>
            </c:forEach>
        </table>
    </div>
</div>
<div class="sidebar-overlay"></div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
<script>
    $(document).ready(function () {
        $(".navbar-toggler").click(function () {
            $(".sidebar").toggleClass("show hide");
            $(".navbar-toggler").toggleClass("hidden");
            $("body").toggleClass("sidebar-open");
        });
        $(".btn-eliminar").click(function () {
            var fila = $(this).closest("tr");
            fila.remove();
        });

        $(document).click(function (event) {
            if (!$(event.target).closest(".sidebar, .navbar-toggler").length) {
                $(".sidebar").removeClass("show").addClass("hide");
                $(".navbar-toggler").removeClass("hidden");
                $("body").removeClass("sidebar-open");
            }
        });
    });

    document.getElementById("cerrarSesion").addEventListener("click", function () {

        var xhr = new XMLHttpRequest();
        xhr.open("GET", "CloseSession", true);
        xhr.send();

        window.location.href = "index.jsp";

    });

</script>

</body>
</html>