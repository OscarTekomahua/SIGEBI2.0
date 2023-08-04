<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
  <link rel="stylesheet" type="text/css" href="css/estilos.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/hover.css/2.3.1/css/hover-min.css">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
  <title>Libro</title>
  <script src="assets/js/bootstrap.bundle.min.js"></script>

  <style>
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

    .article-container {
      display: flex;
      align-items: flex-start;
      max-width: 800px;
      margin: 0 auto;
      padding: 20px;
      background-color: #FFFF;
      margin-top: 40px;
      margin-left: 40px;
    }

    .article-image {
      flex: 1;
      padding-right: 30px;
    }

    .article-content {
      flex: 2;
    }

    .article-image img {
      max-width: 100%;
      height: auto;
    }

    h1 {
      margin-top: 0;
      color: #002E60;
    }

    h2 {
      margin-top: 0;
      color: #002E60;
    }

    p {
      margin-bottom: 20px;
      color: #002E60;
    }

    .Logo {
      width: 100px;
      height: 40px;
    }

    .form {
      width: 500px;
      border: 1px solid black;
      border-radius: 20px;
      /* Valor alto para obtener esquinas redondeadas */
      padding: 10px;
      font-size: 16px;

    }

    .btn-boton {
      margin-left: 10px;
      display: inline-block;
      padding: 10px 20px;
      background-color: #4CAF50;
      /* Color de fondo */
      color: #fff;
      /* Color del texto */
      font-size: 16px;
      border: none;
      border-radius: 4px;
      /* Bordes redondeados */
      cursor: pointer;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      /* Sombra */
      transition: background-color 0.3s, transform 0.1s;

    }

    .dropdown-menu {
      background-color: #009475;
      color: #eee;
      border: none;
    }

    .dropdown-menu a {
      color: #eee;
      text-decoration: none;
      font-size: 16px;
      transition: color 0.3s ease;
    }

    .dropdown-menu a:hover {
      color: #002E60;
      background-color: #fff;
    }

    .btn {
      display: inline-block;
      padding: 10px 20px;
      background-color: #4CAF50;
      /* Color de fondo */
      color: #fff;
      /* Color del texto */
      font-size: 16px;
      border: none;
      border-radius: 4px;
      /* Bordes redondeados */
      cursor: pointer;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      /* Sombra */
      transition: background-color 0.3s, transform 0.1s;
    }

    /* Estilo al pasar el mouse sobre el botón */
    .btn:hover {
      background-color: #45a049;
      transform: scale(1.05);
      /* Escala ligeramente más grande */
    }

    /* Estilo al hacer clic en el botón */
    .btn:active {
      transform: scale(0.95);
      /* Escala ligeramente mas pequeno */
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
      /* Sombra mas suave */
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
          <a class="nav-link" href="#">Inicio</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
             data-bs-toggle="dropdown" aria-expanded="false">
            Servicios
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="servicios.jsp">Solicitar Sala</a></li>
            <li><a class="dropdown-item" href="libros.jsp">Solicitar Libro</a></li>
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



<div style="background-color: grey; border: 1px solid; margin-top: 40px;"></div>

<center>
  <div class="article-container">
    <div class="article-image">
      <img src="assets/img/imagen1.jpg" alt="Imagen del artículo">
      <p>Autor: J. K. Rowling</p>
      <p>Editorial: Salamandra</p>
      <p>ISBN: 9786073193511</p>
      <br>
      <button class="btn">Solicitar libro</button>
    </div>
    <div class="article-content">
      <h1>Harry Potter y La Piedra Filosofal</h1>
      <p>"Harry Potter y la Piedra Filosofal" es el primer libro de la famosa serie de novelas escrita por la
        autora británica J.K. Rowling. Fue publicado en 1997 y se convirtió en un fenómeno mundial,
        atrayendo a
        lectores de todas las edades y estableciéndose como un ícono de la literatura fantástica moderna.
      </p>
      <p>La historia comienza con el joven Harry Potter, un niño huérfano de once años que vive con sus
        desagradables parientes, los Dursley, después de que sus padres murieran en un misterioso accidente.
        Sin
        embargo, la vida de Harry da un giro inesperado en su cumpleaños número once, cuando descubre que es
        un
        mago y ha sido aceptado para asistir a la prestigiosa escuela de magia y hechicería, Hogwarts.</p>
      <p>En Hogwarts, Harry hace amigos, como Hermione Granger y Ron Weasley, y aprende sobre el mundo de la
        magia, su historia y las amenazas que lo rodean. Pronto, Harry se entera de la leyenda de la Piedra
        Filosofal, un antiguo objeto que otorga inmortalidad y grandes poderes al que lo posea. Harry
        descubre
        que alguien está tratando de robar la Piedra y emprende una peligrosa aventura para detenerlos.</p>
    </div>
  </div>
</center>



<div style=" margin-left: 65%; margin-top: -40%;" class="col-md-4">
  <h2>      Sugerencias</h2>

  <!-- Añade tus sugerencias o información adicional aquí -->
  <!-- Carrusel de sugerencias -->
  <div id="carouselSugerencias" class="carousel slide" data-bs-ride="carousel">
    <!-- Indicadores -->
    <ol class="carousel-indicators">
      <li data-bs-target="#carouselSugerencias" data-bs-slide-to="0" class="active"></li>
      <li data-bs-target="#carouselSugerencias" data-bs-slide-to="1"></li>
      <li data-bs-target="#carouselSugerencias" data-bs-slide-to="2"></li>
      <!-- Añade más indicadores según el número de imágenes en el carrusel -->
    </ol>

    <!-- Slides del carrusel -->
    <div  class="carousel-inner">
      <div class="carousel-item active">
        <img style="height: 300px;" src="assets/img/imagen2.jpg" class="d-block w-100" alt="Sugerencia 1">
      </div>
      <div class="carousel-item">
        <img style="height: 300px;" src="assets/img/imagen3.jpg" class="d-block w-100" alt="Sugerencia 2">
      </div>
      <div class="carousel-item">
        <img style="height: 300px;" src="assets/img/imagen4.jpg" class="d-block w-100" alt="Sugerencia 3">
      </div>
      <!-- Añade más slides según el número de imágenes en el carrusel -->
    </div>

    <!-- Controles del carrusel -->
    <a class="carousel-control-prev" href="#carouselSugerencias" role="button" data-bs-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Anterior</span>
    </a>
    <a class="carousel-control-next" href="#carouselSugerencias" role="button" data-bs-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Siguiente</span>
    </a>
  </div>
</div>


<div style="background-color: grey; border: 1px solid; margin-top: 18%;"></div>

<script src="assets/js/bootstrap.bundle.min.js"></script>



</body>

</html>
