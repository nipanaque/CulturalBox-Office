<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.culturalbox.Beans.Registro" %>
<jsp:useBean type="java.util.ArrayList<com.example.culturalbox.Beans.Registro>" scope="request" id="segundo_registro"/>
<html>
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
            <title>Establecer nueva contraseña Centro Cultural PUCP</title>
        </head>
        <body>
            <form class="form-login" style="margin-top: 4%;" method="POST" action="<%=request.getContextPath()%>/RegistroUsuarioServlet?a=validacion">
                <div class="container">
                    <div class="row">
                        <div class="col"style="margin-left: -1%;">
                            <div>
                                <img src="assets/img/pucp.png" width="140" height="50" style="margin-left: 3%;margin-top:3%;border-radius: 3px;">
                            </div>
                        </div>
                        <div class="col" style="margin-right: -12px;">
                            <div class="close-container">
                                <a href="<%=request.getContextPath()%>/MenuServlet" class="close-login">X</a>
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
                            <label for="contrasenha" class="form-label">Ingrese contraseña:</label>
                            <input type="password" class="form-control" id="contrasenha" name="contrasenha">
                        </div>
                    </div>
                    <div class="mb-3" style="margin-top: 0%;">
                        <label for="contrasenha_confirmada" class="form-label">Confirmar contraseña:</label>
                        <input type="password" class="form-control" id="contrasenha_confirmada" name="contrasenha_confirmada">
                    </div>
                    <br>
                    <div class="btn-container">
                        <button type="submit" class="btn btn-ingresar" style="width: 280px;" >
                            Confirmar
                        </button>
                    </div>
                    <input type="hidden" name="codigo" id="codigo" value="<%=segundo_registro.get(0).getCodigo()%>" />
                    <input type="hidden" name="nombre" id="nombre" value="<%=segundo_registro.get(0).getNombre()%>" />
                    <input type="hidden" name="apellido" id="apellido" value="<%=segundo_registro.get(0).getApellido()%>" />
                    <input type="hidden" name="dni" id="dni" value="<%=segundo_registro.get(0).getDni()%>" />
                    <input type="hidden" name="telefono" id="telefono" value="<%=segundo_registro.get(0).getTelefono()%>" />
                    <input type="hidden" name="nacimiento" id="nacimiento" value="<%=segundo_registro.get(0).getNacimiento()%>" />
                    <input type="hidden" name="direccion" id="direccion" value="<%=segundo_registro.get(0).getDireccion()%>" />
                    <input type="hidden" name="correo" id="correo" value="<%=segundo_registro.get(0).getCorreo_pucp()%>" />
                </div>
            </form>
            </br>
            </br>
        </body>
    </html>