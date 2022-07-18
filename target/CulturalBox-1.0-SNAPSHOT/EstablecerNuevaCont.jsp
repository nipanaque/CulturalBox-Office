<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="id" scope="session" type="java.lang.String" class="java.lang.String"/>
<jsp:useBean id="email" scope="session" type="java.lang.String" class="java.lang.String"/>
<jsp:useBean id="invalid_id" scope="session" type="java.lang.String" class="java.lang.String"/>
<jsp:useBean id="invalid_repeat" scope="session" type="java.lang.String" class="java.lang.String"/>
<jsp:useBean id="invalid_pass" scope="session" type="java.lang.String" class="java.lang.String"/>
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
    <title>Establecer contraseña Centro Cultural PUCP</title>
</head>
<body>
<form class="form-login" style="margin-top: 4%;" method="POST" action="<%=request.getContextPath()%>/RestablecerContrasenhaServlet?a=restablecer">
    <div class="container">
        <div class="row">
            <div class="col"style="margin-left: -1%;">
                <div>
                    <img src="assets/img/pucp.png" width="140" height="50" style="margin-left: 3%;margin-top:3%;border-radius: 3px;">
                </div>
            </div>
            <div class="col" style="margin-right: -12px;">
                <div class="close-container">
                    <a href="<%=request.getContextPath()%>/MenuSinLoginServlet" class="close-login">X</a>
                </div>
            </div>
        </div>
    </div>
    <div class="login-container" style="margin-top: -1%;">
        <div class="login-header">
            <h3 style="font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;color: rgb(100, 19, 176);">Centro Cultural PUCP</h3>
            <h2 style="margin-top: 1%;font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;color: rgb(16, 16, 115);">Establecer Contraseña</h2>
            <%if (session.getAttribute("invalid_id").equals("error")){%>
            </br>
            <div class="text-danger nb-2">
                Código incorrecto
            </div>
            <%session.removeAttribute("invalid_id");%>
            <%}%>
            <%if (session.getAttribute("invalid_repeat").equals("error")){%>
            </br>
            <div class="text-danger nb-2">
                Las contraseñas no coinciden.
            </div>
            <%session.removeAttribute("invalid_repeat");%>
            <%}%>
            <%if (session.getAttribute("invalid_pass").equals("error")){%>
            </br>
            <div class="text-danger nb-2">
                Las contraseñas no coinciden.
            </div>
            <%session.removeAttribute("invalid_pass");%>
            <%}%>
        </div>
        <div class="mb-3" style="margin-top: 2%;" >
            <label for="verificador" class="form-label">Código enviado:</label>
            <input type="text" pattern="[0-9]+" class="form-control" id="verificador" name="verificador" aria-describedby="emailHelp" required>
            <br/>
            <label for="pass" class="form-label">Ingrese la nueva contraseña:</label>
            <input type="password" class="form-control" id="pass" name="pass" aria-describedby="emailHelp" required>
            <br/>
            <label for="pass2" class="form-label">Repita la nueva contraseña:</label>
            <input type="password" class="form-control" id="pass2" name="pass2" aria-describedby="emailHelp" required>
            <input type="hidden" name="correo" id="correo" value="<%=email%>" />
            <input type="hidden" name="codigo" id="codigo" value="<%=id%>" />
        </div>
        <div class="btn-container" style="margin-left:-176px">
            <button type="submit" class="btn btn-ingresar" style="width: 280px;" >
                Cambiar contraseña
            </button>
        </div>
    </div>
</form>
</br>
</br>
<footer class="text-center text-lg-start bg-light" style="margin-top:60px;">
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
