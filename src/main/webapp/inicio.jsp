<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${not empty sesion}">
    <!DOCTYPE html>
    <html>
    <head>
        <title>SIGEBI</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
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
                background-color: #009475;
                height: 100px;
                display: flex;
                align-items: center;
                justify-content: flex-end; /* Alinea los elementos del navbar a la derecha */
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
                position: absolute;
                top: 0;
                left: 0;
                margin: 20px;
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

            .image-circles {
                display: flex;
                justify-content: flex-end;
                margin-top: 30px;
            }
            .carousel-img {
                max-height: 500px;
                width: auto; /* Añadimos esta regla para que el ancho se ajuste automáticamente */
                margin: 0 auto; /* Centramos la imagen horizontalmente */
            }
            .carousel-inner .carousel-item img {
                max-height: 300px; /* Ajusta este valor según tus necesidades */
                width: auto;
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

            .circle-textciencias {
                position: fixed;
                bottom: 0;
                left: 0;
                width:100%;
                text-align: center;
                color: #eee;
                font-size: 13px;
                font-weight: bold;
                text-transform: uppercase;
                padding: 25px;
                background-color: rgba(0, 0, 0, 0.7);
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
        </style>
    </head>
    <body>
    <nav class="navbar">
        <div class="container d-flex justify-content-between align-items-center">
            <a class="navbar-brand" href="inicio.jsp">
                <img src="assets/img/sigebi%20logo2.png" alt="SIGEBI Logo">
                <span class="d-none d-md-inline-block">Bienvenido a SIGEBI</span>
            </a>
        </div>
        <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#sidebarCollapse">
            <!-- Reemplazar el icono de tres líneas por uno de Font Awesome (fa-bars) -->
            <i class="fas fa-bars"></i>
        </button>
        </div>
    </nav>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/js/all.min.js"></script>
    <div class="sidebar hide">
        <ul>
            <li><a href="inicio.jsp"><i class="fas fa-home"></i> Inicio</a></li>
            <li><a id="salas" href="salasuser.jsp"><i class="fas fa-calendar-alt"></i> Solicitar Sala</a></li>
            <li><a href="${pageContext.request.contextPath}/mostrarlibrosvista" ><i class="fas fa-book"></i> Solicitar Libro</a></li>
            <li><a id="cerrarSesion" href="index.jsp"><i class="fas fa-sign-out-alt"></i>Cerrar Sesión</a></li>
        </ul>

    </div>
    <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <div class="d-flex justify-content-between">
                    <img src="assets/img/carruselde.jpg" alt="Imagen izquierda" style="max-height: 300px; width: auto;">
                    <img src="assets/img/carrusel1.jpg" class="d-block w-100 carousel-img" alt="Imagen de proyectos Meccri" style="max-height: 300px; width: auto;">
                    <img src="assets/img/carruselde3.jpg" alt="Imagen derecha" style="max-height: 300px; width: auto;">
                </div>
            </div>
            <div class="carousel-item">
                <div class="d-flex justify-content-between align-items-center">
                    <img src="assets/img/inge.jpg" alt="Imagen izquierda" class="carousel-img">
                    <img src="assets/img/quimica.jpg" alt="Imagen de en medio" class="carousel-img">
                    <img src="assets/img/cisco.jpeg" alt="Imagen derecha" class="carousel-img">
                </div>
            </div>
            <div class="carousel-item">
                <div class="d-flex justify-content-between align-items-center">
                    <img src="assets/img/it.jpg" alt="Imagen de proyectos Meccri" class="carousel-img">
                    <img src="assets/img/imagen1.jpg" alt="Imagen derecha" class="carousel-img">
                    <img src="assets/img/orgullo.jpg" alt="Imagen del medio" class="carousel-img">
                </div>
            </div>
        </div>
        <div class="carousel-controls">
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls"
                    data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Anterior</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls"
                    data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Siguiente</span>
            </button>
        </div>
    </div>
    <br>
    <div style="background-color: #002E60;">
        <h1 style="color: #ffffff; font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;"><center>Biblioteca escolar </center></h1>
    </div>
    <div style="background-color: #002E60; padding: 20px; margin-top: 30px;">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-6">
                    <h2 style="color: #ffffff; font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;">Objetivo</h2>
                    <p style="color: #ffffff; font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif; text-align: justify;">El objetivo de nuestra biblioteca escolar es proporcionar recursos educativos y de información a los estudiantes, profesores y personal escolar en general. Su principal función es apoyar el proceso de enseñanza y aprendizaje en el entorno escolar.</p>
                </div>
                <div class="col-md-6 text-center">
                    <img src="assets/img/morritautez.jpg" alt="Imagen de la derecha" class="img-fluid" style="max-height: 200px; width: auto;">
                </div>
                <div class="col-md-6">
                    <h2 style="color: #ffffff; font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;">Servicios</h2>
                    <p style="color: #ffffff; font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif; text-align: justify;">Descripción de los servicios de la biblioteca escolar.</p>
                </div>
                <div class="col-md-6 text-center">
                    <img src="assets/img/morrosutez.jpg" alt="Imagen de la derecha" class="img-fluid" style="max-height: 200px; width: auto;">
                </div>
            </div>
        </div>
    </div>
    <div class="image-circles" style="justify-content: flex-end;">
        <div class="circle-image hvr-float">
            <a id="mostrarLibros" href="${pageContext.request.contextPath}/mostrarlibrosvista"
               style="position: absolute; margin-top: 65px; right: 15px; display: inline-block; padding: 10px 20px; background-color: #009475; color: white; text-decoration: none; border-radius: 5px;">Entrar</a>
            <img src="assets/img/libros1.jpg" alt="Imagen 1">
            <div class="circle-text">Libros <br> disponibles</div>
        </div>
    </div>


    <script src="assets/js/bootstrap.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
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

        document.getElementById("salas").addEventListener("click", function () {
            var xhr = new XMLHttpRequest();
            xhr.open("GET", "salasUser", true);
            xhr.send();
            window.location.href = "salasuser.jsp";


        });

    </script>
    </div>
    </body>

    </html>

</c:if>