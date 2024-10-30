<!DOCTYPE html>
<html lang="es">
<head>
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro de Venta - Grifo Petromar</title>
    <link rel="stylesheet" href="venta_galones.css">
    
</head>
<body>
    <div class="container">
        <header>
            <h1>GRIFO PETROMAR</h1>
            <button class="logout-btn" onclick="logout()">Cerrar Sesión</button>
        </header>

        <div class="title">
            <h2>REGISTRO DE VENTA -  GALONES</h2>
        </div>

        <div class="info-section">
            <div class="info">
                <h3>PETROMAR S.R.L</h3>
                <p>Prolongación Av. 9 de Octubre S/N Cayaltí Chiclayo Lambayeque</p>
            </div>
            <div class="ticket-info">
                <table>
                    <tr>
                        <td>RUC:</td>
                        <td>20480644698</td>
                    </tr>
                    <tr>
                        <td>Ticket N°:</td>
                        <td><input type="text" class="ticket-input" required></td>
                    </tr>
                </table>
            </div>
        </div>

        <div class="form">
            <label for="cliente">Cliente</label>
            <input type="text" id="cliente" class="input-field" required>
            <label for="dni">DNI</label>
            <input type="text" id="dni" class="input-field" required>
        </div>

        <div class="table-section">
            <button class="add-row-btn" onclick="addRow()">+</button>
            <table>
                <thead>
                    <tr>
                        <th>N°</th>
                        <th>Descripción</th>
                        <th>Precio Galón</th>
                        <th>IGV (18%)</th>
                        <th>Cant. Galón</th>
                        <th>Subtotal</th>
                        <th>Eliminar</th>
                    </tr>
                </thead>
                <tbody id="sales-table-body">
                    
                    <tr>
                        <td class="auto-number"></td>
                        <td>
                            <select class="descripcion-select" onchange="setPrecioGalon(this)">
                                <option value="Premi" data-precio="15.50">PREMIUM</option>
                                <option value="Regu" data-precio="13.20">REGULAR</option>
                                <option value="Dbs" data-precio="12.00">DIESEL</option>
                            </select>
                        </td>
                        <td><input type="number" class="table-input" min="0" oninput="calculateRowTotal(this)" readonly></td>
                        <td><input type="text" class="table-input igv-row" readonly></td>
                        <td><input type="number" class="table-input" min="0" oninput="calculateRowTotal(this)" required></td>
                        <td><input type="text" class="table-input subtotal-row" readonly></td>
                        <td><button class="delete-row-btn" onclick="deleteRow(this)">Eliminar</button></td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="total-section">
            <label for="total-general">TOTAL:</label>
            <input type="text" id="total-general" readonly>
        </div>

        <div class="print-btn">
            <button onclick="printPage()">Imprimir</button>
        </div>
    </div>
<script>
        function logout() {
            localStorage.removeItem('isLoggedIn');
            window.location.href = 'login.jsp';
        }
        function logout() {
    // Eliminar cualquier estado de inicio de sesión en localStorage
    localStorage.removeItem('isLoggedIn');
    // Redirigir al usuario al login sin permitir que regrese a la página anterior
    window.location.replace('login.jsp');
}


        function addRow() {
            const tableBody = document.getElementById('sales-table-body');
            const newRow = tableBody.rows[0].cloneNode(true);
            newRow.querySelectorAll('input').forEach(input => {
                input.value = '';
            });
            newRow.querySelector('.descripcion-select').selectedIndex = 0;
            newRow.querySelector('.table-input').addEventListener('change', () => calculateRowTotal(newRow));
            tableBody.appendChild(newRow);
        }

        function deleteRow(button) {
            const row = button.parentElement.parentElement;
            row.parentElement.removeChild(row);
            calculateTotalGeneral();
        }

        function setPrecioGalon(selectElement) {
            const row = selectElement.parentElement.parentElement;
            const precioGalonInput = row.cells[2].querySelector('input');
            const descripcion = selectElement.value;

            // Obtiene el precio del atributo data-precio de la opción seleccionada
            const precio = selectElement.options[selectElement.selectedIndex].getAttribute('data-precio');
            precioGalonInput.value = parseFloat(precio) || 0;
            
            calculateRowTotal(precioGalonInput); // Actualiza el cálculo total
        }

        function calculateRowTotal(element) {
            const row = element.parentElement.parentElement;
            const precioGalon = parseFloat(row.cells[2].querySelector('input').value) || 0;
            const cantGalon = parseFloat(row.cells[4].querySelector('input').value) || 0;

            const subtotal = precioGalon * cantGalon;
            row.cells[5].querySelector('input').value = subtotal.toFixed(2);

            const igv = subtotal * 0.18;
            row.cells[3].querySelector('input').value = igv.toFixed(2);

            calculateTotalGeneral();
        }

        function calculateTotalGeneral() {
            let totalGeneral = 0;
            document.querySelectorAll('.subtotal-row').forEach(input => {
                totalGeneral += parseFloat(input.value) || 0;
            });
            document.getElementById('total-general').value = totalGeneral.toFixed(2);
        }

        function printPage() {
            window.print();
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
    background-color: #E0F2F1; /* Verde muy claro */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background-color: #006064; /* Azul verdoso oscuro */
    color: white;
    padding: 10px;
}



.title {
    background-color: #004D40; /* Verde oscuro */
    color: white;
    text-align: center;
    padding: 10px;
    margin: 10px 0;
}

.info-section {
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    margin: 20px 0;
}

.info {
    text-align: left;
}

.ticket-info {
    border: 1px solid #006064; /* Azul verdoso oscuro */
    padding: 10px;
    border-radius: 5px;
    background-color: #B2DFDB; /* Verde suave */
}

.form {
    display: flex;
    justify-content: flex-start;
    gap: 20px;
    padding: 10px 0;
}

.input-field {
    padding: 5px;
    width: 20%;
    border: 1px solid #006064; /* Azul verdoso */
    border-radius: 5px;
}

.table-section {
    margin-top: 20px;
    position: relative;
}

.add-row-btn {
    position: absolute;
    right: 0;
    top: -40px;
    background-color: #006064; /* Azul verdoso oscuro */
    color: white;
    border: none;
    padding: 5px 10px;
    cursor: pointer;
    border-radius: 5px;
    font-size: 20px;
}

table {
    width: 100%;
    border-collapse: collapse;
}

th {
    background-color: #004D40; /* Verde oscuro */
    color: white;
    padding: 8px;
    text-align: center;
}

td {
    padding: 8px;
    text-align: center;
}

.table-input {
    width: 90%;
    padding: 5px;
    border: 1px solid #006064; /* Azul verdoso oscuro */
    border-radius: 5px;
}

.delete-row-btn {
    background-color: #FF6347; /* Rojo tomate para eliminar */
    color: white;
    border: none;
    padding: 5px;
    cursor: pointer;
    border-radius: 5px;
    font-size: 14px;
}

.print-btn {
    text-align: right;
    margin-top: 20px;
}

.print-btn button {
    background-color: #00796B; /* Verde medio */
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    font-size: 16px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    transition: background-color 0.3s ease;
}

.print-btn button:hover {
    background-color: #158b78; /* Verde claro */
}
/* Estilos para el select de Descripción */
.descripcion-select {
    background-color: #f0f8ff; /* Color de fondo claro */
    border: 2px solid #057445; /* Borde azul oscuro */
    color: #333; /* Color del texto */
    padding: 5px 10px;
    font-weight: bold;
    border-radius: 5px;
    transition: background-color 0.3s ease, border-color 0.3s ease;
}

.descripcion-select:hover,
.descripcion-select:focus {
    background-color: #ffffff; /* Fondo azul más oscuro */
    color: #000000; /* Texto blanco */
    border-color: #085032; /* Borde azul más oscuro */
}


/* Estilos del botón "Cerrar Sesión" */
.logout-btn {
    background-color: #d32f2f; /* Rojo oscuro */
    color: #fff;
    border: none;
    padding: 8px 15px;
    border-radius: 5px;
    cursor: pointer;
    font-weight: bold;
    transition: background-color 0.3s ease;
}

.logout-btn:hover {
    background-color: #b71c1c; /* Rojo más oscuro */
}


</style>
</html>
