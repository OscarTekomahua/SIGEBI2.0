<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<title>SIGEBI</title>
<style>
    .carousel-inner img {
        width: 100%;
        height: auto;
    }

    .imagenCuerpo {
        display: flex;
        align-items: center;
        flex-wrap: wrap;
    }

    .imagenCuerpo img {
        height: 245px;
        margin-bottom: 10px;
    }

    .formaCuerpo {
        height: 245px;
        width: 30px;
        background-color: #002E60;
        display: flex;
        align-items: center;
        margin-right: 10px;
    }

    .textoCuerpo {
        padding-bottom: 20px;
        padding-left: 0px;
    }

    .textoCuerpo {
        background-color: #009475;
        width: 210px;
        height: 20px;
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

    .navbar {
        background-color: #009475 ;
        display: flex;
        align-items: center;
        justify-content: flex-start;
        height: 60px;
        padding-left: 20px;
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


<div class="container">
    <div id="carouselExampleFade" class="carousel slide carousel-fade">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleFade" data-bs-slide-to="0" class="active"
                    aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleFade" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleFade" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="assets/img/Salas1.png" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="assets/img/Salas2.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="assets/img/Salas3.png" class="d-block w-100" alt="...">
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
    <div style="background-color: #002E60; height: 50px; width: auto;"><center><h2 style="color: white; ">Informacion</h2></center></div>
    <div class="row">
        <div class="col-md-6">
            <img src="assets/img/Salas4.jpg" class="img-fluid" alt="Responsive image">
        </div>
        <div class="col-md-6">
            <div class="d-flex flex-column justify-content-center">
                <br>
                <div style="background-color: #009475; width: 200px; height:30px; margin-bottom: 10px;">
                    <h4 style="color: white;"> Solicita tu sala ></h4>
                </div>
                <p>Reserva tu sala con facilidad ¡Bienvenido a nuestro sistema de reserva en línea! Aquí podrás programar tus citas
                    para utilizar nuestras salas de manera rápida y sencilla. No hay necesidad de llamadas telefónicas ni correos
                    electrónicos interminables. Simplemente sigue el enlace a continuación y comienza a aprovechar nuestra
                    conveniente plataforma de reservas.</p>
            </div>
        </div>
    </div>
</div>

<script src="assets/js/bootstrap.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>

</html>
