<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Listado de Ventas - Grifo Petromar</title>
    <link rel="stylesheet" href="listado_venta.css">
</head>
<body>
    <div class="container">
        <header>
            <h1>GRIFO PETROMAR</h1>
            <button class="logout-btn">Cerrar Sesión</button>
        </header>

        <div class="title">
            <h2>LISTADO DE VENTAS</h2>
        </div>

        <div class="sales-table">
            <table>
                <thead>
                    <tr>
                        <th>FECHA INICIAL</th>
                        <th>FECHA FINAL</th>
                        <th>TOTAL</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>01/09/2024</td>
                        <td>07/09/2024</td>
                        <td>5240.30</td>
                    </tr>
                </tbody>
            </table>
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
    background-color: #00A944; /* Un verde más oscuro en hover */
}

.title {
    background-color: #004D40; /* Verde oscuro */
    color: white;
    text-align: center;
    padding: 10px;
    margin: 20px 0;
    border-radius: 5px;
}

.sales-table {
    width: 100%;
    margin-top: 20px;
}

.sales-table table {
    width: 100%;
    border-collapse: collapse;
}

.sales-table th {
    background-color: #004D40; /* Verde oscuro */
    color: white;
    padding: 12px;
    text-align: center;
}

.sales-table td {
    text-align: center;
    padding: 12px;
    color: #333;
    font-weight: bold;
    border-bottom: 1px solid #006064; /* Borde azul verdoso */
}

</style>
</html>
