<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Historia de Ventas - Grifo Petromar</title>
   
    
</head>
<body>
    <div class="container">
        <header>
            <h1>GRIFO PETROMAR</h1>
            <button class="logout-btn">Cerrar Sesión</button>
        </header>

        <div class="title">
            <h2>HISTORIAL DE VENTAS</h2>
        </div>

        <!-- Cuadro de búsqueda -->
        <div class="search-container">
            <input 
                type="text" 
                id="searchInput" 
                class="search-input" 
                onkeyup="searchByName()" 
                placeholder="Buscar por nombre de cliente...">
        </div>

        <div class="sales-table">
            <table id="salesTable">
                <thead>
                    <tr>
                        <th>N°</th>
                        <th>CLIENTE</th>
                        <th>FECHA</th>
                        <th>TOTAL</th>
                        <th>IMPRIMIR</th>
                    </tr>
                </thead>
                <tbody>
                   <c:forEach var="venta" items="${listaVentas}">
                    <tr>
                        <td>${venta.idVenta}</td> 
                        <td>${venta.nombre}</td> 
                        <td>${venta.fecha}</td> 
                        <td>${venta.precio}</td> 
                        <td><button class="print-btn" onclick="window.print()">Imprimir</button></td>
                    </tr>
                </c:forEach>
                  
                </tbody>
            </table>
        </div>
    </div>

<script>
   
        // Función para filtrar las filas de la tabla
        function searchByName() {
            const input = document.getElementById("searchInput");
            const filter = input.value.toLowerCase();
            const table = document.getElementById("salesTable");
            const rows = table.getElementsByTagName("tr");

            for (let i = 1; i < rows.length; i++) {
                const clientCell = rows[i].getElementsByTagName("td")[1];
                if (clientCell) {
                    const clientName = clientCell.textContent || clientCell.innerText;
                    rows[i].style.display = clientName.toLowerCase().indexOf(filter) > -1 ? "" : "none";
                }
            }
        }
   
    
</script>

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
/* Estilo para el botón de imprimir */
.print-btn {
    background-color: #18ce64; /* Verde brillante */
    border: none;
    padding: 8px 12px;
    cursor: pointer;
    border-radius: 5px;
    color: rgb(248, 248, 248);
    font-weight: bold;
    transition: background-color 0.3s ease;
}
 /* Estilo para el cuadro de búsqueda */
 .search-container {
    display: flex;
    justify-content: flex-end;
    margin: 10px 0;
}

.search-input {
    padding: 8px;
    border: 1px solid #006064;
    border-radius: 5px;
    font-size: 1rem;
}
</style>
</body>
</html>
