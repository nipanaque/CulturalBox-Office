<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.culturalbox.Beans.Registro" %>
<jsp:useBean type="java.util.ArrayList<com.example.culturalbox.Beans.Registro>" scope="request" id="tercer_registro"/>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
        <!-- Importando estilos personalizados -->
        <link rel="stylesheet" type="text/css" href="css/estilos_d.css">
        <title>Contraseña Exitosa</title>
    </head>
    <br/>
    <br/>
    <br/>
    <br/>
    <body>
        <form class="form-login" style="margin-top: 4%;" method="POST" action="<%=request.getContextPath()%>/RegistroUsuarioServlet?a=validacion_final" >
            <div class="container">
                <div class="row">
                    <div class="col"style="margin-left: -1%;">
                        <div>
                            <img src="assets/img/pucp.png" width="140" height="50" style="margin-left: 3%;margin-top:3%;border-radius: 3px;">
                        </div>
                    </div>
                </div>
                <div class="login-container" style="margin-top: -1%;">
                    <div class="login-header">
                        <h3 style="font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;color: rgb(100, 19, 176);">Contraseña Exitosa</h3>
                    </div>
                    <div class="col">
                        <div class="row">
                            <div class="modal-content-centre">
                                <br/>
                                <h6><strong>Usuario registrado. Click en continuar para terminar con tu registro y logearte!</strong></h6>
                            </div>
                        </div>
                        <div class="row">
                            <div>
                                <div class="btn-container" style="margin-top: 30px;">
                                    <input type="hidden" name="codigo" id="codigo" value="<%=tercer_registro.get(0).getCodigo()%>" />
                                    <input type="hidden" name="nombre" id="nombre" value="<%=tercer_registro.get(0).getNombre()%>" />
                                    <input type="hidden" name="apellido" id="apellido" value="<%=tercer_registro.get(0).getApellido()%>" />
                                    <input type="hidden" name="dni" id="dni" value="<%=tercer_registro.get(0).getDni()%>" />
                                    <input type="hidden" name="telefono" id="telefono" value="<%=tercer_registro.get(0).getTelefono()%>" />
                                    <input type="hidden" name="nacimiento" id="nacimiento" value="<%=tercer_registro.get(0).getNacimiento()%>" />
                                    <input type="hidden" name="direccion" id="direccion" value="<%=tercer_registro.get(0).getDireccion()%>" />
                                    <input type="hidden" name="correo" id="correo" value="<%=tercer_registro.get(0).getCorreo_pucp()%>" />
                                    <input type="hidden" name="contrasenha" id="contrasenha" value="<%=tercer_registro.get(0).getContrasenha()%>" />
                                    <button type="submit" class="btn btn-ingresar" style="width: 280px;" >
                                        Continuar
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>

    </body>
</html>
