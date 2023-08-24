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
  <title>Agregar Libro</title>
</head>
<style>
  @import url('https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,400;0,700;1,400&display=swap');

  body {
    font-family: 'Montserrat', sans-serif;
    background-color: #ffffff;
    color: #eee;
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

  .navbar-nav .nav-item .nav-link:hover {
    text-decoration: none;
  }

  label, h3 {
    color: black;
  }

  .btn-agregar {
    background-color: #005ec9;
    margin-top: 20px;
  }

  /* Estilos del Menú Lateral */
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

  /* Estilo para oscurecer el fondo cuando el sidebar esté abierto */
  .sidebar-open {
    overflow: hidden;
  }

  .sidebar-open .container {
    opacity: 0.6;
    pointer-events: none;
  }

  .sidebar-open .container mt-5{
    opacity: 0.6;
    pointer-events: none;
  }

  .addNewCat {
    background-color: #005ec9;
    margin-top: 20px;
    margin-left: 20px;
    padding: 10px 20px;
    margin: 5px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
    color: #ffffff;
    transition: background-color 0.3s;
  }

  .addNewEdit {
    background-color: #005ec9;
    margin-top: 20px;
    margin-left: 20px;
    padding: 10px 20px;
    margin: 5px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
    color: #ffffff;
    transition: background-color 0.3s;
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

  .btnsala {
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


</style>

<body>
<nav class="navbar">
  <div class="container">
    <a class="navbar-brand" href="admin.jsp">
      <img src="assets/img/sigebi%20logo2.png" alt="SIGEBI Logo">
    </a>
    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#sidebarCollapse">
      <i class="fas fa-bars"></i>
    </button>
  </div>
</nav>
<div class="sidebar hide">
  <ul>
    <!-- Agregamos los iconos de Font Awesome a las opciones del menú -->
    <li><a href="admin.jsp"><i class="fas fa-home"></i> Inicio</a></li>
    <!-- Botón con el efecto de aclarado en las letras -->
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

<div class="container mt-5">
  <div class="row justify-content-center">
    <div class="col-lg-6">
      <div class="d-flex justify-content-between mb-3">
        <a class="addNewCat" href="formulariocategoriaAdmin.jsp">
         Nueva Categoria <i class="fas fa-plus-circle fa-sm"></i></a>
        <a class="addNewEdit" href="formularioeditorialAdmin.jsp">
         Nueva Editorial <i class="fas fa-plus-circle fa-sm"></i></a>
      </div>
      <div class="card">
        <div class="card-body">
          <h3 class="card-title text-center mb-4">Registro de Libros</h3>
          <form method="post" action="AddNewBookAdmin" enctype="multipart/form-data">
            <div class="form-group">
            </div>
            <div class="form-group">
              <label><strong>ISBN:</strong></label>
              <input type="text" class="form-control" id="isbn" name="isbn" placeholder="Ingresa ISBN del Libro" >
            </div>
            <div class="form-group">
              <label><strong>Título:</strong></label>
              <input type="text" class="form-control" id="titulo" name="titulo" placeholder="Ingresa Nombre del Libro" >
            </div>
            <div class="form-group">
              <label><strong>Autor:</strong></label>
              <input type="text" class="form-control" id="autor" name="autor" placeholder="Ingresa Autor del Libro" >
              <label for="editoriales"><strong>Editorial:</strong></label>
            </div>
            <div class="form-group">
              <label>
                <c:forEach items="${editoriales}" var="e">
                  <input type="checkbox" id="editoriales" name="editoriales" value="${e.id_editorial}"> ${e.nombre} <br>
                </c:forEach>
              </label> <br>
              <label for="categorias"><strong>Categoría:</strong></label>
            </div>
            <div class="form-group">
              <label>
                <c:forEach items="${categorias}" var="c">
                  <input type="checkbox" id="categorias" name="categorias" value="${c.id_categoria}"> ${c.nombre_categoria} <br>
                </c:forEach>
              </label>
            </div>
            <div class="form-group">
              <label><strong>Ejemplares:</strong></label>
              <input type="number" class="form-control" id="ejemplares" name="ejemplares" placeholder="Ingresa Ejemplares del Libro" min="1">
            </div>
            <div class="form-group">
              <label><strong>Imagen:</strong></label>
              <input type="file" class="form-control" id="imagen" name="imagen" accept="image/*">
            </div>
            <button type="submit" class="btn btn-agregar" name="accion ">Agregar Libro</button>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
<script>

  $(document).ready(function () {
    // Función para mostrar/ocultar el menú lateral y el fondo con efecto de deslizamiento
    $(".navbar-toggler").click(function () {
      $(".sidebar").toggleClass("show hide");
      $(".navbar-toggler").toggleClass("hidden"); // Agrega la clase 'hidden' al botón del icono
      $("body").toggleClass("sidebar-open");
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
</html>