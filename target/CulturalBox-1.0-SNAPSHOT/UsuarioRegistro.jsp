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
        <title>Registro Centro Cultural PUCP</title>
    </head>
    <body>
        <form class="form-login" style="width: 80%; margin-left: 10%; margin-top: 3%;" method="POST" action="<%=request.getContextPath()%>/RegistroUsuarioServlet?a=p_validacion">
            <div class="container">
                <div class="row">
                    <div class="col"style="margin-left: -1%;">
                        <div>
                            <img src="assets/img/pucp.png" width="200" height="70" style="margin-left: 3%;margin-top:3%;border-radius: 3px;">
                        </div>
                    </div>
                    <div class="col" style="margin-right: -1%;">
                        <div class="close-container">
                            <a href="usuario_menu.html" class="close-login" style="width: 10%;height:35px">X</a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="login-container" style="margin-top: -2%;">
                <div class="login-header">
                    <h3 style="font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;color: rgb(100, 19, 176);">Centro Cultural PUCP</h3>
                    <h2 style="margin-top: 1%;font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;color: rgb(16, 16, 115);">Registro</h2>
                </div>
                <div class="container" style="margin-top: 3%;">
                    <div class="row">
                        <div class="col">
                            <div class="mb-3">
                                <label for="nombre" class="form-label">Nombres: (*)</label>
                                <input type="text" name="nombre" id="nombre" class="form-control" aria-describedby="emailHelp" required>
                            </div>
                        </div>
                        <div class="col">
                            <div class="mb-3">
                                <label for="apellido" class="form-label">Apellidos: (*)</label>
                                <input type="text" name="apellido" id="apellido" class="form-control" aria-describedby="emailHelp" required>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="mb-3">
                                <label for="dni" class="form-label" >DNI: (*)</label>
                                <input type="tel" class="form-control" name="dni" id="dni" maxlength="8" minlength="8" pattern="[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]" title="ingrese su DNI" required>
                            </div>
                        </div>
                        <div class="col">
                            <label for="nacimiento" class="form-label">Fecha de Nacimiento: (*)</label>
                            </br>
                            <input type="date"  name="nacimiento" id="nacimiento" class="form-control" aria-describedby="emailHelp" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="mb-3">
                                <label for="direccion" class="form-label">Dirección: (*)</label>
                                <input type="text" name="direccion" id="direccion" class="form-control" aria-describedby="emailHelp" required>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="mb-3">
                                <label for="codigo" class="form-label">Código PUCP: (*)</label>
                                <input type="tel" class="form-control" name="codigo" id="codigo" maxlength="8" minlength="8" pattern="[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]" title="ingrese su código PUCP" required>
                            </div>
                        </div>
                        <div class="col">
                            <div class="mb-3">
                                <label for="telefono" class="form-label">Número de Teléfono: (*)</label>
                                <input type="tel" class="form-control" name="telefono" id="telefono" maxlength="9" minlength="9" pattern="[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]" title="ingrese su número de teléfono" required>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="btn-container">
                    <button type="submit" class="btn btn-ingresar" style="width: 280px;" >
                        Continuar
                    </button>
                </div>
            </div>
        </form>
        </br>
        </br>
    </body>
</html>
