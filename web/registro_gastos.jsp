<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro de Gastos - Grifo Petromar</title>
    <link rel="stylesheet" href="registro_gasto.css">
</head>
<body>
    <div class="container">
        <header>
            <h1>GRIFO PETROMAR</h1>
            <button class="logout-btn">Cerrar Sesión</button>
        </header>

        <div class="title">
            <h2>REGISTRO DE GASTOS</h2>
        </div>

        <!-- Formulario de Registro de Gasto -->
        <form id="gastoForm" action="GastosServlet" method="POST">
                <div class="date-picker">
                    <input type="date" id="date-field" name="fecha" readonly>
                </div>
                <div class="description-quantity">
                    <label for="description">Descripción</label>
                    <input type="text" id="description" name="motivo" placeholder="Descripción" required>
                    <label for="quantity">Cantidad</label>
                    <input type="number" id="quantity" name="monto" placeholder="Cantidad" required>
                </div>
                <button type="submit" class="add-btn">+</button>
            </form>

        <!-- Tabla de Gastos -->
        <div class="expense-table">
            <table>
                <thead>
                    <tr>
                        <th>FECHA</th>
                        <th>CANTIDAD</th>
                        <th>HISTORIAL</th>
                    </tr>
                </thead>
                            <tbody>
                      <c:forEach var="gasto" items="${listaGastos}">
                        <tr>
                            <td>${gasto.fecha}</td> <!-- Verifica que este nombre coincida con el getter -->
                            <td>${gasto.totalMontoPorDia}</td>
                            <td><button class="history-btn" onclick="location.href='HistorialGastos?fecha=${gasto.fecha}'">H</button></td>

                        </tr>
                    </c:forEach>
        
            </table>
        </div>
    </div>

    <script>
        // Establecer la fecha actual en el campo de fecha y hacerlo no editable
        const today = new Date().toISOString().split('T')[0];
        document.getElementById('date-field').value = today;
    </script>
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

/* Encabezado */
header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background-color: #006064; /* Azul verdoso oscuro */
    color: white;
    padding: 10px;
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
    margin: 10px 0;
    border-radius: 5px;
}

/* Formulario de Gasto */
.form-section {
    display: flex;
    align-items: center;
    justify-content: flex-start;
    gap: 20px;
    margin-bottom: 20px;
}

.date-picker {
    margin-top: -10px; /* Mueve el calendario más arriba */
}

.date-picker input[type="date"] {
    padding: 5px;
    border: 1px solid #333;
    border-radius: 5px;
    background-color: #F0F0F0;
    color: #333;
    text-align: center;
    width: 130px; /* Ajusta el tamaño para mejor alineación */
}

.date-picker input[readonly] {
    pointer-events: none;
}

.description-quantity {
    display: flex;
    align-items: center;
    gap: 15px;
}

.description-quantity label {
    font-weight: bold;
}

.description-quantity input[type="text"],
.description-quantity input[type="number"] {
    padding: 5px;
    width: 150px; /* Ajuste del ancho para alineación */
    border: 1px solid #333;
    border-radius: 5px;
    text-align: center;
}

.add-btn {
    background-color: #01b9a4; /* Verde medio */
    color: white;
    border: none;
    padding: 10px 18px;
    cursor: pointer;
    border-radius: 50%;
    font-size: 1.3rem;
    display: inline-flex;
    align-items: center;
    justify-content: center;
}

.add-btn:hover {
    background-color: #48A999; /* Verde más claro en hover */
}

/* Tabla de Gastos */
.expense-table {
    width: 100%;
    margin-top: 20px;
}

.expense-table table {
    width: 100%;
    border-collapse: collapse;
}

.expense-table th {
    background-color: #004D40; /* Verde oscuro */
    color: white;
    padding: 10px;
    text-align: center;
}

.expense-table td {
    text-align: center;
    padding: 10px;
}

.history-btn {
    background-color: #FFD700; /* Verde medio */
    border: none;
    cursor: pointer;
    font-size: 1.2rem;
    width: 40px;
    height: 40px;
    border-radius: 50%;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    color: rgb(255, 255, 255);
}

.history-btn:hover {
    background-color: #48A999; /* Verde más claro en hover */
}

</style>
</html>
