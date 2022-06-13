<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="genero" scope="request" type="java.lang.String"/>
<jsp:useBean id="nomFuncion" scope="request" type="java.lang.String"/>
<jsp:useBean id="fecha" scope="request" type="java.lang.String"/>
<jsp:useBean id="hora" scope="request" type="java.lang.String"/>
<jsp:useBean id="listaEspeci" scope="request" type="java.util.ArrayList<com.example.culturalbox.Beans.Estadistica>" />
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>estad_funcion</title>
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
                <h2 class="section-heading text-uppercase">Coffe concert: Andrés Cruz</h2>
                <h6> <%=genero%> </h6>
                <h6> <%=nomFuncion%> </h6>
                <h6> <%=fecha%> </h6>
                <h6> <%=hora%> </h6>
                <h6> <%=listaEspeci.get(0).getNombre()%> </h6>
                <h6> <%=listaEspeci.get(0).getPuntaje()%> </h6>
                <h6> <%=listaEspeci.get(0).getAsistencia()%> </h6>
                <h6> <%=listaEspeci.get(0).getHora()%> </h6>
                <h6> <%=listaEspeci.get(0).getFecha()%> </h6>
                <h6> <%=listaEspeci.get(0).getGenero()%> </h6>
                <h6> <%=listaEspeci.get(0).getMaxMonto()%> </h6>
                <h6> <%=listaEspeci.get(0).getRecaudado()%> </h6>
                <h6> <%=listaEspeci.get(0).getDirector()%> </h6>
                </br>
                <!-- Page Features-->

                <!-- Page cuadros primera parte -->
                <div class="row">

                    <!-- Cuadro 1.1 -->
                    <div class="col-sm-4">
                        <div class="card border-success mb-3" style="max-width: 400px;">
                            <div class="row g-0">
                                <div class="col-md-5">
                                    <img src="assets/img/calendar.png" style="width:145px; height:185px" alt="...">
                                </div>
                                <div class="col-md-7">
                                    <div class="card-body">
                                        <h4 class="card-title">Fecha y hora</h4>
                                        <p class = "fs-4">23/05/22</p>
                                        <p class = "fs-4">08:33 pm</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Cuadro 1.2 -->
                    <div class="col-sm-4">
                        <div class="card border-success mb-3" style="max-width: 400px;">
                            <div class="row g-0">
                                <div class="col-md-5">
                                    <img src="assets/img/drama.png" style="width:145px; height:185px" alt="...">
                                </div>
                                <div class="col-md-7">
                                    <div class="card-body">
                                        <h3 class="card-title">Género de la función</h3>
                                        <p class = "fs-4">Acción</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Cuadro 1.1 -->
                    <div class="col-sm-4">
                        <div class="card border-success mb-3" style="max-width: 400px;">
                            <div class="row g-0">
                                <div class="col-md-4">
                                    <img src="assets/img/califica.png" style="width:128px; height:185px" alt="...">
                                </div>
                                <div class="col-md-8">
                                    <div class="card-body">
                                        <h4 class="card-title">Asistencia: 75%</h4>
                                        </br>
                                        <h4 class="card-title">Calificación:</h4>
                                        <img src="assets/img/star-fill.svg"  style="width:20px; height:20px" />
                                        <img src="assets/img/star-fill.svg"  style="width:20px; height:20px" />
                                        <img src="assets/img/star-fill.svg"  style="width:20px; height:20px" />
                                        <img src="assets/img/star-fill.svg"  style="width:20px; height:20px" />
                                        <img src="assets/img/star-half.svg"  style="width:20px; height:20px" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

                </br>

                <!-- Page cuadros segunda parte -->
                <div class="row">

                    <!-- Cuadro 2.1 -->
                    <div class="col-sm-4">
                        <div class="card border-success mb-3" style="max-width: 400px;">
                            <div class="row g-0">
                                <div class="col-md-5">
                                    <img src="assets/img/james.png" style="width:145px; height:185px" alt="...">
                                </div>
                                <div class="col-md-7">
                                    <div class="card-body">
                                        <h4 class="card-title">Director</h4>
                                        <p class = "fs-5">Roberto Gomez Bolaños</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Cuadro 2.2 -->
                    <div class="col-sm-4">
                        <div class="card border-success mb-3" style="max-width: 400px;">
                            <div class="row g-0">
                                <div class="col-md-5">
                                    <img src="assets/img/monto.png" style="width:145px; height:185px" alt="...">
                                </div>
                                <div class="col-md-7">
                                    <div class="card-body">
                                        <h4 class="card-title">Monto recaudado</h4>
                                        <p class = "fs-5">Obtenido (S/.): 500</p>
                                        <p class = "fs-5">Máximo (S/.): 800</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Cuadro 2.3 -->
                    <div class="col-sm-4">
                        <div class="card border-success mb-3" style="max-width: 400px;">
                            <div class="card-body">
                                <h4 class="card-title">Actores</h4>
                                <p class="mb-0">- Andress Wiesse Zuasnabar</p>
                                <p class="mb-0">- Pedro Suarez Vertiz</p>
                                <p class="mb-0">- Juan Vertiz Soliz</p>
                                <p class="mb-0">- Salomon Castillo Grith</p>
                                <p class="mb-0">- Soho Minho Masuchita Kito</p>
                            </div>
                        </div>
                    </div>

                </div>

                </br>

                <!-- Return button-->
                <div class="row align-items-stretch mb-5">
                    <div class="col-md-3">
                    </div>
                    <div class="col-md-3">
                    </div>
                    <div class="col-md-3">
                    </div>
                    <div class="col-md-3">
                        <a href="estadisticasespecificas_funciones.html"><button class="btn btn-primary btn-xl" type="submit">Regresar</button></a>
                    </div>
                </div>
            </div>
            </div>
        </section>
    </body>
</html>
