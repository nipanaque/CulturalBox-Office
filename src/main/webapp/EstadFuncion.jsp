<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                <a class="navbar-brand" href="index_operadores.jsp" ><img src="assets/img/pucp.png" alt="..." style="height: 65px;width: 170px;border-radius: 3px;"/></a>

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
                                        <li><a class="dropdown-item" href="ReporteSalasServlet">Salas</a></li>
                                        <li><a class="dropdown-item" href="<%=request.getContextPath()%>/MenuSinLoginServlet">Cerrar Sesión</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </ul>
                </div>

            </div>
        </nav>
        </br>
        <!-- Portfolio Grid-->
        <section class="page-section bg-light" id="portfolio">
            <div class="container">
                </br>
                <h2 class="section-heading text-uppercase"><%=listaEspeci.get(0).getNombre()%></h2>
                </br>
                <!-- Page Features-->

                <div class="row">
                    <div class="col-md-8">
                        <div class="row">
                            <div class="col-lg-6">

                                <!-- Fecha y hora-->
                                <div class="card border-success mb-3" style="max-width: 400px;">
                                    <div class="row g-0">
                                        <div class="col-md-5">
                                            <img src="assets/img/calendar.png" style="width:145px; height:185px" alt="...">
                                        </div>
                                        <div class="col-md-7">
                                            <div class="card-body">
                                                <h4 class="card-title">Fecha y hora</h4>
                                                <p class = "fs-4"><%=listaEspeci.get(0).getFecha()%></p>
                                                <p class = "fs-4"><%=listaEspeci.get(0).getHora()%></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="col-lg-6" >

                                <!-- Genero de la funcion -->
                                <div class="card border-success mb-3" style="max-width: 400px;">
                                    <div class="row g-0">
                                        <div class="col-md-5">
                                            <img src="assets/img/drama.png" style="width:145px; height:185px" alt="...">
                                        </div>
                                        <div class="col-md-7">
                                            <div class="card-body">
                                                <h3 class="card-title">Género de la función</h3>
                                                <p class = "fs-4"><%=listaEspeci.get(0).getGenero()%></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-6">

                                <!-- Director -->
                                <div class="card border-success mb-3" style="max-width: 400px;">
                                    <div class="row g-0">
                                        <div class="col-md-5">
                                            <img src="<%=request.getContextPath()%>/ImgEstadServlet?a=Directores&id=<%=listaEspeci.get(0).getId()%>" style="width:145px; height:185px" alt="...">
                                        </div>
                                        <div class="col-md-7">
                                            <div class="card-body">
                                                <h4 class="card-title">Director</h4>
                                                <p class = "fs-5"> <%=listaEspeci.get(0).getDirector()%> </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="col-lg-6" >

                                <!-- Asistencia -->
                                <div class="card border-success mb-3" style="max-width: 400px;">
                                    <div class="row g-0">
                                        <div class="col-md-4">
                                            <img src="assets/img/califica.png" style="width:128px; height:185px" alt="...">
                                        </div>
                                        <div class="col-md-8">
                                            <div class="card-body">
                                                <h4 class="card-title">Asistencia: <%=listaEspeci.get(0).getAsistencia()%>%</h4>
                                                </br>
                                                <h4 class="card-title">Calificación:</h4>
                                                <% double puntaje = listaEspeci.get(0).getPuntaje();
                                                    double parteDecimal = puntaje % 1;
                                                    double parteEntera = puntaje - parteDecimal;
                                                    for(int i=0;i<parteEntera;i++){ %>
                                                <img src="assets/img/star-fill.svg"  style="width:20px; height:20px" />
                                                <% }
                                                    if (parteDecimal >= 0.5){ %>
                                                <img src="assets/img/star-half.svg"  style="width:20px; height:20px" />
                                                <% for(int i=0;i<5-(parteEntera+1);i++){%>
                                                <img src="assets/img/star-empty.svg"  style="width:20px; height:20px" />
                                                <% } %>
                                                <% }else { %>
                                                <% for(int i=0;i<5-(parteEntera);i++){%>
                                                <img src="assets/img/star-empty.svg"  style="width:20px; height:20px" />
                                                <% } %>
                                                <% } %>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>


                        <div class="row">
                            <div class="col-lg-6">

                                <!-- Monto -->
                                <div class="card border-success mb-3" style="max-width: 400px;">
                                    <div class="row g-0">
                                        <div class="col-md-5">
                                            <img src="assets/img/monto.png" style="width:145px; height:185px" alt="...">
                                        </div>
                                        <div class="col-md-7">
                                            <div class="card-body">
                                                <h4 class="card-title">Monto recaudado</h4>
                                                <p class = "fs-5">Obtenido (S/.): <%=listaEspeci.get(0).getRecaudado()%></p>
                                                <p class = "fs-5">Máximo (S/.): <%=listaEspeci.get(0).getMaxMonto()%></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="col-lg-6" >

                                <!-- Actores -->
                                <div class="card border-success mb-3" style="max-width: 400px;">
                                    <div class="card-body">
                                        <h4 class="card-title">Actores</h4>
                                        <% for(int i = 1; i<listaEspeci.size();i++){ %>
                                        <p class="mb-0">- <%=listaEspeci.get(i).getNombre()%></p>
                                        <% } %>
                                    </div>
                                </div>

                            </div>
                        </div>

                    </div>


                    <div class="col-md-4">
                        <!-- Banner -->
                        <div class="card border-success mb-3">
                            <center> <h4 class="card-title">Banner</h4> </center>
                            <img src="<%=request.getContextPath()%>/ImgEstadServlet?a=Funciones&id=<%=listaEspeci.get(0).getIdfotoEstadFuncion()%>" style="width:353px; height:560px" alt="...">
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
                        <a href="<%=request.getContextPath()%>/EstadisticaServlet?a=irFunciones"><button class="btn btn-secondary btn-xl">Regresar</button></a>
                    </div>
                </div>
            </div>
            </div>
        </section>

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
