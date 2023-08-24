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
            .carousel-inner .carousel-item img {
                max-height: 300px; /* Ajusta este valor según tus necesidades */
                width: auto;
                border-radius: 20px; /* Agrega esquinas redondeadas */
                margin: 10px; /* Añade espacio entre imágenes */
            }
            .carousel-inner .carousel-item {
                text-align: center; /* Centrar el contenido */
                padding: 0px; /* Agregar espacio alrededor del contenido */
            }

            .carousel-inner .carousel-item img {
                max-height: 300px;
                width: auto;
                border-radius: 20px;
            }

            .carousel-caption {
                background-color: rgba(0, 0, 0, 0.7);
                color: #fff;
                padding: 10px;
                border-radius: 10px;
                position: absolute;
                bottom: 10px; /* Posicionar el texto en la parte inferior */
                left: 50%; /* Centrar el texto horizontalmente */
                transform: translateX(-50%); /* Alinear el texto en el centro */
            }

            .paquetes {
                padding: 3% 0; /* Ajusta el espacio superior e inferior de la sección */
                background-color: #ffffff;
            }

            .paquetes-content {
                text-align: center;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                min-height: 60vh; /* Ajusta la altura mínima según tus necesidades */
            }

            .paquetes-group {
                display: flex;
                justify-content: space-between;
                margin-top: 20px; /* Ajusta el margen superior entre los paquetes */
            }

            .paquetes-1 {
                flex: 1 1 30%; /* Ajusta el tamaño de los paquetes en relación al contenedor */
                margin: 10px; /* Ajusta el espacio entre los paquetes */
            }


            .paquetes-content h2 {
                font-size: 200%;
                line-height: 40px;
                color: rgb(0, 0, 0);
                text-transform: uppercase;
                margin-bottom: 15px;
            }

            h3 {
                color: rgb(0, 0, 0);
            }
            h4 {
                color: rgb(0, 0, 0);
            }
            .txt-p {
                text-align: justify;
                font-size: 16px;
                color: #000000;
                line-height: 1.6; /* Aumenta el espaciado entre líneas para facilitar la lectura */
                margin-bottom: 30px; /* Agrega espacio al final del párrafo */
                max-width: 800px; /* Limita el ancho del párrafo para una mejor lectura */

            }

            .paquetes img {
                max-width: 100%; /* Asegura que las imágenes no se desborden del contenedor */
                height: auto; /* Mantiene la proporción de aspecto */
            }
            /* Estilos para centrar el contenido de la sección */
            .paquetes-content {
                text-align: center; /* Centra el contenido horizontalmente */
                padding: 20px; /* Agrega espacio alrededor del contenido */
            }

            .paquetes-group {
                display: flex;
                justify-content: center; /* Centra los elementos flexibles horizontalmente */
                margin-top: 20px; /* Agrega espacio superior a los elementos centrados */
            }
            .footer {
                background-color: rgb(0, 17, 108);
                color: #ffffff;
                padding: 30px 0;

                 }
            .footer h4 {
                color: #71dbca;
            }
            .footer p {
                margin: 0;
            }
            .footer i {
                margin-right: 10px;
            }
            .titulo-seccion {
                font-size: 32px;
                font-weight: bold;
                color: #002E60; /* Color que se ajuste a tu diseño */
                margin-bottom: 20px; /* Agrega espacio entre el título y el párrafo */
            }
            .tarjeta {
                border: 1px solid #e0e0e0;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                padding: 20px;
                margin-bottom: 20px;
                background-color: #fff;
            }

            .imagen-container {
                position: relative;
            }

            .imagen-container img {
                max-width: 100%;
                height: auto;
            }

            .contenido-tarjeta h4 {
                font-size: 24px;
                margin-top: 10px;
            }

            .contenido-tarjeta p {
                font-size: 18px;
                line-height: 1.6;
            }

            .tarjeta {
                border: 1px solid #e1e1e1;
                border-radius: 10px;
                padding: 20px;
                margin-bottom: 20px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.55);
                transition: box-shadow 0.3s;
                color: #333;
            }

            .tarjeta:hover {
                box-shadow: 0 6px 10px rgba(0, 0, 0, 0.1);
            }

            .imagen-container {
                position: relative;
                overflow: hidden;
                border-radius: 10px;
            }

            .imagen-container img {
                width: 100%;
                height: auto;
                display: block;
            }

            .image-overlay {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.11);
                opacity: 0;
                transition: opacity 0.3s;
            }

            .tarjeta:hover .image-overlay {
                opacity: 1;
            }

            .contenido-tarjeta {
                margin-top: 15px;
            }

            .contenido-tarjeta h4 {
                font-size: 20px;
                margin-bottom: 10px;
            }

            .contenido-tarjeta p {
                font-size: 16px;
            }

            /* Estilos generales de las secciones */
            .paquetes {
                padding: 50px 0;
                background-color: #f7f7f7;
                text-align: center;
            }

            .paquetes-content {
                max-width: 1200px;
                margin: 0 auto;
            }

            .paquetes h3 {
                font-size: 28px;
                color: #000;
                margin-bottom: 20px;
            }

            .txt-p {
                text-align: justify;
                font-size: 18px;
                color: #333;
                margin-bottom: 35px;
            }

            .paquetes-group {
                display: flex;
                justify-content: center;
            }

            /* Estilos para responsive */
            @media (max-width: 768px) {
                .paquetes-group {
                    flex-direction: column;
                    align-items: center;
                }

                .col-md-4 {
                    width: 100%;
                    max-width: 400px;
                }
            }
            .seccion-container {
                background-color: #f7f7f7;
                padding: 30px;
                border: 1px solid #ccc;
                border-radius: 10px;
                margin-bottom: 30px;
            }

            .info-container {
                display: flex;
                justify-content: space-between;
                margin-top: 20px;
            }

            .info-item {
                width: calc(50% - 20px);
                text-align: center;
                padding: 20px;
                background-color: white;
                border: 1px solid #ccc;
                border-radius: 10px;
                transition: transform 0.3s, box-shadow 0.3s;
            }

            .info-item:hover {
                transform: translateY(-5px);
                box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.1);
            }

            .info-item i {
                font-size: 36px;
                margin-bottom: 10px;
                color: #009475;
            }

            .info-item h4 {
                font-size: 18px;
                margin: 10px 0;
                color: #333;
            }

            .separador {
                height: 2px;
                background-color: #ccc;
                margin: 20px 0;
            }

        </style>
    </head>
    <body style="overflow-x: hidden;">
    <nav class="navbar">
        <div class="container d-flex justify-content-between align-items-center">
            <a class="navbar-brand" href="inicio.jsp">
                <img src="assets/img/sigebi%20logo2.png" alt="SIGEBI Logo">
                <span style="margin-left: 300px" class="d-none d-md-inline-block">Bienvenido a SIGEBI</span>
            </a>
        </div>
        <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#sidebarCollapse">
            <!-- Reemplazar el icono de tres líneas por uno de Font Awesome (fa-bars) -->
            <i class="fas fa-bars"></i>
        </button>
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
                    <img src="assets/img/LibraryBooks.jpeg" alt="Imagen izquierda" style="max-height: 300px; width: auto;">
                    <img src="assets/img/BooksAndBooks.jpeg" class="d-block w-100 carousel-img" alt="Imagen de proyectos Meccri" style="max-height: 300px; width: auto;">
                    <img src="assets/img/MoreBooks.jpeg" alt="Imagen derecha" style="max-height: 300px; width: auto;">
                </div>
            </div>
            <div class="carousel-item">
                <div class="d-flex justify-content-between align-items-center">
                    <img src="assets/img/LibraryBooks.jpeg" alt="Imagen izquierda" style="max-height: 300px; width: auto;">
                    <img src="assets/img/BooksAndBooks.jpeg" class="d-block w-100 carousel-img" alt="Imagen de proyectos Meccri" style="max-height: 300px; width: auto;">
                    <img src="assets/img/MoreBooks.jpeg" alt="Imagen derecha" style="max-height: 300px; width: auto;">
                </div>
            </div>
            <div class="carousel-item">
                <div class="d-flex justify-content-between align-items-center">
                    <img src="assets/img/LibraryBooks.jpeg" alt="Imagen izquierda" style="max-height: 300px; width: auto;">
                    <img src="assets/img/BooksAndBooks.jpeg" class="d-block w-100 carousel-img" alt="Imagen de proyectos Meccri" style="max-height: 300px; width: auto;">
                    <img src="assets/img/MoreBooks.jpeg" alt="Imagen derecha" style="max-height: 300px; width: auto;">
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
    <section class="paquetes" style="background-color: #ffffff;">
        <div class="paquetes-content d-flex flex-wrap justify-content-between">
            <div class="seccion-container">
                <h3 class="titulo-seccion">Descubre Nuestra Biblioteca</h3>
            </div>
            <div class="paquetes-group row">
                <div class="col-md-4 col-sm-6 paquetes-1">
                    <div class="tarjeta">
                        <div class="imagen-container">
                            <img src="assets/img/bibli.jpg" alt="" class="paquetes">
                            <div class="image-overlay"></div>
                        </div>
                        <div class="contenido-tarjeta">
                            <h4><i class="fas fa-bullseye"></i> Objetivo</h4>
                            <p>El objetivo de nuestra biblioteca escolar es proporcionar recursos educativos y de información a los estudiantes, profesores y personal escolar en general. Su principal función es apoyar el proceso de enseñanza y aprendizaje en el entorno escolar.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 paquetes-1">
                    <div class="tarjeta">
                        <div class="imagen-container">
                            <img src="assets/img/bibli.jpg" alt="" class="paquetes">
                            <div class="image-overlay"></div>
                        </div>
                        <div class="contenido-tarjeta">
                            <h4><i class="fas fa-building"></i> Instalaciones</h4>
                            <p>Diseñadas para satisfacer las diversas necesidades de los usuarios y facilitar el acceso a diferentes tipos de materiales y servicios. Cada área está pensada para brindar un entorno propicio para el estudio, la investigación, la lectura y la interacción. Estas áreas se diseñaron pensando en proporcionar a los usuarios un entorno versátil y enriquecedor que se adapte a sus necesidades de información, aprendizaje y exploración cultural.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 paquetes-1">
                    <div class="tarjeta">
                        <div class="imagen-container">
                            <img src="assets/img/bibli.jpg" alt="" class="paquetes">
                            <div class="image-overlay"></div>
                        </div>
                        <div class="contenido-tarjeta">
                            <h4><i class="fas fa-book"></i> Libros</h4>
                            <p>Prestamo de libros: Cualquier usuario UTEZ puede solicitar el préstamo de libros mediante este medio cumpliendo con todos los requisitos. Prestamo de salas: Cualquier usuario UTEZ puede solicitar el préstamo de la sala con elementos extras.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Add this code at the bottom of your existing HTML file, before the closing </body> tag -->

    <footer class="footer">
            <div class="row">
                <div class="col-md-4 mx-auto">
                    <h4 style="margin-left: 100px">Contáctanos</h4>
                    <p style="margin-left: 100px"><i class="fas fa-envelope"></i> Email: contact@ejemplo.com</p>
                    <p style="margin-left: 100px"><i class="fas fa-phone"></i> Celular: +123456789</p>
                </div>
                <div class="col-md-4 mx-auto">
                    <h4 style="margin-left: 50px">Síguenos</h4>
                    <a href="#"><i style="margin-left: 50px" class="fab fa-facebook-square"></i></a>
                    <a href="#"><i style="margin-left: 50px" class="fab fa-twitter-square"></i></a>
                    <a href="#"><i style="margin-left: 50px" class="fab fa-instagram-square"></i></a>
                </div>
                <div class="col-md-4 mx-auto">
                    <h4>Ubicación</h4>
                    <p><i class="fas fa-map-marker-alt"></i> Dirección: Utez</p>
                </div>
            </div>
    </footer>

    <!-- <div class="image-circles" style="justify-content: flex-end;">
         <div class="circle-image hvr-float">
             <a id="mostrarLibros" href="${pageContext.request.contextPath}/mostrarlibrosvista"
                style="position: absolute; margin-top: 65px; right: 15px; display: inline-block; padding: 10px 20px; background-color: #009475; color: white; text-decoration: none; border-radius: 5px;">Entrar</a>
             <img src="assets/img/libros.jpg" alt="Imagen 1">
             <div class="circle-text">Libros <br> disponibles</div>
         </div>
     </div>
 !-->
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
    </body>

    </html>

</c:if>