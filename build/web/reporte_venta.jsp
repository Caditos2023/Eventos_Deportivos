<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reporte de Venta - Grifo Petromar</title>
    <link rel="stylesheet" href="reporte_venta.css">
    
</head>
<body>
    <div class="container">
        <header>
            <h1>GRIFO PETROMAR</h1>
            <button class="logout-btn">Cerrar Sesión</button>
        </header>

        <div class="title">
            <h2>REPORTE DE VENTA</h2>
        </div>

        <div class="report-container">
            <!-- Surtidor 1 -->
            <div class="dispenser-section">
                <h3>Surtidor 1</h3>
                <div class="row">
                    <label>Fluido</label>
                    <label>Nu° Final</label>
                    <label>Nu° Inicial</label>
                    <label>Galón</label>
                    <label>Efectivo</label>
                </div>
                <div class="row">
                    <label>Regular</label>
                    <input type="text" class="input-field num-final" oninput="calcularGalon(this.parentElement, 'regular')">
                    <input type="text" class="input-field num-inicial" value="1548.40" readonly>
                    <input type="text" class="input-field galon" readonly>
                    <input type="text" class="input-field efectivo" readonly>
                </div>
                <div class="row">
                    <label>Premium</label>
                    <input type="text" class="input-field num-final" oninput="calcularGalon(this.parentElement, 'premium')">
                    <input type="text" class="input-field num-inicial" value="42105.41" readonly>
                    <input type="text" class="input-field galon" readonly>
                    <input type="text" class="input-field efectivo" readonly>
                </div>
                <div class="row">
                    <label>Diesel</label>
                    <input type="text" class="input-field num-final" oninput="calcularGalon(this.parentElement, 'diesel')">
                    <input type="text" class="input-field num-inicial" value="148524.10" readonly>
                    <input type="text" class="input-field galon" readonly>
                    <input type="text" class="input-field efectivo" readonly>
                </div>
                <div class="subtotal-row">
                    <label>Subtotal 1:</label>
                    <input type="text" class="subtotal-input" readonly>
                </div>
            </div>

            <!-- Surtidor 2 -->
            <div class="dispenser-section">
                <h3>Surtidor 2</h3>
                <div class="row">
                    <label>Fluido</label>
                    <label>Nu° Final</label>
                    <label>Nu° Inicial</label>
                    <label>Galón</label>
                    <label>Efectivo</label>
                </div>
                <div class="row">
                    <label>Regular</label>
                    <input type="text" class="input-field num-final" oninput="calcularGalon(this.parentElement, 'regular')">
                    <input type="text" class="input-field num-inicial" value="1100" readonly>
                    <input type="text" class="input-field galon" readonly>
                    <input type="text" class="input-field efectivo" readonly>
                </div>
                <div class="row">
                    <label>Premium</label>
                    <input type="text" class="input-field num-final" oninput="calcularGalon(this.parentElement, 'premium')">
                    <input type="text" class="input-field num-inicial" value="1600" readonly>
                    <input type="text" class="input-field galon" readonly>
                    <input type="text" class="input-field efectivo" readonly>
                </div>
                <div class="row">
                    <label>Diesel</label>
                    <input type="text" class="input-field num-final" oninput="calcularGalon(this.parentElement, 'diesel')">
                    <input type="text" class="input-field num-inicial" value="2100" readonly>
                    <input type="text" class="input-field galon" readonly>
                    <input type="text" class="input-field efectivo" readonly>
                </div>
                <div class="subtotal-row">
                    <label>Subtotal 2:</label>
                    <input type="text" class="subtotal-input" readonly>
                </div>
            </div>

            <!-- Resumen de Total -->
            <div class="summary-section">
                <h3>Resumen Financiero</h3>
                <table>
                    <tr>
                        <td><label>Subtotal Total:</label></td>
                        <td><input type="text" class="subtotal-total-input" readonly></td>
                    </tr>
                    <tr>
                        <td><label>Descuentos:</label></td>
                        <td><input type="text" class="descuentos-input" oninput="actualizarDescuentosCreditos()"></td>
                    </tr>
                    <tr>
                        <td><label>Créditos:</label></td>
                        <td><input type="text" class="creditos-input" oninput="actualizarDescuentosCreditos()"></td>
                    </tr>
                    <tr>
                        <td><label>Total:</label></td>
                        <td><input type="text" class="total-input" readonly></td>
                    </tr>
                </table>
            </div>

            <!-- Botón de Guardar -->
    </div>
            <div class="save-btn">
                <button onclick="guardarYActualizar()">GUARDAR Y ACTUALIZAR</button>
            </div>
        </div>
</body>
<script>
        // Precios por galón
        const precios = {
            regular: 3.50,
            premium: 4.00,
            diesel: 3.80
        };

        // Función para calcular la diferencia entre Número Final y Número Inicial, y el efectivo
        function calcularGalon(row, tipo) {
            const numeroInicial = parseFloat(row.querySelector(".num-inicial").value) || 0;
            const numeroFinal = parseFloat(row.querySelector(".num-final").value) || 0;
            const galones = numeroFinal - numeroInicial;

            // Mostrar galones
            row.querySelector(".galon").value = galones > 0 ? galones.toFixed(2) : 0;

            // Calcular y mostrar efectivo
            const efectivo = galones > 0 ? (galones * precios[tipo]).toFixed(2) : 0;
            row.querySelector(".efectivo").value = efectivo;

            // Calcular subtotal
            calcularSubtotal(row.closest(".dispenser-section"));
            calcularTotal(); // Actualizar total después de calcular subtotal
        }

        // Función para calcular el subtotal de cada surtidor
        function calcularSubtotal(surtidor) {
            let subtotal = 0;
            surtidor.querySelectorAll(".efectivo").forEach(input => {
                subtotal += parseFloat(input.value) || 0;
            });
            surtidor.querySelector(".subtotal-input").value = subtotal.toFixed(2);
            calcularSubtotalTotal(); // Actualizar el subtotal total
        }

        // Función para calcular el subtotal total
        function calcularSubtotalTotal() {
            const subtotal1 = parseFloat(document.querySelector(".subtotal-input").value) || 0;
            const subtotal2 = parseFloat(document.querySelectorAll(".subtotal-input")[1].value) || 0;
            const subtotalTotal = subtotal1 + subtotal2;
            document.querySelector(".subtotal-total-input").value = subtotalTotal.toFixed(2);
            calcularTotal(); // Actualizar total después de calcular subtotal total
        }

        // Función para calcular el total general
        function calcularTotal() {
            const subtotalTotal = parseFloat(document.querySelector(".subtotal-total-input").value) || 0;
            const descuentos = parseFloat(document.querySelector(".descuentos-input").value) || 0;
            const creditos = parseFloat(document.querySelector(".creditos-input").value) || 0;

            // Calcular total final: subtotal - descuentos + créditos
            const totalFinal = subtotalTotal - descuentos + creditos;

            // Actualiza el total final en la sección resumen
            document.querySelector(".total-input").value = totalFinal.toFixed(2);
        }

        // Función para actualizar descuentos y créditos
        function actualizarDescuentosCreditos() {
            calcularTotal();
        }

        // Función para guardar y actualizar
        function guardarYActualizar() {
            // Aquí puedes implementar la lógica para guardar datos en la base de datos
            alert("Datos guardados y actualizados.");
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

.report-container {
    display: flex;
    flex-direction: column;
    gap: 20px;
    align-items: flex-start;
}

.dispenser-section {
    background-color: #cfe9d9; /* Azul claro */
    padding: 15px;
    border-radius: 8px;
    width: 60%;  /* Aumenta el ancho */
    text-align: center;
}

.dispenser-section h3 {
    margin-bottom: 10px;
    color: #333;
    text-align: center;
}

.row {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin: 8px 0;
}

.row label {
    width: 25%;
    font-weight: bold;
}

.input-field {
    width: 23%;
    padding: 5px;
    border: 1px solid #333;
    border-radius: 5px;
}

.subtotal-row {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-top: 10px;
}

.subtotal-input {
    width: 20%;
    padding: 5px;
    border: 1px solid #333;
    border-radius: 5px;
}

.summary-section {
    background-color: #9ec7ae; /* Azul muy claro */
    padding: 10px;
    border-radius: 8px;
    width: 30%;
    align-self: flex-start;
    margin-left: auto;
    margin-top: -140px;
}

.summary-section table {
    width: 100%;
}

.summary-section label {
    font-weight: bold;
}

.summary-input {
    width: 100%;
    padding: 5px;
    border: 1px solid #333;
    border-radius: 5px;
}

.save-btn {
    align-self: flex-end;
    margin-top: -60px; /* Sube el botón */
}

.save-btn button {
    background-color: #32CD32; /* Verde medio */
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    font-size: 16px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    transition: background-color 0.3s ease;
}

.save-btn button:hover {
    background-color: #48A999; /* Verde más claro en hover */
}

</style>
</html>
