<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<body> 
<for action="HistorialVentas" method="post>
    <div class="container">
        <header>
            <h1>GRIFO PETROMAR</h1>
            <button class="logout-btn">Cerrar Sesión</button>
        </header>

        <div class="title">
            <h2>LISTADO DE CLIENTES</h2>
        </div>

        <div class="clients-table">
            <table>
                <thead>
                    <tr>
                        <th>N°</th>
                        <th>DNI/RUC</th>
                        <th>DIRECCION</th>
                        <th>CLIENTE/EMPRESA</th>
                        <th>EDITAR</th>
                    </tr>
                </thead>
               <tbody>
            <c:forEach var="cliente" items="${listaClientes}">
    <tr>
        <td>${cliente.idcliente}</td> <!-- Verifica que este nombre coincida con el getter -->
        <td>${cliente.documento}</td> <!-- Verifica que este nombre coincida con el getter -->
        <td>${cliente.detalle}</td> <!-- Verifica que este nombre coincida con el getter -->
        <td>${cliente.nombre}</td> <!-- Verifica que este nombre coincida con el getter -->
        <td><button class="edit-btn" onclick="openModal()">?</button></td>
    </tr>
</c:forEach>
        </tbody>

            </table>
        </div>
    </div>
     <!-- Modal para editar datos de cliente -->
     <div id="editModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <h3>Editar Datos de Cliente...</h3>
            <label>CLIENTE/EMPRESA:</label>
            <input type="text" id="clientName" >
            <label>DIRECCION:</label>
            <input type="text" id="clientAddress" >
            <label>RUC/DNI:</label>
            <input type="text" id="clientRUC">
            <button class="save-btn" onclick="closeModal()">GUARDAR</button>
        </div>
    </div>
    <script>
        // Función para abrir el modal
        function openModal() {
            document.getElementById('editModal').style.display = 'flex';
        }

        // Función para cerrar el modal
        function closeModal() {
            document.getElementById('editModal').style.display = 'none';
        }
    </script>
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
    margin: 20px 0;
    border-radius: 5px;
}

.clients-table {
    width: 100%;
    margin-top: 20px;
}

.clients-table table {
    width: 100%;
    border-collapse: collapse;
}

.clients-table th {
    background-color: #004D40; /* Verde oscuro */
    color: white;
    padding: 12px;
    text-align: center;
}

.clients-table td {
    text-align: center;
    padding: 12px;
    color: #333;
    border-bottom: 1px solid #006064; /* Bordes en azul verdoso */
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
    background-color: #48A999; /* Verde más claro al hacer hover */
}

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
    width: 350px;
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
    text-align: left;
}

.modal-content input {
    padding: 10px;
    width: 100%;
    border: 1px solid #ccc;
    border-radius: 5px;
    margin-bottom: 15px;
}

.modal-content .save-btn {
    background-color: #00796B; /* Verde medio */
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
