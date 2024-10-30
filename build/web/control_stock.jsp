<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Control de Stock - Grifo Petromar</title>
    <link rel="stylesheet" href="control_stock.css">
</head>
<body>
    <div class="container">
        <header>
            <h1>GRIFO PETROMAR</h1>
            <button class="logout-btn">CERRAR SESIÓN</button>
        </header>

        <div class="title">
            <h2>CONTROL DE STOCK</h2>
        </div>

        <!-- Stock Inicial -->
        <div class="main-content">
            <div class="stock-section">
                <label>REGULAR: 
                    <input type="text" id="stockRegular" placeholder="" value="${stock.REGULAR}" readonly/>
                </label>
                <label>PREMIUM: 
                    <input type="text" id="stockPremium" placeholder="" value="${stock.PREMIUM}" readonly/>
                </label>
                <label>DIESEL: 
                    <input type="text" id="stockDiesel" placeholder="" value="${stock.DIESEL}" readonly/>
                </label>
            </div>
        </div>

        <!-- Registro de Medida con Varilla -->
        <div class="measure-section">
            <h3>REGISTRO DE MEDIDA CON VARILLA</h3>
            <label>REGULAR: 
                <input type="text" id="medidaRegular" placeholder="" oninput="calcularDiferencia()"/>
            </label>
            <label>PREMIUM: 
                <input type="text" id="medidaPremium" placeholder="" oninput="calcularDiferencia()"/>
            </label>
            <label>DIESEL: 
                <input type="text" id="medidaDiesel" placeholder="" oninput="calcularDiferencia()"/>
            </label>
        </div>

        <!-- Diferencia -->
        <div class="difference-section">
            <h3>DIFERENCIA</h3>
            <label>REGULAR: 
                <input type="text" id="diferenciaRegular" placeholder="" readonly/>
            </label>
            <label>PREMIUM: 
                <input type="text" id="diferenciaPremium" placeholder="" readonly/>
            </label>
            <label>DIESEL: 
                <input type="text" id="diferenciaDiesel" placeholder="" readonly/>
            </label>
        </div>

        <!-- Conversión de Cubicación -->
        <div class="conversion-section">
            <h3>CONVERSIÓN DE CUBICACIÓN</h3>
            <label>CM 
                <input type="text" id="cmInput" placeholder="Ingrese altura en cm" oninput="calcularGalones()"/>
            </label>
            <label>GALONES 
                <input type="text" id="galonesOutput" placeholder="Resultado en galones" readonly/>
                <button class="copy-btn" onclick="copiarGalones()">Copiar</button>

            </label>
        </div>

        <div class="button-section">
            <button class="update-btn">ACTUALIZAR</button>
        </div>
    </div>
</body>

<script>
    // Función para calcular la diferencia entre el stock y la medida ingresada
    function calcularDiferencia() {
        // Obtener valores de stock
        var stockRegular = parseFloat(document.getElementById("stockRegular").value) || 0;
        var stockPremium = parseFloat(document.getElementById("stockPremium").value) || 0;
        var stockDiesel = parseFloat(document.getElementById("stockDiesel").value) || 0;

        // Obtener valores de medida ingresada
        var medidaRegular = parseFloat(document.getElementById("medidaRegular").value) || 0;
        var medidaPremium = parseFloat(document.getElementById("medidaPremium").value) || 0;
        var medidaDiesel = parseFloat(document.getElementById("medidaDiesel").value) || 0;

        // Calcular la diferencia y mostrar el resultado en los campos de diferencia
        document.getElementById("diferenciaRegular").value = (stockRegular - medidaRegular).toFixed(2);
        document.getElementById("diferenciaPremium").value = (stockPremium - medidaPremium).toFixed(2);
        document.getElementById("diferenciaDiesel").value = (stockDiesel - medidaDiesel).toFixed(2);
    }

    // Función para calcular los galones según la fórmula ajustada
    function calcularGalones() {
        // Obtener el valor de la altura en cm
        var cm = document.getElementById("cmInput").value;

        // Asegurarse de que el valor ingresado sea un número
        if (!isNaN(cm) && cm > 0) {
            // Fórmula ajustada
            var galones = -0.00411 * Math.pow(cm, 2) + 15.0034 * cm - 132.3086;

            // Mostrar el resultado en el campo de galones
            document.getElementById("galonesOutput").value = galones.toFixed(2);
        } else {
            document.getElementById("galonesOutput").value = "Valor inválido";
        }
    }

    // Función para copiar el resultado de galones al portapapeles
    function copiarGalones() {
        var galonesOutput = document.getElementById("galonesOutput");
        galonesOutput.select();
        galonesOutput.setSelectionRange(0, 99999); // Para móviles

        // Copiar el texto al portapapeles
        document.execCommand("copy");

        // Confirmación visual
        alert("Resultado en galones copiado al portapapeles");
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

.main-content {
    display: flex;
    flex-direction: column;
    gap: 20px;
    padding-right: 220px; /* Espacio para el cuadro de conversión */
}

.stock-section,
.measure-section,
.difference-section {
    padding: 15px;
    background-color: #cfe9d9; /* Azul claro */
    color: #333;
    margin-bottom: 10px;
    border-radius: 5px;
}

.stock-section label,
.measure-section label,
.difference-section label {
    display: inline-block;
    margin-right: 15px;
    margin-bottom: 10px;
    font-weight: bold;
}

label input[type="text"] {
    padding: 5px;
    border: 1px solid #333;
    border-radius: 3px;
    width: 100px;
    margin-left: 5px;
}

.conversion-section {
    position: absolute;
    right: 20px;
    top: 180px;
    padding: 15px;
    background-color: #cbf5d6;
    border: 1px solid #7da783;
    border-radius: 5px;
    width: 200px;
    text-align: center;
}

.conversion-section h3 {
    font-size: 1rem;
    margin-bottom: 10px;
}

.conversion-section label {
    display: block;
    margin-bottom: 8px;
    font-weight: bold;
}

.conversion-section label input[type="text"] {
    width: 100%;
    margin-top: 5px;
    padding: 5px;
    border: 1px solid #333;
    border-radius: 3px;
}

.button-section {
    display: flex;
    justify-content: flex-end;
    margin-top: 10px;
}

.update-btn {
    background-color: #32CD32; /* Verde medio */
    color: white;
    border: none;
    padding: 10px 20px;
    font-size: 1rem;
    font-weight: bold;
    border-radius: 5px;
    cursor: pointer;
}



/* Estilo del botón de copiar */
button.copy-btn {
    background-color: #28a745; /* Color verde principal */
    color: #fff; /* Color del texto */
    border: none;
    padding: 10px 15px;
    font-size: 14px;
    font-weight: bold;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease, transform 0.2s ease;
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
}

/* Efecto hover para el botón */
button.copy-btn:hover {
    background-color: #218838; /* Tonalidad verde más oscura al pasar el cursor */
    transform: scale(1.05); /* Aumenta ligeramente el tamaño */
    box-shadow: 0px 6px 12px rgba(0, 0, 0, 0.3);
}

/* Efecto activo (al presionar el botón) */
button.copy-btn:active {
    background-color: #1e7e34;
    transform: scale(1);
    box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.2);
}

</style>
</html>
