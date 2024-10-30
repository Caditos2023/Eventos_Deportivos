<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Gestión de Clientes</title>
</head>
<body>
    <h1>Gestión de Clientes</h1>
    <form action="clienteController" method="post">
        <input type="hidden" name="idcliente" value="${cliente.idcliente != null ? cliente.idcliente : ''}">
        Nombre: <input type="text" name="nombre" required/><br/>
        Limite Crediticio: <input type="number" name="limite_crediticio" required/><br/>
        Tolerancia: <input type="number" name="tolerancia" required/><br/>
        <input type="submit" name="action" value="guardar"/>
        <input type="submit" name="action" value="editar"/>
        <input type="submit" name="action" value="eliminar"/>
    </form>
</body>
</html>
