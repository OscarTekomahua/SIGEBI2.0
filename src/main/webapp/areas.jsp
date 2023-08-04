<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>SIGEBI</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.css">
  <link rel="stylesheet" type="text/css" href="css/estilos.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/hover.css/2.3.1/css/hover-min.css">
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,400;0,700;1,400&display=swap');

    body {
      font-family: 'Montserrat', sans-serif;
      background-color: #ffffff;
      color: #eee;
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

    .carousel-img {
      max-height: 500px;
    }


    .dropdown-menu {
      background-color: #ffffff00;
      color: #ffffff00;
    }
    .image-circles {
      display: flex;
      justify-content: center;
      margin-top: 30px;
    }

    .circle-image {
      width: 200px; /* Ajusta el tamaño del contenedor circular según tus necesidades */
      height: 200px; /* Ajusta el tamaño del contenedor circular según tus necesidades */
      border-radius: 50%;
      overflow: hidden;
      margin: 0 10px;
      position: relative;
    }

    .circle-image img {
      width: 100%;
      height: 100%;
      object-fit: cover;
    }

    .circle-text {
      position: absolute;
      bottom: 0;
      left: 0;
      width: 100%;
      text-align: center;
      color: #eee;
      font-size: 14px;
      font-weight: bold;
      text-transform: uppercase;
      padding: 10px;
      background-color: rgba(0, 0, 0, 0.7);
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


    /* Cambiamos la dirección del ícono cuando el menú está desplegado */
    .dropdown-toggle[aria-expanded="true"]::after {
      transform: rotate(90deg);
    }

    /* Eliminamos el subrayado al pasar el cursor sobre el botón */
    .navbar-nav .nav-item .nav-link:hover {
      text-decoration: none;
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
          <a class="nav-link" href="#">Bibliotecas</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Contacto</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
<br>
<br>
<br>
<div class="image-circles">
  <!-- Primer círculo -->
  <div class="circle-image hvr-float">
    <img src="assets/img/img.png" alt="Imagen 1">
    <div class="circle-text">Ciencias Fisico-Matematicas e Ingenierias</div>
  </div>
  <!-- Segundo círculo -->
  <div class="circle-image hvr-float">
    <img src="assets/img/img2.png" alt="Imagen 2">
    <div class="circle-text">Ciencias Biologicas, Quimicas y de la Salud</div>
  </div>
  <!-- Tercer círculo -->
  <div class="circle-image hvr-float">
    <img src="assets/img/img3.png" alt="Imagen 3">
    <div class="circle-text">Ciencias <br> Sociales</div>
  </div>
</div>
<div class="image-circles">
  <!-- Cuarto círculo -->
  <div class="circle-image hvr-float">
    <img src="assets/img/humanidades.jpg" alt="Imagen 4">
    <div class="circle-text">Humanidades <br> y Artes</div>
  </div>

  <!-- Quinto círculo -->
  <div class="circle-image hvr-float">
    <img src="assets/img/literatura.jpg" alt="Imagen 5">
    <div class="circle-text">Literatura</div>
  </div>

  <!-- Sexto círculo -->
  <div class="circle-image hvr-float">
    <img src="assets/img/lengua.jpeg" alt="Imagen 6">
    <div class="circle-text">Lenguas</div>
  </div>
  <!-- Septimo círculo -->
  <div class="circle-image hvr-float">
    <img src="assets/img/historia.jpg" alt="Imagen 6">
    <div class="circle-text">Historia</div>
  </div>
</div>

<script src="assets/js/bootstrap.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
