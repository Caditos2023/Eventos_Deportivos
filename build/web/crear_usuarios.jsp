<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Administración de Usuarios - Grifo Petromar</title>
   
<body>
    <div class="container">
        <header>
            <h1>Administración de Usuarios</h1>
            <button class="logout-btn">Cerrar Sesión</button>
        </header>

        <!-- Formulario para crear un nuevo usuario -->
        <div class="form-section">
            <h2 class="title">Crear Nuevo Usuario</h2>
            <form action="crear_usuarios" method="post">
            <input type="hidden" name="action" value="guardar">
   
                <label for="username">Nombre de Usuario</label>
                <input type="text" id="username" name="username" required>

                <label for="password">Contraseña</label>
                <input type="password" id="password" name="password" required>

                <label for="nombre">Nombre</label>
                <input type="text" id="nombre" name="nombre" required>

                <label for="apellido">Apellido</label>
                <input type="text" id="apellido" name="apellido" required>

                <label for="direccion">Dirección</label>
                <input type="text" id="direccion" name="direccion" required>
                
                

                <label for="tipoDocumento">Tipo de Documento</label>
                <select name="tipoDocumento" id="tipoDocumento" required>
                    <option value="1">DNI</option>
                    <option value="2">PASAPORTE</option>
                    <option value="3">RUC</option>
                </select>

                <label for="documento">Número de  Documento</label>
                <input type="text" id="documento" name="documento" required>

                <label for="estado">Estado</label>
                <select name="estado" id="estado" required>
                    <option value="1">Activo</option>
                    <option value="0">Inactivo</option>
                </select>
                
                <label for="permiso">Permiso</label>
                <select name="permiso" id="permiso" required>
                    <option value="1">Trabajador</option>
                    <option value="0">Admininstrador</option>
                </select>

                <div class="button-section">
                    <button type="submit" class="save-btn">Crear Usuario</button>

                </div>
            </form>
        </div>

        <!-- Lista de usuarios existentes -->
        <div class="user-list-section">
            <h2 class="title">Lista de Usuarios</h2>
            <table>
                <thead>
                    <tr>
                        <th>Nombre</th>
                        <th>Apellido</th>
                        <th>Dirección</th>
                        <th>Documento</th>
                        <th>Estado</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Aquí se insertará la lista de usuarios desde el servlet -->
                    <tr>
                       
                    
                        <tbody>
                                    <c:forEach var="empleado" items="${listaEmpleados}">
                            <tr>
                                <td>${empleado.nombre}</td> <!-- Verifica que este nombre coincida con el getter -->
                                <td>${empleado.apellido}</td> <!-- Verifica que este nombre coincida con el getter -->
                                <td>${empleado.direccion}</td> <!-- Verifica que este nombre coincida con el getter -->
                                <td>${empleado.documento}</td> <!-- Verifica que este nombre coincida con el getter -->
                                <td>${empleado.estado}</td> <!-- Verifica que este nombre coincida con el getter -->
                                <td><button type="submit" class="save-btn">Activar</button></td>
                                    
                            </tr>
                                     </c:forEach>
                                                    </tbody>
                        
                            
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
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
            margin: 20px auto;
            border-radius: 10px;
            max-width: 900px;
        }

        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #006064; /* Azul verdoso oscuro */
            color: white;
            padding: 10px;
            border-radius: 5px;
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

        .form-section {
            margin-bottom: 30px;
        }

        label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
        }

        input[type="text"],
        input[type="password"] {
            padding: 10px;
            border: 1px solid #333;
            border-radius: 3px;
            width: 100%; /* Ancho general para campos de texto */
            margin-top: 5px;
            margin-bottom: 20px;
        }

        select {
            padding: 10px;
            border: 1px solid #333;
            border-radius: 3px;
            width: 100%;
            margin-bottom: 20px;
        }

        .button-section {
            display: flex;
            justify-content: flex-end;
            margin-top: 20px;
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

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #004D40;
            color: white;
        }

        td {
            background-color: #cfe9d9;
        }
    </style>
</head>
</html>
