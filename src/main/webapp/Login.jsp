<%--
  Created by IntelliJ IDEA.
  User: Luis
  Date: 26/06/2022
  Time: 12:21
  To change this template use File | Settings | File Templates.
--%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <!-- Importando estilos personalizados -->
    <link rel="stylesheet" type="text/css" href="css/estilos_d.css">
    <title>Iniciar Sesión Centro Cultural PUCP</title>
</head>
<body>
<div class="form-login" style="margin-top: 4%;">
    <div class="container">
        <div class="row">
            <div class="col"style="margin-left: -1%;">
                <div>
                    <img src="assets/img/pucp.png" width="140" height="50" style="margin-left: 3%;margin-top:3%;border-radius: 3px;">
                </div>
            </div>
            <div class="col" style="margin-right: -12px;">
                <div class="close-container">
                    <a href="usuario_menu.html" class="close-login">X</a>
                </div>
            </div>
        </div>
    </div>
    <div class="login-container" style="margin-top: -1%;">
        <div class="login-header">
            <h3 style="font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;color: rgb(100, 19, 176);">Centro Cultural PUCP</h3>
            <h2 style="margin-top: 1%;font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;color: rgb(16, 16, 115);">Iniciar Sesión</h2>
        </div>
        <form method="POST" action="<%=request.getContextPath()%>/LoginServlet">
            <div class="mb-3" style="margin-top: 2%;">
                <label for="exampleInputEmail1" class="form-label">Correo Institucional:</label>
                <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="correo" required>
            </div>
            <div class="mb-3">
                <label for="exampleInputPassword1" class="form-label">Contraseña:</label>
                <input type="password" class="form-control" id="exampleInputPassword1" name="pass" required>
            </div>

        <div class="btn-container">
            <button type="submit" class="btn btn-ingresar" >Ingresar</button>
        </div>
</form>
        <%if (request.getAttribute("indicador").equals("error")){%>
        </br>
        <div class="text-danger nb-2">
            Error en usuario o contraseña!!!
        </div>
        <%}%>
        <div>
            <a href="RestablecerContraseña.html" class="btn-recovery" style="color: rgb(100, 19, 176);" >¿Olvidaste tu contraseña?</a>
        </div>
        <div class="register-details-container">
            <p class="register">¿No tienes una cuenta? Regístrate haciendo click</p>
            <a href="Registro.html" class="btn-detail-register" style="color: rgb(100, 19, 176);">Aquí</a>
        </div>
    </div>
</div>
</br>
</br>
<footer class="text-center text-lg-start bg-light">
    <section class="d-flex justify-content-center justify-content-lg-between p-3 border-bottom"
    >
        <!-- Left -->
        <div class="me-5 d-none d-lg-block">
            <span>Copyright © 2022 Cultural Box-Office PUCP</span>
        </div>
        <!-- Left -->

        <!-- Right -->
        <div>
            <span class="me-3">Siguenos en:</span>
            <a href="" class="me-4 text-reset">
                <i class="bi bi-instagram"></i>
            </a>
            <a href="#facebook" class="me-4 text-reset">
                <i class="bi bi-facebook"></i>
            </a>
            <a href="" class="me-4 text-reset">
                <i class="bi bi-twitter"></i>
            </a>
        </div>
        <!-- Right -->
    </section>
</footer>
</body>
</html>
