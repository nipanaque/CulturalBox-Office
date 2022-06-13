<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="actor" scope="request" type="java.util.ArrayList<com.example.culturalbox.Beans.Estadistica>"/>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>estad_actor</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:500,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <style>
            .div-3 {
                background-color: #58d0ca;
            }
        </style>
    </head>
    <body id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top bg-dark" id="mainNav">
            <div class="container">
                <a class="navbar-brand" href="https://www.pucp.edu.pe/"><img src="assets/img/pucp_logo1.jpeg" alt="..." /></a>

                <div class="collapse navbar-collapse " id="navbarResponsive">
                    <ul class="navbar-nav ms-auto py-4 py-lg-0">
                        <div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
                            <ul class="navbar-nav">
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        operador@pucp.edu.pe
                                    </a>
                                    <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDarkDropdownMenuLink">
                                        <li><a class="dropdown-item" href="#">Ver perfil</a></li>
                                        <li><a class="dropdown-item" href="#">Estadísticas</a></li>
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

        <!-- Portfolio Grid-->
        <section class="page-section bg-light" id="portfolio">
            <div class="container">
                </br>
                <h2 class="section-heading text-uppercase"><%=actor.get(0).getNombre()%></h2>
                <br/>
                <!-- Page Features-->
                <div class="row gx-lg-5">
                    <div class="col-lg-6 col-xxl-4 mb-5">
                        <div class="card border-success mb-3" style="max-width: 540px;">
                            <div class="row g-0">
                                <div class="col-md-4">
                                    <img src="assets/img/califica.png" style="width:180px; height:200px" alt="...">
                                </div>
                                <div class="col-md-8">
                                    <div class="card-body">
                                        <h3 class="card-title">Calificación de actor</h3>
                                        <p class = "fs-5">Resultados en base a los usuarios:</p>
                                        <% double puntaje = actor.get(0).getPuntaje();
                                            double parteDecimal = puntaje % 1;
                                            double parteEntera = puntaje - parteDecimal;
                                            for(int i=0;i<parteEntera;i++){ %>
                                        <img src="assets/img/star-fill.svg"  style="width:20px; height:20px" />
                                        <% }
                                            if (parteDecimal >= 0.5){ %>
                                        <img src="assets/img/star-half.svg"  style="width:20px; height:20px" />
                                        <% } %>
                                        <br/>
                                        <br/>
                                        <p class = "fs-5">N° estrellas enteras: <%=Math.round(puntaje)%> </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-xxl-4 mb-5">
                        <div class="card border-success mb-3" style="max-width: 540px;">
                            <div class="row g-0">
                                <div class="col-md-4">
                                    <img src="assets/img/funciones.png" style="width:180px; height:200px" alt="...">
                                </div>
                                <div class="col-md-8">
                                    <div class="card-body">
                                        <h3 class="card-title">Participación en funciones</h3>
                                        <% for(int i = 1; i<actor.size();i++){ %>
                                        <p class="mb-0">- <%=actor.get(i).getNombre()%></p>
                                        <% } %>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-xxl-4 mb-5">
                        <div class="card border-success mb-3" style="max-width: 540px;">
                            <div class="card-body">
                                <h3 class="card-title">Fotografía de actor/actriz</h3>
                                <img src="assets/img/roca.png" style="width:310px" alt="...">
                                <p class="card-text"><small class="text-muted">Imagen referencial</small></p>
                            </div>
                        </div>
                    </div>
                    <!-- Return button-->
                    <div class="row align-items-stretch mb-5">
                        <div class="col-md-3">
                        </div>
                        <div class="col-md-3">
                        </div>
                        <div class="col-md-3">
                        </div>
                        <div class="col-md-3">
                            <div class="text-center">
                                <a href="<%=request.getContextPath()%>/EstadisticaServlet?a=irAcDir"><button class="btn btn-primary btn-xl">Regresar</button></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>