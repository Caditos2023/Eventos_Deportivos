<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Administración de Combustible - Grifo Petromar</title>
    <link rel="stylesheet" href="admin_comb.css">
</head>
<body>
    <div class="container">
        <header>
            <h1>GRIFO PETROMAR</h1>
            <button class="logout-btn">CERRAR SESIÓN</button>
        </header>

        <div class="title">
            <h2>ADMINISTRACIÓN DE COMBUSTIBLE</h2>
        </div>

        <div class="stock-section">
            <p>STOCK DISPONIBLE: &nbsp;
                <label>REGULAR: <input type="text" placeholder=""/></label>
                <label>PREMIUM: <input type="text" placeholder=""/></label>
                <label>DIESEL: <input type="text" placeholder=""/></label>
            </p>
        </div>

        <div class="supply-section">
            <h3>LLENADO DE SISTERNAS</h3>
            <table class="supply-table">
                <thead>
                    <tr>
                        <th>ABASTECIMIENTO</th>
                        <th>CANT. GLN</th>
                        <th>COMPRA * GLN</th>
                        <th>TOTAL COMPRA</th>
                        <th>GUARDAR</th>
                        <th>HISTORIAL</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <div class="radio-group">
                                <input type="radio" name="abastecimiento" value="premi"> PREMI
                                <input type="radio" name="abastecimiento" value="regu"> REGU
                                <input type="radio" name="abastecimiento" value="dies"> DIES
                            </div>
                        </td>
                        <td><input type="text" placeholder=""/></td>
                        <td><input type="text" placeholder=""/></td>
                        <td><input type="text" placeholder="" disabled/></td>
                        <td><button class="save-btn"> ?</button></td>
                        <td><button onclick="window.location.href='histo_comp_comb.jsp'" class="history-btn">?</button></td>
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

.stock-section {
    padding: 10px;
    background-color: #cfe9d9; /* Azul claro */
    color: #333;
    font-weight: bold;
    margin: 10px 0;
}

.supply-section {
    padding: 15px;
    background-color: #cfe6d2;
}

.supply-section h3 {
    color: #333;
    font-size: 1.1rem;
    margin-bottom: 10px;
}

.supply-table {
    width: 100%;
    border-collapse: collapse;
}

.supply-table th {
    background-color: #004d40; /* Verde oscuro */
    color: white;
    padding: 12px;
    text-align: center;
}

.supply-table td {
    text-align: center;
    padding: 10px;
}

.radio-group {
    display: flex;
    gap: 5px; /* Ajusta la separación entre opciones de radio */
    justify-content: center;
}

.supply-table input[type="text"] {
    padding: 5px;
    border: 1px solid #333333;
    border-radius: 3px;
    width: 100%; /* Asegura que los campos llenen la celda */
}

.save-btn, .history-btn {
    background-color: #FFD700;
    border: none;
    cursor: pointer;
    font-size: 1.2rem;
    width: 40px;
    height: 40px;
    border-radius: 50%;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    color: #333;
}


.save-btn {
    background-color: #32CD32; /* Verde brillante */
    border: none;
    cursor: pointer;
    font-size: 1.2rem;
    width: 40px;
    height: 40px;
    border-radius: 50%;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    color: white; /* Cambia el color del check a blanco */
    font-weight: bold;
}

.save-btn:hover {
    background-color: #45a049; /* Verde más oscuro en hover */
    opacity: 0.8;
}


.history-btn {
    background-color: #ffd700; /* Amarillo para el botón de historial */
    color: white;
}

.save-btn:hover, .history-btn:hover {
    opacity: 0.8;
}

</style>
</html>
