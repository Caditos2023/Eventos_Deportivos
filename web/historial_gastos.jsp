<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Historial de Gasto - Grifo Petromar</title>
    <link rel="stylesheet" href="histo_gasto.css">
</head>
<body>
    <div class="container">
        <header>
            <h1>GRIFO PETROMAR</h1>
            <button class="logout-btn">Cerrar Sesión</button>
        </header>

        <div class="title">
            <h2>HISTORIAL DE GASTO</h2>
            
        </div>

        <div class="expense-history-table">
            <table>
                <thead>
                    <tr>
                        <th>DESCRIPCION</th>
                        <th>CANTIDAD</th>
                        <th>EDITAR</th>
                        <th>ELIMINAR</th>
                    </tr>
                </thead>
                <tbody>
                   
                    
                     <c:forEach var="gasto" items="${listaMotivos}">
                <tr>
                    <td>${gasto.motivo}</td>
                    <td>${gasto.monto}</td> <!-- Mostrar numeración N°1 -->
                    <td><button class="edit-btn" onclick="openModal()">EDITAR</button></td>
                        <td><button class="delete-btn">ELIMINAR</button></td>
                    
                </tr>
            </c:forEach>
                
                
                    
                </tbody>
            </table>
        </div>
    </div>
    <div id="editModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <h3>Editar Gasto...</h3>
            <label>DESCRIPCIÓN:</label>
            <input type="text" id="descripcionInput" value="DETERGENTE DE LIMPIEZA">
            <label>CANTIDAD:</label>
            <input type="number" id="cantidadInput" value="8.00">
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
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 10px;
    margin: 20px 0;
    border-radius: 5px;
}

.title h2 {
    margin: 0;
}

.date-picker {
    display: flex;
    align-items: center;
    gap: 5px;
}

.date-picker label {
    font-weight: bold;
    color: white; /* Texto en blanco para coincidir con el título */
}

.date-picker input[type="date"] {
    padding: 5px;
    border: 1px solid #333;
    border-radius: 5px;
    font-size: 1rem;
}

.expense-history-table {
    width: 100%;
    margin-top: 20px;
}

.expense-history-table table {
    width: 100%;
    border-collapse: collapse;
}

.expense-history-table th {
    background-color: #004D40; /* Verde oscuro */
    color: white;
    padding: 12px;
    text-align: center;
}

.expense-history-table td {
    text-align: center;
    padding: 12px;
    color: #333;
    font-weight: bold;
    border-bottom: 1px solid #006064; /* Azul verdoso oscuro */
}

.edit-btn {
    background-color: #00796B; /* Verde medio */
    border: none;
    cursor: pointer;
    font-size: 1.2rem;
    width: 40px;
    height: 40px;
    border-radius: 50%;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    color: white;
}

.delete-btn {
    background-color: #FF6347; /* Rojo tomate */
    border: none;
    cursor: pointer;
    font-size: 1.2rem;
    width: 40px;
    height: 40px;
    border-radius: 50%;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    color: white;
}

.edit-btn:hover, .delete-btn:hover {
    opacity: 0.8;
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
    background-color: #bcc8ce; /* Color gris claro */
    padding: 20px;
    border-radius: 10px;
    width: 350px;
    text-align: center;
    
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
    background-color: #32CD32;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 1rem;
}

.modal-content .save-btn:hover {
    opacity: 0.8;
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
