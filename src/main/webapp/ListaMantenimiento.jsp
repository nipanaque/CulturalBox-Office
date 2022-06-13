<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.culturalbox.Beans.Horarios" %>
<%@ page import="com.example.culturalbox.Beans.Mantenimiento" %>
<jsp:useBean id="idHorario" scope="request" type="com.example.culturalbox.Beans.Horarios" />
<jsp:useBean type="java.util.ArrayList<com.example.culturalbox.Beans.Mantenimiento>" scope="request" id="listaMantenimiento"/>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Mantenimiento</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:500,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top bg-dark" id="mainNav">
            <div class="container">
                <a class="navbar-brand" href="index.html"><img src="assets/img/pucp_logo1.jpeg" alt="..." /></a>
                <div class="collapse navbar-collapse " id="navbarResponsive">
                    <ul class="navbar-nav ms-auto py-4 py-lg-0">
                        <div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
                            <ul class="navbar-nav">
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        operador@pucp.edu.pe
                                    </a>
                                    <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDarkDropdownMenuLink">
                                        <li><a class="dropdown-item" href="#">Perfil</a></li>
                                        <li><a class="dropdown-item" href="estadisticasgeneral.html">Estadisticas</a></li>
                                        <li><a class="dropdown-item" href="salas.html">Salas</a></li>
                                        <li><a class="dropdown-item" href="#">Cerrar Sesión</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </ul>
                </div>
            </div>
        </nav>
        <section class="page-section bg-light" id="portfolio">
            <div class="container">
                <form method="POST" action="<%=request.getContextPath()%>/ListaHorarios?a=guardarmant">
                <div class="row align-items-stretch mb-5">
                    <div class="col-md-6">
                        </br>
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th scope="col">Id</th>
                                    <th scope="col">Nombre</th>
                                    <th scope="col">Apellido</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%for(Mantenimiento listaMantenimiento1: listaMantenimiento){%>
                                <tr>
                                    <td><%=listaMantenimiento1.getIdMantenimiento()%></td>
                                    <td><%=listaMantenimiento1.getNombre()%></td>
                                    <td><%=listaMantenimiento1.getApellido()%></td>
                                    <td><input name="idMantenimiento" id="idMantenimiento" multiple  type="checkbox"  value="<%=listaMantenimiento1.getIdMantenimiento()%>" aria-label="..." style="width:30px; height:30px "></td>
                                    <td><input type="hidden" name="idHorario" id="idHorario" value="<%=idHorario.getIdHorario()%>" /></td>
                                </tr>
                                <%}%>
                            </tbody>
                        </table>
                    </div>
                    <div class="col-md-6">
                    </div>
                </div>
                    </br>
                    <a href="ListaHorarios"><button type="button" class="btn btn-secondary ">Regresar</button></a>
                    <button type="submit" class="btn btn-primary " data-bs-toggle="modal" data-bs-target="#exampleModal">
                        Agregar
                    </button>
                </form>
            </div>
        </section>
    </body>
</html>