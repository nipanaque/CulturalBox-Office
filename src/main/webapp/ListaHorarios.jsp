<%@ page import="com.example.culturalbox.Beans.Horarios" %>
<%@ page import="java.util.Objects" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean type="java.util.ArrayList<com.example.culturalbox.Beans.Horarios>" scope="request" id="listahorarios"/>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Lista de horarios</title>
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
    <body id="page-top">
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
                </br>
                <div class="d-flex my-3">
                    <h2 class="section-heading text-uppercase">Lista de Horarios</h2>
                    <a href="<%=request.getContextPath()%>/CrearHorario" class="btn btn-primary btn-xl ms-auto">Crear Horario</a>
                </div>
                <table class="table">
                    <thead>
                        <tr>
                            <th>Sede</th>
                            <th>Sala Sede</th>
                            <th>Día</th>
                            <th>Hora inicio</th>
                            <th>Película</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%for(Horarios listahorarios1: listahorarios){%>
                        <tr>
                            <td><%=listahorarios1.getNombre_sede() %>
                            </td>
                            <td><%=listahorarios1.getSalaSede() %>
                            </td>
                            <td><%=listahorarios1.getDia() %>
                            </td>
                            <td><%=listahorarios1.getTiempo_inicio() %>
                            </td>
                            <td><%=listahorarios1.getNombre_funcion() %>
                            </td>
                            <td><a href="<%=request.getContextPath()%>/ListaHorarios?a=agregarmant&id=<%=listahorarios1.getIdHorario()%>"
                                   class="btn btn-primary">Agregar Mantenimiento</a></td>
                        </tr>
                        <%}%>
                    </tbody>
                </table>
                </br>
                <a href="<%=request.getContextPath()%>/IndexOpServlet"><button type="button" class="btn btn-secondary">Regresar</button></a>
            </div>
        </section>
    </body>
</html>
