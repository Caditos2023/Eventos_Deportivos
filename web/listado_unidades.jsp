<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<body>
    <div class="container">
        <header>
            <h1>GRIFO PETROMAR</h1>
            <button class="logout-btn">Cerrar Sesión</button>
        </header>

        <div class="title">
            <h2>LISTADO DE UNIDADES</h2>
        </div>

        <div class="units-table">
            <table>
                <thead>
                    <tr>
                        
                        <th>NOMBRE</th>
                        <th>PRECIO GALÓN</th>
                        <th>EDITAR</th>
                    </tr>
                </thead>
                <tbody>
                     <c:forEach var="producto" items="${listaUnidades}">
                        <tr>
                            <td>${producto.descripcion}</td> 
                            <td>${producto.precio_venta}</td> 
                             <td><button class="edit-btn" onclick="openModal()">?</button></td>
                        </tr>
                    </c:forEach>
                       
                </tbody>
            </table>
        </div>
    </div>
    <!-- Modal para editar precio -->
    <div id="editModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <h3 id="fuelType">Ajuste de Precio...</h3>
            <label>Precio: </label>
            <input type="text" id="priceInput" value="${producto.precio_venta}">
            <button class="save-btn" onclick="closeModal()">GUARDAR</button>

        </div>
    </div>
     <!-- Modal de alerta para insertar valor -->
     <div id="alertModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeAlertModal()">&times;</span>
            <h3>¡Error!</h3>
            <p>Por favor, inserte un valor antes de guardar.</p>
            <button class="save-btn" onclick="closeAlertModal()">OK</button>
        </div>
    </div>
</body>
<script>
    function sendinfobackend(){
        
    }
    
    // Función para abrir el modal con el tipo de combustible
    function openModal(fuelType) {
        document.getElementById('fuelType').textContent = "Ajuste de Precio para " + fuelType;
        document.getElementById('editModal').style.display = 'flex';
    }

    // Función para cerrar el modal de edición
    function closeModal() {
        document.getElementById('editModal').style.display = 'none';
    }

    // Función para cerrar el modal de alerta
    function closeAlertModal() {
        document.getElementById('alertModal').style.display = 'none';
    }

    // Función para validar el campo e insertar valor
    function validateAndSave() {
        var price = document.getElementById('priceInput').value;

        if (price === "") {
            // Si el campo está vacío, mostrar la alerta
            document.getElementById('alertModal').style.display = 'flex';
        } else {
            // Si tiene valor, cerrar el modal de edición
            closeModal();
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
    background-color: #00A944; /* Verde brillante más oscuro para hover */
}

.title {
    background-color: #004D40; /* Verde oscuro */
    color: white;
    text-align: center;
    padding: 10px;
    margin: 20px 0;
    border-radius: 5px;
}

.units-table {
    width: 100%;
    margin-top: 20px;
}

.units-table table {
    width: 100%;
    border-collapse: collapse;
}

.units-table th {
    background-color: #004D40; /* Verde oscuro */
    color: white;
    padding: 12px;
    text-align: center;
}

.units-table td {
    text-align: center;
    padding: 12px;
    color: #333;
    font-weight: bold;
    border-bottom: 1px solid #006064; /* Azul verdoso oscuro para los bordes */
}

.edit-btn {
    background-color: #00796B; /* Verde medio */
    border: none;
    cursor: pointer;
    font-size: 1.2rem;
    width: 40px; /* Tamaño del botón circular */
    height: 40px; /* Tamaño del botón circular */
    border-radius: 50%; /* Hace el botón redondo */
    display: inline-flex;
    align-items: center;
    justify-content: center;
    color: white;
}

.edit-btn:hover {
    background-color: #48A999; /* Verde claro en hover */
}


/* Ventana flotante (modal) */
.modal {
    display: none;
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5); /* Fondo oscuro */
    justify-content: center;
    align-items: center;
}

.modal-content {
    background-color: #E0E0E0;
    padding: 20px;
    border-radius: 10px;
    width: 300px;
    text-align: center;
    position: relative;
}

.modal-content h3 {
    font-size: 1.2rem;
    margin-bottom: 15px;
}

.modal-content label {
    display: block;
    font-weight: bold;
    margin-bottom: 10px;
}

.modal-content input {
    padding: 10px;
    width: 100%;
    border: 1px solid #ccc;
    border-radius: 5px;
    margin-bottom: 15px;
}

.modal-content .save-btn {
    background-color: #00796B;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 1rem;
}

.modal-content .save-btn:hover {
    background-color: #48A999;
}

.close {
    position: absolute;
    top: 10px;
    right: 15px;
    color: #333;
    cursor: pointer;
    font-size: 1.5rem;
}
</style>
</html>
