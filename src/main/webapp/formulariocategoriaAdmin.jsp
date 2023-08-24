<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>Categoría de libro</title>
  <meta charset="UTF-8">
  <style>
    body {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
      background-color: #009475;
      font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif; /* Fuente delgada y sin negritas */
      font-weight: normal;
      font-size: 16px; /* Tamaño de fuente para todos los elementos */
    }

    form {
      border: 1px solid #888; /* Contorno más delgado y menos oscuro (#888) */
      background-color: white; /* Fondo blanco */
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      width: 400px;
      max-width: 80%;
    }

    form {
      background-color: white;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      border: 6px solid #002E60; /* Cambiamos el contorno al color #002E60 y lo hacemos aún más ancho */
      width: 400px;
      max-width: 80%;
    }

    h1 {
      text-align: center;
      margin-bottom: 20px;
      font-family: "Arial", sans-serif; /* Cambiar la fuente del título a Arial */
    }

    label {
      display: block;
      margin-bottom: 8px;
    }

    input[type="text"] {
      width: 100%;
      padding: 12px;
      border: 1px solid #ccc;
      border-radius: 5px;
      box-sizing: border-box;
    }

    input[type="submit"] {
      width: 100%;
      padding: 12px;
      background-color: #007bff; /* Cambiar el color del botón a azul (#007bff) */
      color: white;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }

    input[type="submit"]:hover {
      background-color: #0056b3; /* Cambiar el color de hover del botón a un tono más oscuro de azul (#0056b3) */
    }
  </style>
</head>
<body>

<form action="createCategoria" method="post">
  <h1>Categoría de libro</h1>
  <label for="categoria">Ingresa el nombre de la nueva Categoria: <span class="required">*</span></label><br>
  <input type="text" id="categoria" name="categoria" required><br>
  <br>
  <input type="submit" value="Agregar categoría">
  <c:if test="${not empty error}">
    <p>${error}</p>
  </c:if>
</form>

</body>
<style>
  .required {
    color: red;
    font-size: 16px;
    margin-left: 5px;
  }
</style>
</html>
