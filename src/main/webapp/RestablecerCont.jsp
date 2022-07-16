<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="invalid_correo" scope="session" type="java.lang.String" class="java.lang.String"/><html lang="en">
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
<form class="form-login" style="margin-top: 4%;" method="POST" action="<%=request.getContextPath()%>/RestablecerContrasenhaServlet?a=validar">
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
        </div>
        <div class="mb-3" style="margin-top: 2%;" >
            <label for="correo" class="form-label">Correo Institucional:</label>
            <input type="email" class="form-control" id="correo" name="correo" aria-describedby="emailHelp" required>
            <%if (session.getAttribute("invalid_correo").equals("error")){%>
            <div class="text-danger nb-2">
                Correo no existente en el sistema.
            </div>
            <%session.removeAttribute("invalid_correo1");%>
            <%}%>
            <br/>
        </div>
        <div class="btn-container" style="margin-left:-176px">
            <button type="submit" class="btn btn-ingresar" style="width: 280px;" >
                Solicitar Código
            </button>
        </div>
    </div>
</form>
</br>
</br>
</body>
</html>