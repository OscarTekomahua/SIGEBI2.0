<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Editorial</title>
    <meta charset="UTF-8">
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #009475;
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
            font-weight: normal;
            font-size: 16px;
        }

        form {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border: 6px solid #002E60;
            width: 400px;
            max-width: 80%;
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
            font-family: "Arial", sans-serif;
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
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

    </style>
</head>
<body>

<form action="createEditorial" method="post">
    <h1>Editorial</h1>
    <label for="editorial">Ingresa el nombre de la nueva Editorial: <span class="required">*</span></label><br>
    <input type="text" id="editorial" name="editorial" required><br>
    <br>
    <input type="submit" value="Agregar editorial">
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
