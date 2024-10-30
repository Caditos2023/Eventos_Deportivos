<html>
<head>
    <title>Login - Grifo Petromar</title>
</head>
<body>
    <div class="login-container">
        <div class="login-box">
            <h1>Grifo Petromar</h1>
            <h2>Iniciar Sesión</h2>
            <form action="LoginServlet" method="post">

                <div class="input-group">
                    <label for="username">Usuario</label>
                    <input type="text" id="username" name="username" required>
                </div>
                <div class="input-group">
                    <label for="password">Contraseña</label>
                    <input type="password" id="password" name="password" required>
                </div>
                <button type="submit" class="btn">Entrar</button>
            </form>
        </div>
    </div>
</body>

<style>
 /* Estilos generales */
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #dae3f2; /* Fondo azul claro */
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    position: relative;
    overflow: hidden;
}

/* Fondo de marca de agua */
body::before {
    content: "PETROMAR";
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    font-size: 100px;
    color: rgba(100, 131, 164, 0.1); /* Color semitransparente */
    z-index: 0;
    white-space: nowrap;
    font-weight: bold;
    letter-spacing: 5px;
}

/* Contenedor de login */
.login-container {
    background-color: rgba(0, 77, 64, 0.9); /* Verde oscuro semitransparente */
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
    width: 100%;
    max-width: 400px;
    text-align: center;
    position: relative;
    z-index: 1;
}

/* Título */
.login-container h1 {
    color: white;
    font-size: 26px;
    margin-bottom: 20px;
    background-color: #006064; /* Fondo verde azulado oscuro */
    padding: 15px;
    border-radius: 5px;
    text-transform: uppercase;
    font-weight: bold;
    letter-spacing: 2px;
}

/* Etiquetas y campos de entrada */
.login-container label {
    display: block;
    margin: 10px 0 5px;
    font-weight: bold;
    color: #d4e0ef; /* Color claro para las etiquetas */
}

.login-container input[type="text"],
.login-container input[type="password"] {
    width: 100%;
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #48A999; /* Verde claro para el borde */
    border-radius: 5px;
    box-sizing: border-box;
    background-color: #e0f2f1; /* Verde muy claro de fondo */
}

/* Botón de ingresar */
.login-container button {
    width: 100%;
    padding: 10px;
    background-color: #00796B; /* Verde medio */
    color: white;
    border: none;
    border-radius: 5px;
    font-size: 16px;
    font-weight: bold;
    cursor: pointer;
    transition: background-color 0.3s ease;
    text-transform: uppercase;
    letter-spacing: 1px;
}

.login-container button:hover {
    background-color: #48A999; /* Verde claro en hover */
}

/* Enlaces de recuperación de contraseña */
.login-container a {
    display: block;
    margin-top: 15px;
    color: #b3e5fc; /* Azul claro */
    text-decoration: none;
    font-size: 14px;
}

.login-container a:hover {
    text-decoration: underline;
}
    </style>
</html>

