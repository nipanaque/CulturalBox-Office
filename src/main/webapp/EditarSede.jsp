<%@ page import="com.example.culturalbox.Beans.Aforo" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="sede" scope="request" type="com.example.culturalbox.Beans.Sedes" />
<jsp:useBean id="listaAforos" scope="request" type="java.util.ArrayList<com.example.culturalbox.Beans.Aforo>" />
<jsp:useBean id="invalid1" scope="session" type="java.lang.String" class="java.lang.String"/>
<jsp:useBean id="usuarioSesion" scope="session" type="com.example.culturalbox.Beans.Usuario" class="com.example.culturalbox.Beans.Usuario"/>
<jsp:useBean id="invalid2" scope="session" type="java.lang.String" class="java.lang.String"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Sedes - Cultura Box</title>
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

<!-- Navegacion-->
<nav class=" navbar navbar-expand-lg  navbar-dark bg-dark fixed-top" id="mainNav">
    <div class="container">
        <a class="navbar-brand" href="<%=request.getContextPath()%>/AdminIndexServlet" ><img src="assets/img/pucp.png" alt="..." style="height: 65px;width: 170px;border-radius: 3px;"/></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            Menu
            <i class="fas fa-bars ms-1"></i>
        </button>
        <div class="collapse navbar-collapse " id="navbarResponsive">
            <ul class="navbar-nav ms-auto py-4 py-lg-0">
                <div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
                    <ul class="navbar-nav">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <%=usuarioSesion.getCorreo()%>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDarkDropdownMenuLink">
                                <li><a class="dropdown-item" href="#">Perfil</a></li>
                                <li><a class="dropdown-item" href="Actores">Actores</a></li>
                                <li><a class="dropdown-item" href="Directores">Directores</a></li>
                                <li><a class="dropdown-item" href="Sedes">Sedes</a></li>
                                <li><a class="dropdown-item" href="Clientes">Clientes</a></li>
                                <li><a class="dropdown-item" href="operadores">Operadores</a></li>
                                <li><a class="dropdown-item" href="<%=request.getContextPath()%>/LoginServlet?finish=yes">Cerrar Sesion</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </ul>
        </div>
    </div>
</nav>

<!-- Cuerpo-->
<section class="page-section bg-light" id="portfolio">
    <div class="container">
        <div class="text-center">
            </br>
            </br>
            <h2 class="section-heading text-uppercase">Sede <%=sede.getNombre()%></h2>
            <h3 class="section-subheading text-muted"></h3>
        </div>

        <div class="card mb-3">
            <div class="card-body">
                <form method="POST" action="<%=request.getContextPath()%>/Sedes?s=actualizar">
                    <!-- Columnas-->
                    <div class="row justify-content-between">
                        <div class="col-4">
                            <h4 class="card-title">Datos:</h4>
                            <p class="card-text">Ubicado en: <%=sede.getUbicacion()%></p>
                            <div class="row g-3 align-items-center">
                                <div class="col-auto">
                                    <label for="AforoSede" class="col-form-label">Aforo de la sede: </label>
                                </div>
                                <div class="col-auto">
                                    <input type="hidden" name="SedeId" value="<%=sede.getId()%>" />
                                    <input type="number" id="AforoSede" class="form-control" aria-describedby="passwordHelpInline" name="AforoSede" value="<%=sede.getAforo()%>">
                                    <input type="hidden" name="CantidadSalas" value="<%=listaAforos.size()%>" />
                                </div>
                                </br>
                                </br>
                                </br>
                            </div>
                            <table class="table" style="width:500px">
                                <thead class="table-dark">
                                <tr>
                                    <th scope="col" style="width:250px">Sala </th>
                                    <th scope="col">Aforo</th>
                                </tr>
                                </thead>
                                <tbody>
                                <% int i = 1;
                                    for (Aforo aforo : listaAforos) { %>
                                <tr>
                                    <td><%= i%></td>
                                    <td><input type="number" id="AforoSala<%=i%>" name="AforoSala<%=i%>" class="form-control" aria-describedby="passwordHelpInline" value=<%= aforo.getAforos()%> max="30"></td>
                                </tr>
                                <% i++;}%>
                                </tbody>
                            </table>
                        </div>
                        <!-- Tabla de salas-->
                        <div class="col-4">
                            </br>
                            </br>
                            </br>
                            </br>
                            <%if(sede.getId().equals("1")){%>
                            <img src="assets/img/Sede1.jpg" class="rounded float-end" width="640" height="450" alt="...">
                            <%}else{%>
                            <img src="assets/img/Sede2.jpg" class="rounded float-end" width="640" height="450" alt="...">
                            <%}%>
                        </div>
                    </div>

                    <div class="text-center">
                        <br>
                        <a href=<%=request.getContextPath()%>/Sedes?s=ver&id=<%=sede.getId()%>" class="btn btn-primary">Regresar</a>
                        <button type="submit" class="btn btn-secondary">Actualizar</button>
                    </div>
                </form>
                </br>
                <p class="card-text"><small class="text-muted">Ultima modificacion hace <% if(sede.getUltimaActualizacion().equals("0")){%>
                    menos de un día
                    <%}else if(sede.getUltimaActualizacion().equals("1")){%>
                    <%=(sede.getUltimaActualizacion())%> dia
                    <%}else{%>
                    <%=(sede.getUltimaActualizacion())%> dias
                    <%}%>
                </small></p>
            </div>
        </div>
    </div>


</section>



<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
<!-- * *                               SB Forms JS                               * *-->
<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>



</body>
</html>

