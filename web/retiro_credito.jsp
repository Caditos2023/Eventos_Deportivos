<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro de Retiro de Crédito - Grifo Petromar</title>
    <link rel="stylesheet" href="retiro_credito.css">
    
    
</head>
<body>
    <div class="container">
        <header>
            <h1>GRIFO PETROMAR</h1>
            <button class="logout-btn">Cerrar Sesión</button>
        </header>

        <div class="title">
            <h2>REGISTRO DE RETIRO DE CREDITO</h2>
        </div>

        <div class="info-section">
            <!-- Tabla izquierda -->
            <div class="table-left">
                <table class="info-table">
                    <tr>
                        <td><label for="responsable">Responsable</label></td>
                        <td><input type="text" id="responsable" class="input-field"></td>
                    </tr>
                    <tr>
                        <td><label for="dni">DNI</label></td>
                        <td><input type="text" id="dni" class="input-field"></td>
                    </tr>
                </table>
            </div>

            <!-- Tabla derecha -->
            <div class="table-right">
                <table class="capacity-info-table">
                    <tr>
                        <td><label for="tipo">Tipo:</label></td>
                        <td>
                            <select id="tipo" name="tipo">
                                <option value="opcion1">DIESEL</option>
                                <option value="opcion2">REGULAR</option>
                                <option value="opcion3">PREMIUM</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><label for="capacidad">Capacidad GLN:</label></td>
                        <td><input type="text" id="capacidad"></td>
                    </tr>
                    <tr>
                        <td><label for="retiro">Retiro GLN:</label></td>
                        <td><input type="text" id="retiro"></td>
                    </tr>
                    <tr>
                        <td><label for="resta">Resta GLN:</label></td>
                        <td><input type="text" id="resta"></td>
                    </tr>
                </table>
            </div>
        </div>

        <div class="table-section">
            <button class="add-row-btn" onclick="addRow()">+</button>
            <table>
                <thead>
                    <tr>
                        <th>N°</th>
                        <th>Descripción</th>
                        <th>Precio Galón</th>
                        <th>Cant. Galón</th>
                        <th>Subtotal</th>
                        <th>Eliminar</th>
                    </tr>
                </thead>
                <tbody id="credit-table-body">
                    <tr>
                        <td class="auto-number"></td>
                        <td>
                            <select class="descripcion" onchange="updatePrecioGalon(this)">
                                <option value="" data-precio="0">Seleccione...</option>
                                <option value="Premi" data-precio="15.50">Premi</option>
                                <option value="Regu" data-precio="13.00">Regu</option>
                                <option value="Dbs" data-precio="10.75">Dbs</option>
                            </select>
                        </td>
                        <td><input type="text" class="table-input precio-galon" readonly></td>
                        <td><input type="number" class="table-input cantidad-galon" oninput="calcularSubtotal(this)" min="0"></td>
                        <td><input type="text" class="table-input subtotal" readonly></td>
                        <td><button class="delete-row-btn" onclick="deleteRow(this)">Eliminar</button></td>
                    </tr>
                </tbody>
            </table>
            <div class="total-section">
                <label for="total">Total:</label>
                <input type="text" id="total" readonly>
            </div>
        </div>

        <div class="print-btn">
            <button>Imprimir</button>
        </div>
    </div>

    <script>
        function updatePrecioGalon(selectElement) {
            const precioGalon = selectElement.options[selectElement.selectedIndex].getAttribute('data-precio');
            const precioInput = selectElement.closest('tr').querySelector('.precio-galon');
            precioInput.value = precioGalon;
            calcularSubtotal(selectElement.closest('tr').querySelector('.cantidad-galon'));
        }

        function calcularSubtotal(cantidadInput) {
            const row = cantidadInput.closest('tr');
            const precioGalon = parseFloat(row.querySelector('.precio-galon').value) || 0;
            const cantidadGalon = parseFloat(cantidadInput.value) || 0;
            const subtotal = precioGalon * cantidadGalon;
            row.querySelector('.subtotal').value = subtotal.toFixed(2);

            actualizarTotal();
        }

        function actualizarTotal() {
            let total = 0;
            document.querySelectorAll('.subtotal').forEach(subtotalInput => {
                total += parseFloat(subtotalInput.value) || 0;
            });
            document.getElementById('total').value = total.toFixed(2);
        }

        function addRow() {
            const tableBody = document.getElementById('credit-table-body');
            const newRow = tableBody.rows[0].cloneNode(true);
            newRow.querySelectorAll('input').forEach(input => input.value = '');
            tableBody.appendChild(newRow);
        }

        function deleteRow(button) {
            const row = button.closest('tr');
            row.remove();
            actualizarTotal();
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


.title {
    background-color: #004D40; /* Verde oscuro */
    color: white;
    text-align: center;
    padding: 10px;
    margin: 10px 0;
    border-radius: 5px;
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

.capacity-info, .form {
    display: flex;
    flex-wrap: wrap;
    gap: 15px;
}

.capacity-info label, .form-group label {
    width: 100%;
    text-align: left;
}

.capacity-info input, .capacity-info select, .input-field {
    width: 100%;
    padding: 5px;
    border: 1px solid #333;
    border-radius: 5px;
}

.table-section {
    margin-top: 20px;
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
    border: 1px solid #333;
    border-radius: 5px;
}

.add-row-btn {
    background-color: #01b9a4; /* Verde medio */
    color: white;
    border: none;
    padding: 5px 10px;
    cursor: pointer;
    border-radius: 5px;
    font-size: 20px;
    float: right;
    margin-bottom: 10px;
}

.add-row-btn:hover {
    background-color: #48A999; /* Verde más claro en hover */
}

.delete-row-btn {
    background-color: #FF6347; /* Rojo tomate */
    color: white;
    border: none;
    padding: 5px;
    cursor: pointer;
    border-radius: 5px;
    font-size: 14px;
}

.delete-row-btn:hover {
    background-color: #FF4500; /* Rojo oscuro en hover */
}

.print-btn {
    text-align: right;
    margin-top: 20px;
}

.print-btn button {
    background-color: #419abd; /* Verde medio */
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
    background-color: #48A999; /* Verde claro en hover */
}
.descripcion {
    width: 100%;
    padding: 5px;
    font-size: 14px;
    border: 1px solid #1c6e11;
    border-radius: 4px;
    background-color: #f8f8f8;
}

/* Estilos para el campo total */
.total-section {
    margin-top: 20px;
    font-weight: bold;
    font-size: 18px;
  
}

.total-section input {
    font-size: 18px;
    font-weight: bold;
    color: #333;
    text-align: right;
    padding: 5px;
    border: 1px solid #ccc;
    border-radius: 4px;
    width: 100px;
    background-color: #f8f8f8;
}
</style>
</html>

