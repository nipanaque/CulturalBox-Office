<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.culturalbox.Beans.Registro" %>
<jsp:useBean type="java.util.ArrayList<com.example.culturalbox.Beans.Registro>" scope="request" id="primer_registro"/>
<jsp:useBean id="invalid2" scope="request" type="java.lang.String" class="java.lang.String" />
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
        <form class="form-login" style="margin-top: 4%;" method="POST" action="<%=request.getContextPath()%>/RegistroUsuarioServlet?a=s_validacion">
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
                    <%if(invalid2.equals("incorrecto")){%>
                    <h2>Este correo ya existe en el sistema</h2>
                    <%}%>
                </div>
                <div class="mb-3" style="margin-top: 2%;">
                    <label for="correo" class="form-label">Correo Institucional:</label>
                    <input type="email" class="form-control" id="correo" name="correo" aria-describedby="emailHelp" required>
                </div>
                <div class="btn-container" style="margin-left:-176px">
                    <a type = "submit" href="#modal1" class="btn btn-ingresar" style="width: 200px;margin-left: -155px;">Solicitar Código</a>
                    <div id="modal1" class="modalmask" style="width: 500px;margin-left: 530px;height: 300px;margin-top: 230px;border-radius: 2%;">
                        <div class="modalbox movedown container-fluid d-flex">
                            <a href="#close" title="Close" class="close">X</a>
                            <div class="modal-container">
                                <div class="col">
                                    <%String id="";
                                        String[] nums = {"0","1","2","3","4","5","6","7","8","9"};
                                        for (int i = 0; i < 11; i++ ) {
                                            id += nums[(int) Math.round(Math.random() * 9)];
                                        }%>
                                    <div class="row">
                                        <div class="modal-content-centre">
                                            <h6><strong><%=id%></strong></h6>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="btn-container" style="margin-top: 30px;">
                                            <a type = "submit" href="#close" class="btn btn-ingresar" style="font-size: 15px;">Continuar</a>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="mb-3" style="margin-top: 5%;margin-left: -45px;">
                        <label for="id_validacion" class="form-label">Ingrese el código que se envió a su correo:</label>
                        <input type="text" class="form-control" id="id_validacion" name="id_validacion" aria-describedby="emailHelp" required>
                        <input type="hidden" name="codigo" id="codigo" value="<%=primer_registro.get(0).getCodigo()%>" />
                        <input type="hidden" name="nombre" id="nombre" value="<%=primer_registro.get(0).getNombre()%>" />
                        <input type="hidden" name="apellido" id="apellido" value="<%=primer_registro.get(0).getApellido()%>" />
                        <input type="hidden" name="dni" id="dni" value="<%=primer_registro.get(0).getDni()%>" />
                        <input type="hidden" name="telefono" id="telefono" value="<%=primer_registro.get(0).getTelefono()%>" />
                        <input type="hidden" name="nacimiento" id="nacimiento" value="<%=primer_registro.get(0).getNacimiento()%>" />
                        <input type="hidden" name="direccion" id="direccion" value="<%=primer_registro.get(0).getDireccion()%>" />
                    </div>
                    <div class="btn-container">
                        <button type="submit" class="btn btn-ingresar" style="width: 280px;" >
                            Continuar
                        </button>
                    </div>
                </div>
            </div>
        </form>
        </br>
        </br>
    </body>
</html>