<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Tanques</title>
</head>
<body>

    <!-- Mostrar el mensaje de conexión -->
    <h2>${mensajeConexion}</h2>

    <table>
        <thead>
            <tr>
                <th>COMBUSTIBLE</th>
                <th>NUMERACION N°1</th>
                <th>NUMERACION N°2</th>
                <th>EDITAR</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="tanque" items="${listaTanques}">
                <tr>
                    <td>REGULAR</td>
                    <td>${tanque.numeracionA}</td>
                    <td>${tanque.numeracionB}</td>
                    <td><button class="edit-btn" onclick="openModal('Regular')">?</button></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <c:if test="${empty listaTanques}">
        <p>No se recibieron datos</p>
    </c:if>

</body>
</html>
