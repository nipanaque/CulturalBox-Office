<%@ page import="com.example.culturalbox.Beans.Estadistica" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="actor" scope="request" type="java.util.ArrayList<com.example.culturalbox.Beans.Estadistica>" class="java.util.ArrayList"/>
<jsp:useBean id="director" scope="request" type="java.util.ArrayList<com.example.culturalbox.Beans.Estadistica>" class="java.util.ArrayList"/>
<jsp:useBean id="tipo" scope="request" type="java.lang.String" class="java.lang.String"/>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Buscar Actor/Director</title>

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
            .div-4 {
                background-color: #abec4b;
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
        <hr/>
        <!-- Portfolio Grid-->
        <section class="page-section bg-light" id="portfolio">
            <div class="container">
                <h2 class="section-heading text-uppercase">Buscar: Actores / Directores</h2>

                <!--Formulario para busqueda actores y directores-->
                <form method="post" class="row g-3" action="<%=request.getContextPath()%>/EstadisticaServlet?a=buscarAcDir">
                    <div class="col-auto">
                        <p>Ingrese actor o director: </p>
                    </div>
                    <div class="col-auto">
                        <input type="text" class="form-control" name="nombre" id="nombre" placeholder="Nombre y apellido" required>
                    </div>
                    <div class="col-auto">
                        <!--Lista fija-->
                        <select class="form-select" id="genero" name="tipo" required>
                            <option selected disabled value="">Seleccionar</option>
                            <option value="Actor">Actor</option>
                            <option value="Director">Director</option>
                        </select>
                    </div>
                    <div class="col-auto">
                        <button type="submit" class="btn btn-primary mb-3">Buscar</button>
                    </div>
                </form>

                <%if(tipo.equals("Actor") && actor.get(0).getNombre()!=null){%>
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
                                        <% for(int i=0;i<5-(parteEntera+1);i++){%>
                                        <img src="assets/img/star-empty.svg"  style="width:20px; height:20px" />
                                        <% } %>
                                        <% }else { %>
                                        <% for(int i=0;i<5-(parteEntera);i++){%>
                                        <img src="assets/img/star-empty.svg"  style="width:20px; height:20px" />
                                        <% } %>
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
                                <img src="<%=request.getContextPath()%>/ImgEstadServlet?a=Actores&id=<%=actor.get(0).getId()%>" style="width:310px" alt="...">
                                <p class="card-text"><small class="text-muted">Imagen referencial</small></p>
                            </div>
                        </div>
                    </div>
                </div>

                <%}else if(tipo.equals("Director") && director.get(0).getNombre()!=null){%>

                </br>
                <h2 class="section-heading text-uppercase"> <%=director.get(0).getNombre()%> </h2>
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
                                        <h3 class="card-title">Calificación director</h3>
                                        <p class = "fs-5">Resultados en base a los usuarios:</p>
                                        <% double puntaje = director.get(0).getPuntaje();
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
                                        <h3 class="card-title">Funciones dirigidas</h3>
                                        <% for(int i = 1; i<director.size();i++){ %>
                                        <p class="mb-0">- <%=director.get(i).getNombre()%></p>
                                        <% } %>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-xxl-4 mb-5">
                        <div class="card border-success mb-3" style="max-width: 540px;">
                            <div class="card-body">
                                <h3 class="card-title">Fotografía de director(a)</h3>
                                <img src="<%=request.getContextPath()%>/ImgEstadServlet?a=Directores&id=<%=director.get(0).getId()%>" style="width:310px" alt="...">
                                <p class="card-text"><small class="text-muted">Imagen referencial</small></p>
                            </div>
                        </div>
                    </div>
                </div>

                <%}else if ((director.isEmpty() || actor.isEmpty()) && (tipo.equals("Actor") || tipo.equals("Director"))){%>
                <h5>No se encontró resultados</h5>
                <%}else{%>
                <%}%>


                    <!-- Return button-->
                <div class="row align-items-stretch mb-5">
                    <div class="col-md-3">
                    </div>
                    <div class="col-md-3">
                    </div>
                    <div class="col-md-3">
                    </div>
                    <div class="col-md-3">
                        <a href="<%=request.getContextPath()%>/EstadisticaServlet?a=inicio"><button class="btn btn-secondary btn-xl" type="submit">Regresar</button></a>
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

