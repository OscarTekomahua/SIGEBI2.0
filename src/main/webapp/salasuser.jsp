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
    <title>Salas</title>
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

    .sidebar-menu {
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

    .sidebar-open .tabs {
        opacity: 0.6;
        pointer-events: none;
    }
    /* Estilo para oscurecer el fondo cuando el sidebar esté abierto */
    .sidebar-open {
        overflow: hidden;

    }

    .sidebar-open .carousel {
        opacity: 0.6;
        pointer-events: none;
    }
    .sidebar-open .container {
        opacity: 0.6;
        pointer-events: none;
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


    .btn-solicitar {
        background-color: #009475;
        color: #fff;
        transition: background-color 0.3s;
    }

    .btn-solicitar:hover {
        background-color: #2ECC71;
    }

    .tabs {
        overflow: hidden;
        background-color: #009475;
    }

    /* Estilo para los botones de pestañas */
    .tablink {
        background-color: #009475;
        color: #fff;
        border: none;
        outline: none;
        cursor: pointer;
        padding: 10px 20px;
        transition: background-color 0.3s, color 0.3s;
        font-size: 16px;
    }

    /* Cambiar el color de fondo y el color del texto al pasar el mouse */
    .tablink:hover {
        background-color: #2ECC71;
    }

    /* Estilo para el botón de pestaña activa */
    .active-tab {
        background-color: #2ECC71;
    }

    /* Estilo para el botón de pestaña desactivada */
    .inactive-tab {
        background-color: #009475;
    }

    .tabcontent {
        display: none;
    }
</style>

<body>

<div id="Tab1" class="tabcontent">
    <nav class="navbar">
        <div class="container d-flex justify-content-between align-items-center">
            <a class="navbar-brand" href="inicio.jsp">
                <img src="assets/img/sigebi%20logo2.png" alt="SIGEBI Logo">
            </a>
            <div class="tabs">
                <button class="tablink active-tab" onclick="openTab(event, 'Tab1')">Salas</button>
                <button class="tablink inactive-tab" onclick="openTab(event, 'Tab2')">Disponibilidad de salas</button>
            </div>
            <div class="nav-item">
            </div>
            <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#sidebarCollapse">
                <i class="fas fa-bars"></i>
            </button>
        </div>
    </nav>

    <div class="sidebar hide">
        <ul>
            <li><a href="inicio.jsp"><i class="fas fa-home"></i> Inicio</a></li>
            <li><a href="${pageContext.request.contextPath}/mostrarlibrosvista" ><i class="fas fa-book"></i> Solicitar Libro</a></li>
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
                        <td>
                            <a class="btn btn-solicitar" href="${pageContext.request.contextPath}/PedirSalaServlet?id=${s.id_sala}">Solicitar Sala</a>
                        </td>
                    </tr>
                    </tbody>
                </c:forEach>
            </table>
        </div>
    </div>
</div>

<div id="Tab2" class="tabcontent">
    <nav class="navbar">
        <div class="container d-flex justify-content-between align-items-center">
            <a class="navbar-brand" href="inicio.jsp">
                <img src="assets/img/sigebi%20logo2.png" alt="SIGEBI Logo">
            </a>
            <div class="tabs">
                <button class="tablink active-tab" onclick="openTab(event, 'Tab1')">Salas</button>
                <button class="tablink inactive-tab" onclick="openTab(event, 'Tab2')">Disponibilidad de salas</button>
            </div>
            <div class="nav-item">
            </div>
            <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#sidebarCollapse">
                <i class="fas fa-bars"></i>
            </button>
        </div>
    </nav>

    <div class="sidebar hide">
        <ul>
            <li><a href="inicio.jsp"><i class="fas fa-home"></i> Inicio</a></li>
           <li><a href="${pageContext.request.contextPath}/mostrarlibrosvista" ><i class="fas fa-book"></i> Solicitar Libro</a></li>
            <li><a id="cerrarSesion2" href="index.jsp"><i class="fas fa-sign-out-alt"></i>Cerrar Sesión</a></li>
        </ul>
    </div>

    <div class="container-tab">
        <div class="table-container">
            <h2 class="text-center mb-4">Horarios</h2>

            <c:choose>
                <c:when test="${not empty vacios}">
                    <center><h3>${vacios}</h3></center>
                </c:when>
                <c:otherwise>
                    <table class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <th>Sala</th>
                            <th>Disponibilidad</th>
                            <th>Hora de inicio</th>
                            <th>Hora de fin</th>
                        </tr>
                        </thead>
                        <c:forEach items="${salashorarios}" var="sh">
                            <tbody>
                            <tr>
                                <td>${sh.nombreSala}</td>
                                <td>${sh.estado}</td>
                                <td>${sh.hora_inicio}</td>
                                <td>${sh.hora_fin}</td>
                            </tr>
                            </tbody>
                        </c:forEach>
                    </table>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>

<div class="sidebar-overlay"></div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
<script>
    $(document).ready(function () {
        // Función para mostrar/ocultar el menú lateral y el fondo con efecto de deslizamiento
        $(".navbar-toggler").click(function () {
            $(".sidebar").toggleClass("show hide");
            $(".navbar-toggler").toggleClass("hidden");
            $("body").toggleClass("sidebar-open");
        });

        // Cierra el menú cuando se hace clic fuera del menú
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

    document.getElementById("cerrarSesion2").addEventListener("click", function () {

        var xhr = new XMLHttpRequest();
        xhr.open("GET", "CloseSession", true);
        xhr.send();

        window.location.href = "index.jsp";

    });

    function openTab(evt, tabName) {
        var i, tabcontent, tablinks;
        tabcontent = document.getElementsByClassName("tabcontent");
        for (i = 0; i < tabcontent.length; i++) {
            tabcontent[i].style.display = "none";
        }
        tablinks = document.getElementsByClassName("tablink");
        for (i = 0; i < tablinks.length; i++) {
            tablinks[i].style.backgroundColor = "#009475";
        }
        document.getElementById(tabName).style.display = "block";
        evt.currentTarget.style.backgroundColor = "#2ECC71";
    }
    document.getElementById("Tab1").style.display = "block";

    document.getElementById("cerrarSesion").addEventListener("click", function () {
        var xhr = new XMLHttpRequest();
        xhr.open("GET", "CloseSession", true);
        xhr.send();
        window.location.href = "index.jsp";

    });
</script>

</body>
</html>
