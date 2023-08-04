<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Acceso Denegado</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .fade-in {
            animation: fadeIn 1.5s ease-in-out;
        }

        @keyframes fadeIn {
            0% {
                opacity: 0;
                transform: translateY(-20px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }
        p{
            justify-content: center;
        }
    </style>
</head>
<body>
<div class="container my-5 text-center fade-in">
    <img src="assets/img/error.jpg" alt="Sad Face" class="img-fluid" style="width: 250px;">
    <h1 class="my-4" style="color: #002E60;">Acceso Denegado</h1>
    <p>No tienes los permisos necesarios para acceder a esta página.</p>
    <p>Por favor, ponte en contacto con el administrador si crees que esto es un error.</p>
    <p class="regresar"><strong><a href="index.jsp">Regresar al Login</a></strong></p>
</div>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
