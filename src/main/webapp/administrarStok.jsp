<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="assets/css/estilos.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/hover.css/2.3.1/css/hover-min.css">
    <title>Revisar Historial</title>
</head>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,400;0,700;1,400&display=swap');
    body {
        font-family: 'Montserrat', sans-serif; /* Agregamos la fuente Montserrat */
        margin: 0;
        padding: 0;
    }

    .container-fluid {
        padding-left: 0;
        padding-right: 0;
    }

    .table-container {
        max-width: 100%;
        overflow-x: auto;
    }

    .table {
        min-width: 800px;
        margin: 0 auto;
    }

    footer {
        margin-top: 30px;
    }

    /* Ajustar el espacio del navbar */
    .navbar {
        background-color: #009475;
        min-height: 100px; /* Ajusta la altura del navbar para evitar que se descuadre */
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

    /* Agregar un margen al contenedor principal para evitar que el navbar se superponga */
    .main-content {
        margin-top: 100px; /* Ajusta el valor según lo que necesites */
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
    .container {
        margin-left: 250px;
        padding-top: 30px;
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

    .btn-modificar {
        background-color: #175bda;
    }

    .btn-agregar {
        background-color: #175bda;
        margin-top: 30px;
        margin-left: 30px;
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

    .navbar-brand {
        margin-right: 250px;
    }

    .form-inline {
        margin-right: 700px;
    }
</style>
</head>

<body>

<nav class="navbar">
    <div class="container">
        <a class="navbar-brand" href="inicio.jsp">
            <img src="assets/img/sigebi%20logo2.png" alt="SIGEBI Logo">
        </a>
        <!-- Buscador -->
        <form class="form-inline mx-auto">
            <input id="searchInput" class="form-control mr-2" type="search" placeholder="Buscar" aria-label="Buscar">
            <button class="btn btn-outline-success" type="button" id="searchButton">Buscar</button>
        </form>
        <!-- Botón del menú -->
        <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#sidebarCollapse">
            <!-- Reemplazar el icono de tres líneas por uno de Font Awesome (fa-bars) -->
            <i class="fas fa-bars"></i>
        </button>
    </div>
</nav>
<div class="sidebar hide">
    <ul>
        <li><a href="revisarHistorial.jsp">Revisar Historial</a></li>
        <li><a href="administrarStok.jsp">Administrar Stock</a></li>
        <li><a href="#">Revisar Usuarios</a></li>
        <li><a href="#">Cerrar Sesión</a></li>
    </ul>
</div>

<form action="AgregarLibroServlet" method="get">
    <input type="hidden" name="operacion" value="nuevolibro">
    <button type="submit" href="agregarlibro.jsp" class="btn btn-agregar">Agregar Libro</button>
</form>

<div class="container-fluid main-content">
    <div class="table-container">
        <h2 class="text-center mb-4">Libros Disponibles</h2>

        <table class="table table-bordered table-striped">
            <thead>
            <tr>
                <th>ISBN</th>
                <th>Titulo</th>
                <th>Autor</th>
                <th>Editorial</th>
                <th>Categoria</th>
                <th>Stock</th>
                <th>Acciones</th>
            </tr>
            </thead>
            <c:forEach items="${tablalibros}" var="libro">
                <tbody>
                <tr>
                    <td>${libro.isbn}</td>
                    <td>${libro.titulo}</td>
                    <td>${libro.autor}</td>
                    <td>${libro.editorial}</td>
                    <td>${libro.categoria}</td>
                    <td>${libro.ejemplares}</td>
                    <td>
                        <a class="btn btn-eliminar" href="${pageContext.request.contextPath}/deleteBook?id=${libro.id_libro}">Eliminar</a>
                        <form action="modificar" method="get">
                            <input type="hidden" name="operacion" value="modificar"/>
                        <button type="submit" class="btn btn-modificar">Modificar</button>
                        </form>
                    </td>
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

    document.addEventListener("DOMContentLoaded", function () {
        const searchInput = document.getElementById("searchInput");
        const tableRows = document.querySelectorAll(".table tbody tr");

        function filterTable(event) {
            const searchTerm = event.target.value.toLowerCase();
            tableRows.forEach(row => {
                const rowData = row.textContent.toLowerCase();
                if (rowData.includes(searchTerm)) {
                    row.style.display = "";
                } else {
                    row.style.display = "none";
                }
            });
        }
        searchInput.addEventListener("input", filterTable);
    });
</script>
</body>

</html>