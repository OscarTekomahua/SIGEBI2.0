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

  .buscador {
    background-color: #009475;
  }
  /* Estilos para el botón */
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
</style>

<body>

<nav class="navbar">
  <div class="container d-flex justify-content-between align-items-center">
    <a class="navbar-brand" href="bibliotecario.jsp">
      <img src="assets/img/sigebi%20logo2.png" alt="SIGEBI Logo">
    </a>
    <div class="nav-item">
      <form class="d-flex">
        <input id="searchInput" class="form-control mr-2" type="search" placeholder="Buscar" aria-label="Buscar">
        <button class="btn btn-outline-success buscador" type="button" id="searchButton">Buscar</button>
      </form>
    </div>
    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#sidebarCollapse">
      <i class="fas fa-bars"></i>
    </button>
  </div>
</nav>

<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/js/all.min.js"></script>
<div class="sidebar hide">
  <ul>
    <!-- Agregamos los iconos de Font Awesome a las opciones del menú -->
    <li><a href="bibliotecario.jsp"><i class="fas fa-home"></i> Inicio</a></li>
    <li><a href="revisarHistorial.jsp"><i class="fas fa-history"></i> Revisar Historial</a></li>
    <!-- Botón con el efecto de aclarado en las letras -->
    <li>
      <form action="mostrarlibros" method="get">
        <input type="hidden" name="operacion" value="stocklibros">
        <button type="submit" class="btnstock">
          <i class="fas fa-stream"></i> Stock de libros
        </button>
      </form>
    </li>
    <li><a href="usuarios.jsp"><i class="fas fa-users"></i> Revisar Usuarios</a></li>
    <li><a href="#" id="botonCerrarSesion"><i class="fas fa-sign-out-alt"></i> Cerrar Sesión</a></li>
    <!-- Agrega más opciones de menú aquí -->
  </ul>
</div>

<div class="container-tab">
  <div class="table-container">
    <h2 class="text-center mb-4">Préstamos de Salas</h2>

    <table class="table table-bordered table-striped">
      <thead>
      <tr>
        <th>Sala</th>
        <th>Capacidad Maxima</th>
        <th>Nombre de usuario</th>
        <th>Apellido Paterno</th>
        <th>Apellido Materno</th>
        <th>Estado</th>
        <th>Hora de inicio</th>
        <th>Hora final</th>
        <th>Extras</th>
      </tr>
      </thead>
      <c:forEach items="${tablasalas}" var="s">
        <tbody>
        <tr>
          <td>${s.nombreSala}</td>
          <td>${s.capacidadMaxima}</td>
          <td>${s.nombreUsuario}</td>
          <td>${s.apellido1Usuario}</td>
          <td>${s.apellido2Usuario}</td>
          <td>${s.estado}</td>
          <td>${s.hora_inicio}</td>
          <td>${s.hora_fin}</td>
          <td>${s.extras}</td>
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
