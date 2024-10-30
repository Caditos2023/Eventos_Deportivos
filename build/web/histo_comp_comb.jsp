<body>
    <div class="container">
        <header>
            <h1>GRIFO PETROMAR</h1>
            <button class="logout-btn">Cerrar Sesión</button>
        </header>

        <div class="title">
            <h2>HISTORIAL COMPRA DE COMBUSTIBLE</h2>
        </div>

        <div class="purchase-history-table">
            <table>
                <thead>
                    <tr>
                        <th>FECHA</th>
                        <th>COMBUSTIBLE</th>
                        <th>CAP.</th>
                        <th>PRE. GLN</th>
                        <th>TOTAL</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>01/09/2024</td>
                        <td>DIESEL</td>
                        <td>2000</td>
                        <td>10.20</td>
                        <td>2400.00</td>
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

.purchase-history-table {
    width: 100%;
    margin-top: 20px;
}

.purchase-history-table table {
    width: 100%;
    border-collapse: collapse;
}

.purchase-history-table th {
    background-color: #004D40; /* Verde oscuro */
    color: white;
    padding: 12px;
    text-align: center;
}

.purchase-history-table td {
    text-align: center;
    padding: 12px;
    color: #333;
    border-bottom: 1px solid #006064; /* Borde azul verdoso */
}

</style>
</html>
