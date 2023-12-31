<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="assets/css/estilos.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/hover.css/2.3.1/css/hover-min.css">
    <title>Libros en el inventario</title>
</head>
<style>

    @import url('https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,400;0,700;1,400&display=swap');

    body {
        font-family: 'Montserrat', sans-serif;
        background-color: #f2f2f2;
        color: #333;
        margin: 0;
    }

    .navbar {
        background-color: #002E60;
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
        color: #fff;
        transition: background-color 0.3s;
    }

    .btn-eliminar:hover {
        background-color: #F1948A;
    }

    .btn-agregar {
        background-color: #005ec9;
    }

    .btn-agregar:hover {
        background-color: #AED6F1;
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

    .btn-modificar {
        background-color: #3498DB;
        color: #fff;
        transition: background-color 0.3s;
    }

    .btn-modificar:hover {
        background-color: #AED6F1;
    }

    .buscador {
        background-color: #009475;
    }


    .btnstock {
        background-color: transparent; /* Sin color de fondo */
        color: #000;
        border: none;
        border-radius: 5px;
        font-size: 18px;
        cursor: pointer;
        transition: color 0.3s;
    }

    /* Estilos para el aclarado al pasar el mouse */
    .btnstock:hover {
        color: #009475; /* Color de letras ligeramente más claro */
    }
    .btnusu {
        background-color: transparent; /* Sin color de fondo */
        color: #000;
        border: none;
        border-radius: 5px;
        font-size: 18px;
        cursor: pointer;
        transition: color 0.3s;
    }

    /* Estilos para el aclarado al pasar el mouse */
    .btnusu:hover {
        color: #009475; /* Color de letras ligeramente más claro */
    }
    .btnsala{
        background-color: transparent; /* Sin color de fondo */
        color: #000;
        border: none;
        border-radius: 5px;
        font-size: 18px;
        cursor: pointer;
        transition: color 0.3s;
    }

    /* Estilos para el aclarado al pasar el mouse */
    .btnsala:hover {
        color: #009475; /* Color de letras ligeramente más claro */
    }

    /* Estilo para el botón de regresar con ícono */
    .btn-secondary {
        background-color: rgba(0, 74, 148, 0.58); /* Color de fondo416da9 002E60 */
        color: #ffffff; /* Color del ícono */
        padding: 10px; /* Espaciado interior del botón */
        text-decoration: none; /* Elimina subrayado del ícono */
        border: none; /* Elimina el borde del botón */
        cursor: pointer; /* Cambia el cursor al pasar por encima */
        border-radius: 5px; /* Bordes redondeados */
        transition: background-color 0.3s, color 0.3s; /* Transición de color al pasar el mouse */
    }

    /* Estilo para el botón de regresar al pasar el mouse */
    .btn-secondary:hover {
        background-color: #384664; /* Cambia el color de fondo al pasar el mouse */
        color: #fff; /* Cambia el color del ícono al pasar el mouse */
    }

    /* Estilo para el ícono */
    .btn-secondary i {
        margin-right: 5px; /* Espacio entre el ícono y el texto (en este caso, el ícono y el botón) */
    }
</style>
<body>
<nav class="navbar">
    <a href="javascript:history.go(-1)" class="btn btn-secondary">
        <i class="fas fa-arrow-left"></i> <!-- Icono de flecha hacia atrás -->
    </a>
    <div class="container d-flex justify-content-between align-items-center">
        <a class="navbar-brand" href="admin.jsp">
            <img src="assets/img/sigebi%20logo2.png" alt="SIGEBI Logo">
        </a>
        <div class="nav-item">
            <input id="searchInput" class="form-control mr-2" type="search" placeholder="Buscar"
                   aria-label="Buscar">
        </div>
        <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#sidebarCollapse">
            <i class="fas fa-bars"></i>
        </button>
    </div>
</nav>
<div class="sidebar hide">
    <ul>
        <!-- Agregamos los iconos de Font Awesome a las opciones del menú -->
        <li><a href="admin.jsp"><i class="fas fa-home"></i> Inicio</a></li>
        <li>
            <form action="mostrarlibrosadmin" method="get">
                <input type="hidden" name="operacion" value="stocklibros">
                <button type="submit" class="btnstock">
                    <i class="fas fa-stream"></i> Stock de libros
                </button>
            </form>
        </li>
        <li>
            <form action="readUsersAdmin" method="get">
                <input type="hidden" name="operacion" value="usuarios">
                <button type="submit" class="btnusu"><i class="fas fa-users"> </i>Gestionar Usuarios</button>
            </form>
        </li>
        <li>
            <form action="salasAdmin" method="get">
                <input type="hidden" name="operacion" value="tablasalas">
                <button type="submit" class="btnsala"><i class="fas fa-door-open"> </i>Gestionar Salas</button>
            </form>
        </li>
        <li><a href="#" id="botonCerrarSesion"><i class="fas fa-sign-out-alt"></i> Cerrar Sesión</a></li>
        <!-- Agrega más opciones de menú aquí -->
    </ul>
</div>


<div class="container-tab">
    <div class="table-container">

        <form style="text-align: center" action="AddNewBookAdmin" method="get">
            <h2 class="text-center mb-4">Stock de libros
                <button class="btn btn-agregar">
                    <input type="hidden" name="operacion" value="nuevolibro">
                    <i class="fas fa-book"></i> <!-- Icono de libro -->
                    <i class="fas fa-plus"></i> <!-- Icono de más -->
                </button>
            </h2>
        </form>


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
                        <a class="btn btn-eliminar" onclick="checkPrestamo('${libro.titulo}', '${libro.id_libro}')">Eliminar</a>
                        <form action="updateBook" method="get">
                            <button type="submit" class="btn btn-modificar">Modificar</button>
                            <input type="hidden" name="opcion" value="updateBook"/>
                            <input type="hidden" name="id" value="${libro.id_libro}"/>
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

        $(document).click(function (event) {
            if (!$(event.target).closest(".sidebar, .navbar-toggler").length) {
                $(".sidebar").removeClass("show").addClass("hide");
                $(".navbar-toggler").removeClass("hidden");
                $("body").removeClass("sidebar-open");
            }
        });
    });

    document.getElementById("botonCerrarSesion").addEventListener("click", function () {

        var xhr = new XMLHttpRequest();
        xhr.open("GET", "CloseSession", true);
        xhr.send();

        window.location.href = "index.jsp";

    });

    function checkPrestamo(LibroTitulo, libroID) {
        let prestamo = []
        <c:forEach items="${estadolibros}" var="prestamo">
        prestamo.push({titulo:"${prestamo.tituloLibro}", estado:"${prestamo.estadoPrestamo}"})
        </c:forEach>

        if (prestamo.length === 0) {
            window.location.href =  "${pageContext.request.contextPath}/deleteBookadmin?id="+libroID;
        }

        for (let index = 0; index < prestamo.length; index++) {
            const element = prestamo[index];
            if (LibroTitulo === element.titulo) {
                return alert(LibroTitulo+" esta en prestamo actualmente, no se puede borrar")
            }else {
                $(".btn-eliminar").click(function () {
                    var fila = $(this).closest("tr");
                    fila.remove();
                });
                window.location.href =  "${pageContext.request.contextPath}/deleteBookadmin?id="+libroID;
            }
        }
    }
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