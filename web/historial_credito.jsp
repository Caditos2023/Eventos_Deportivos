<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<body>
    <div class="container">
        <header>
            <h1>GRIFO PETROMAR</h1>
            <button class="logout-btn">Cerrar Sesión</button>
        </header>

        <div class="title">
            <h2>HISTORIAL DESPACHO DE CREDITO</h2>
        </div>

        <div class="history-table">
            <table>
                <thead>
                    <tr>
                        <th>RESPONSABLE</th>
                        <th>DNI</th>
                        <th>CANT. GLN</th>
                        <th>FECHA</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="credito" items="${listaResponsables}">
                    <tr>
                        <td>${credito.responsable}</td>
                        <td>${credito.documento_responsable}</td>
                        <td>${credito.despacho}</td>
                        <td>${credito.fecha}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </div>
    </div>
</body>
<style>
   * {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
}

body {
    background-color: #E0F7FA; /* Fondo azul claro */
}

.container {
    width: 100%;
    padding: 20px;
    background-color: #E0F2F1; /* Fondo verde muy claro */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Sombra suave */
}

header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background-color: #006064; /* Azul verdoso oscuro */
    color: white;
    padding: 10px;
}

header h1 {
    font-size: 1.5rem;
}

.logout-btn {
    background-color: #00C853; /* Verde brillante */
    border: none;
    padding: 8px 15px;
    cursor: pointer;
    border-radius: 5px;
    font-weight: bold;
    color: white;
}

.logout-btn:hover {
    background-color: #00A944; /* Verde más oscuro en hover */
}

.title {
    background-color: #004D40; /* Verde oscuro */
    color: white;
    text-align: center;
    padding: 10px;
    margin: 20px 0;
    border-radius: 5px;
}

.history-table {
    width: 100%;
    margin-top: 20px;
}

.history-table table {
    width: 100%;
    border-collapse: collapse;
}

.history-table th {
    background-color: #004D40; /* Verde oscuro */
    color: white;
    padding: 12px;
    text-align: center;
}

.history-table td {
    text-align: center;
    padding: 12px;
    color: #333;
    border-bottom: 1px solid #006064; /* Borde azul verdoso */
}

</style>
</html>
