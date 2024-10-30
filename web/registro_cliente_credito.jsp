<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrar Cliente a Crédito - Grifo Petromar</title>
   </head>

<body>
    <div class="container">
        <header>
            <h1>GRIFO PETROMAR</h1>
            <button class="logout-btn">CERRAR SESIÓN</button>
        </header>

        <div class="title">
            <h2>REGISTRAR CLIENTE A CRÉDITO</h2>
        </div>

        <div class="client-info">
            <h3>PETROMAR S.R.L</h3>
            <p>PROLONGACION AV. 9 DE OCTUBRE S/N CAYALTI CHICLAYO LAMBAYEQUE</p>
            
            <!-- Selector de tipo de contacto -->
            <label>TIPO DE CONTACTO:
                <select>
                    <option value="cliente">Telefono</option>
                    <option value="proveedor">Direccion</option>
                </select>
            </label>

            <label>DIRECCIÓN <input type="text" placeholder="" /></label>
           
            <!-- Selector de tipo de documento -->
            <label>TIPO DE DOCUMENTO:
                <select>
                    <option value="ruc">RUC</option>
                    <option value="dni">DNI</option>
                    <option value="pasaporte">Pasaporte</option>
                </select>
            </label>

            <label>NUM. DOCUMENT. <input type="text" placeholder="" /></label>

            <!-- Selector de tipo de combustible -->
            <label>TIPO DE COMBUSTIBLE:
                <select>
                    <option value="premi">PREMI</option>
                    <option value="regu">REGU</option>
                    <option value="dies">DIES</option>
                </select>
            </label>

            <label>MONTO FIJADO POR GALÓN <input type="text" class="small-input" placeholder="" /></label>
            <label>EMPRESA/CLIENTE <input type="text" placeholder="" /></label>

            <label>GALONES <input type="text" class="small-input" placeholder="" /></label>

            <!-- Cambio de "Fecha a cancelar" a "Número de días a cancelar" -->
            <label>NÚMERO DE DÍAS A CANCELAR <input type="text" class="days-input" placeholder="" /></label>
        </div>

        <div class="button-section">
            <button class="save-btn">GUARDAR</button>
        </div>
    </div>
</body>

</html>

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
    border-radius: 8px; /* Borde redondeado para suavizar */
}

header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background-color: #006064; /* Azul verdoso oscuro */
    color: white;
    padding: 10px;
    border-radius: 8px;
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
    padding: 15px;
    margin: 15px 0;
    border-radius: 8px;
}

.client-info {
    padding: 20px;
    background-color: #cfe9d9; /* Azul claro */
    color: #333;
    border-radius: 8px;
    display: grid;
    grid-template-columns: 1fr 1fr; /* Distribuye en dos columnas */
    column-gap: 20px;
    row-gap: 15px;
}

.client-info h3 {
    grid-column: span 2; /* Ocupa ambas columnas */
    font-size: 1.4rem;
    margin-bottom: 10px;
}

.client-info p {
    grid-column: span 2; /* Ocupa ambas columnas */
    font-size: 1rem;
    margin-bottom: 15px;
}

label {
    font-weight: bold;
    display: block;
    margin-bottom: 5px;
}

input[type="text"],
input[type="date"],
select {
    padding: 8px;
    border: 1px solid #333;
    border-radius: 5px;
    width: 100%; /* Se adapta al ancho de la columna */
    margin-top: 5px;
}

.small-input {
    width: 90%; /* Ancho reducido para campos más pequeños */
}

.date-input {
    width: 90%; /* Ancho adecuado para el selector de fecha */
}

.fuel-type {
    margin-bottom: 15px;
}

.fuel-type label {
    font-weight: bold;
    margin-right: 10px;
}

select {
    appearance: none; /* Elimina el diseño predeterminado del navegador */
    background-color: #E0F7FA;
    padding: 10px;
    font-weight: bold;
    color: #333;
    cursor: pointer;
    outline: none;
}

select:hover {
    background-color: #b2dfdb; /* Color más claro en hover */
}

.button-section {
    display: flex;
    justify-content: flex-end;
    margin-top: 20px;
    grid-column: span 2; /* Centra el botón en el ancho completo */
}

.save-btn {
    background-color: #32CD32; /* Verde medio */
    color: white;
    border: none;
    padding: 10px 20px;
    font-size: 1rem;
    font-weight: bold;
    border-radius: 5px;
    cursor: pointer;
}

.save-btn:hover {
    background-color: #48A999; /* Verde más claro en hover */
}


</style>

</html>