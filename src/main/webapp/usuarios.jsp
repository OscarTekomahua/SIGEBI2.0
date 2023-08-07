<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="assets/css/bootstrap.min.css">
  <title>Administrar Usuarios</title>
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
      margin-left: 250px;
      padding-top: 30px;
    }

    .table-container {
      max-width: 800px;
      border-collapse: collapse;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
      border-radius: 10px;
      overflow: hidden;
    }

    .table {
      width: 100%;
    }

    .table thead th {
      background-color: #009475;
      color: #fff;
      padding: 15px;
      text-align: center;
    }

    .table tbody td {
      padding: 15px;
      text-align: center;
      border-bottom: 1px solid #ccc;
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
    }

    .btn-aceptar {
      background-color: #2ecc71;
    }

    .btn:hover {
      opacity: 0.8;
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
      background-color: #009475;
      color: #fff;
      border: none;
      border-radius: 5px;
      padding: 8px 15px;
      font-size: 14px;
      cursor: pointer;
      transition: background-color 0.3s;
    }

    .btn-modificar:hover {
      background-color: #007c6e;
    }
    .buscador {
      width: 450px;
    }

  </style>
</head>

<body>
<nav class="navbar">
  <div class="container d-flex justify-content-between align-items-center">
    <a class="navbar-brand" href="bibliotecario.jsp">
      <img src="assets/img/sigebi%20logo2.png" alt="SIGEBI Logo">
    </a>
    <div class="nav-item">
      <form class="d-flex" id="searchForm">
        <input class="form-control me-2 buscador" type="search" placeholder="Buscar por Nombre, apellido, matrícula"
               aria-label="Buscar" id="searchInput">
        <button class="btn btn-outline-success" type="submit">Buscar</button>
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
    <li><a href="#"><i class="fas fa-history"></i> Revisar Historial</a></li>
    <li><a href="#"><i class="fas fa-box-open"></i> Administrar Stock</a></li>
    <li><a href="#"><i class="fas fa-users"></i> Revisar Usuarios</a></li>
    <li><a href="#"><i class="fas fa-sign-out-alt"></i> Cerrar Sesión</a></li>
    <!-- Agrega más opciones de menú aquí -->
  </ul>
</div>

<div class="container-tab">
  <div class="table-container">
    <table class="table">
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

<!-- Agrega un div que servirá como fondo cuando el menú esté abierto -->
<div class="sidebar-overlay"></div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- Agrega Font Awesome para tener acceso a los iconos -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/js/all.min.js"></script>
<script>
  $(document).ready(function () {
    // Función para mostrar/ocultar el menú lateral y el fondo con efecto de deslizamiento
    $(".navbar-toggler").click(function () {
      $(".sidebar").toggleClass("show hide");
      $(".navbar-toggler").toggleClass("hidden"); // Agrega la clase 'hidden' al botón del icono
      $("body").toggleClass("sidebar-open");
    });
    $(".btn-eliminar").click(function () {
      var fila = $(this).closest("tr");
      fila.remove();
    });

    // Cierra el menú cuando se hace clic fuera del menú
    $(document).click(function (event) {
      if (!$(event.target).closest(".sidebar, .navbar-toggler").length) {
        $(".sidebar").removeClass("show").addClass("hide");
        $(".navbar-toggler").removeClass("hidden"); // Elimina la clase 'hidden' del botón del icono
        $("body").removeClass("sidebar-open");
      }
    });
  });

</script>
<script>
  document.getElementById('searchForm').addEventListener('submit', function (event) {
    event.preventDefault();

    const searchTerm = document.getElementById('searchInput').value.toLowerCase();
    const tableRows = document.querySelectorAll('.table tbody tr');

    for (let row of tableRows) {
      const dataCells = row.querySelectorAll('td');
      let match = false;

      dataCells.forEach(cell => {
        if (cell.textContent.toLowerCase().includes(searchTerm)) {
          match = true;
        }
      });

      if (match) {
        row.style.display = 'table-row';
      } else {
        row.style.display = 'none';
      }
    }
  });
</script>
</body>

</html>
