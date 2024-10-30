<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<body>
    <div class="container">
        <header>
            <h1>GRIFO PETROMAR</h1>
            <button class="logout-btn">Cerrar Sesión</button>
        </header>

        <div class="title">
            <h2>NUMERACION DE SURTIDORES</h2>
        </div>

        <div class="surtidores-table">
            <table>
                <thead>
                    <tr>
                        <th>COMBUSTIBLE</th>
                        <th>NUMERACION N°1</th>
                        <th>NUMERACION N°2</th>
                        <th>EDITAR</th>
                    </tr>
                </thead>
                <tbody>
                    
                    <c:forEach var="tanque" items="${listaTanques}">
                <tr>
                    <td>${tanque.descripcion}</td>
                    <td>${tanque.numeracionA}</td> <!-- Mostrar numeración N°1 -->
                    <td>${tanque.numeracionB}</td> <!-- Mostrar numeración N°2 -->
                    <td><button class="edit-btn" onclick="openModal('Diesel')">?</button></td>
                    
                </tr>
            </c:forEach>
                    
                </tbody>
            </table>
        </div>
    </div>
    <div id="editModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <h3 id="fuelType">Editar Numeración...</h3>
            <label>Surtidor N° 1:</label>
            <input type="text" id="surtidor1Input" placeholder="0000000.00">
            <label>Surtidor N° 2:</label>
            <input type="text" id="surtidor2Input" placeholder="0000000.00">
            <button class="save-btn" onclick="closeModal()">GUARDAR</button>
        </div>
    </div>

    <script>
        // Función para abrir el modal y mostrar el tipo de combustible
        function openModal(fuelType) {
            document.getElementById('fuelType').textContent = "Editar Numeración para " + fuelType;
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

.surtidores-table {
    width: 100%;
    margin-top: 20px;
}

.surtidores-table table {
    width: 100%;
    border-collapse: collapse;
}

.surtidores-table th {
    background-color: #004D40; /* Verde oscuro */
    color: white;
    padding: 12px;
    text-align: center;
}

.surtidores-table td {
    text-align: center;
    padding: 12px;
    color: #333;
    font-weight: bold;
    border-bottom: 1px solid #006064; /* Borde azul verdoso */
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



.modal {
    display: none;
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
    justify-content: center;
    align-items: center;
}

.modal-content {
    background-color: #B0BEC5; /* Color gris claro */
    padding: 20px;
    border-radius: 10px;
    width: 350px;
    text-align: center;
    position: relative;
}

.modal-content h3 {
    font-size: 1.2rem;
    margin-bottom: 15px;
    color: #004D40; /* Verde oscuro */
}

.modal-content label {
    display: block;
    font-weight: bold;
    margin-bottom: 10px;
    text-align: left;
    color: #004D40; /* Verde oscuro */
}

.modal-content input {
    padding: 10px;
    width: 100%;
    border: 1px solid #004D40; /* Verde oscuro */
    border-radius: 5px;
    margin-bottom: 15px;
    background-color: #E0F7FA; /* Azul claro */
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
