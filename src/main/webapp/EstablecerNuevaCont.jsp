<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean type="java.util.ArrayList<com.example.culturalbox.Beans.Restablecer>" scope="request" id="primer_registro"/>
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
    <title>Establecer nueva contraseña Centro Cultural PUCP</title>
</head>
<body>
<form class="form-login" style="margin-top: 4%;">
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
        <div class="mb-3" style="margin-top: 2%;">
            <div class="mb-3" style="margin-top: 5%;">
                <label for="InputPassword" class="form-label">Ingrese nueva contraseña:</label>
                <input type="password" class="form-control" id="InputPassword">
            </div>
        </div>
        <div class="mb-3" style="margin-top: 0%;">
            <label for="ReInputPassword" class="form-label">Confirmar nueva contraseña:</label>
            <input type="password" class="form-control" id="ReInputPassword">
        </div>
        <div class="btn-container">
            <a type = "submit" href="#modal1" class="btn btn-ingresar">Confirmar</a>
            <div id="modal1" class="modalmask" style="width: 500px;margin-left: 530px;height: 300px;margin-top: 230px;border-radius: 2%;">
                <div class="modalbox movedown container-fluid d-flex">
                    <a href="<%=request.getContextPath()%>/MenuServlet" title="Close" class="close">X</a>
                    <div class="modal-container">
                        <div class="col">
                            <div class="row">
                                <div class="modal-content-centre">
                                    <h6><strong>Su contraseña se ha restaurado con éxito !!!</strong></h6>
                                </div>
                            </div>
                            <div class="row">
                                <div>
                                    <div class="btn-container" style="margin-top: 30px;">
                                        <a type = "submit" href="<%=request.getContextPath()%>/MenuServlet" class="btn btn-ingresar" style="font-size: 15px;">Continuar</a>
                                    </div>
                                </div>
                            </div>
                            <div class="mb-3" style="margin-top: 5%;margin-left: -45px;">
                                <label for="id_validacion" class="form-label">Ingrese el código que se envió a su correo:</label>
                                <input type="text" class="form-control" id="id_validacion" name="id_validacion" aria-describedby="emailHelp" required>
                                <input type="hidden" name="codigo" id="codigo" value="<%=primer_registro.get(0).getCorreo_pucp()%>" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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
