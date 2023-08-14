<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
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
  <title>Registrar Nuevo Usuario</title>
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,400;0,700;1,400&display=swap');
    body {
      font-family: 'Montserrat', sans-serif; /* Agregamos la fuente Montserrat */
      margin: 0;
      padding: 0;
    }

    footer {
      margin-top: 30px;
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

    .container {
      margin-left: 250px;
      padding-top: 30px;
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
    .container {
      max-width: 400px;
      margin: 50px auto;
      padding: 20px;
      background-color: #fff;
      border-radius: 8px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    h1 {
      text-align: center;
      margin-bottom: 20px;
      color: #333;
    }

    .form-group {
      margin-bottom: 20px;
    }

    label {
      display: block;
      font-weight: bold;
      margin-bottom: 5px;
    }

    input,
    select {
      width: 100%;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 4px;
    }

    button {
      display: block;
      width: 100%;
      padding: 10px;
      background-color: #007bff;
      color: #fff;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }

    button:hover {
      background-color: #0056b3;
    }

    button:active {
      background-color: #004080;
    }
    .navbar-toggler{
      width: 40px;
    }
  </style>
</head>
<body>
<nav class="navbar">
  <div class="contenedor">
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
    <li><a href="usuariosadmin.jsp">Gestionar Usuarios</a></li>
    <li><a href="agregarlibroAdmin.jsp">Gestionar Libros</a></li>
    <li><a href="editorialesAdmin.jsp">Editoriales</a></li>
    <li><a href="categoriasAdmin.jsp">Categorias</a></li>
    <li><a href="salasAdmin.jsp">Gestionar Salas</a></li>
    <li><a href="#">Cerrar Sesión</a></li>
  </ul>
</div>
<div class="container">
  <h1>Alta de Usuario</h1>
  <form id="altaUsuarioForm" method="post" action="NewUserForAdmin">
    <div class="form-group">
      <label for="nombre">Nombre:</label>
      <input type="text" id="nombre" name="nombre" required>
    </div>
    <div class="form-group">
      <label for="apellidoPaterno">Apellido Paterno:</label>
      <input type="text" id="apellidoPaterno" name="apellidoPaterno" required>
    </div>
    <div class="form-group">
      <label for="apellidoMaterno">Apellido Materno:</label>
      <input type="text" id="apellidoMaterno" name="apellidoMaterno" required>
    </div>
    <div class="form-group">
      <label for="correo">Correo electrónico:</label>
      <input type="email" id="correo" name="correo" required>
    </div>
    <div class="form-group">
      <label for="rol">Rol:</label>
      <select id="rol" name="rol" required>
        <c:forEach items="${roles}" var="rol">
          <option value="${rol.id_rol}">${rol.tipo_usuario}</option>
        </c:forEach>
      </select>
    </div>
    <div class="form-group">
      <label for="contra"><b>Contraseña: </b></label>
      <input type="password" name="contra" id="contra" placeholder="Ingrese su contraseña" required>
    </div>
    <div class="form-group">
      <label for="recontrasena"><b>Repetir Contraseña: </b></label>
      <input type="password" name="recontrasena" id="recontrasena" value="" placeholder="Confirme su contraseña" required>
    </div>

    <button type="submit">Registrar</button>
  </form>
  <c:if test="${not empty error}">
    <p>${error}</p>
  </c:if>


  <script type="text/javascript">

    function validarPasswords() {
      var pass = document.getElementById('contra').value;
      var repass = document.getElementById('recontrasena').value;
      var correo = document.getElementById('correo').value;
      var nom = document.getElementById('nombre').value;
      var apellido1 = document.getElementById('apellido1').value;
      var apellido2 = document.getElementById('apellido2').value;
      if (correo.trim() === '' || pass.trim() === '' || repass.trim() === ''|| nom.trim()=='' || apellido1.trim()=='' || apellido2.trim()=='') {
        alert("Por favor, complete todos los campos.");
        return;
      }
      if (pass !== repass) {
        alert("Las contraseñas no coinciden.");
      } else {
        document.getElementById("frm").submit();
      }
    }

  </script>
</div>
<div class="sidebar-overlay"></div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
<script>
  $(document).ready(function () {
    // Función para mostrar/ocultar el menú lateral y el fondo con efecto de "blur"
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


</body>
</html>
