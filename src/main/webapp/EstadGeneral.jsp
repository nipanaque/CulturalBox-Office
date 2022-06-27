<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="inicio" scope="request" type="java.lang.String" class="java.lang.String" />
<jsp:useBean id="fecha" scope="request" type="java.lang.String" class="java.lang.String" />
<jsp:useBean id="listaEstadistica" scope="request" type="java.util.ArrayList<com.example.culturalbox.Beans.Estadistica>" class="java.util.ArrayList" />
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>EstadGeneral</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:500,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <style>
            .div-3 {
                background-color: #58d0ca;
            }
            .flexbox {
                align-items: center;
                display: flex;
                height: 210px;
                justify-content: center;
                width: 100px;

                background: #ffff99;
                color: #333;
            }
        </style>
    </head>
    <body>
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
        </br>
        <section class="page-section bg-light" id="portafolio">
            <div class="container">
                <h2 class="section-heading text-uppercase">Estadísticas generales</h2>


                <!--Formulario para mes y año-->
                <form method="post" class="row g-3" action="<%=request.getContextPath()%>/EstadisticaServlet?a=buscar">
                    <div class="col-auto">
                        <p>Ingrese mes y año: </p>
                    </div>
                    <div class="col-auto">
                        <input type="month" class="form-control" name="fecha" id="fecha" required>
                        <div class="invalid-feedback">
                            In this case is not necessary 'cause type is "month"
                        </div>
                    </div>
                    <div class="col-auto">
                        <button type="submit" class="btn btn-primary mb-3">Buscar</button>
                    </div>
                </form>


                </br>

                <% if(inicio.equals("vacio")){ %>
                <h5>Seleccione mes y año para el cual desea estadísticas generales, o busque de forma específica funciones, actores o directores con las opciones de abajo</h5>
                <% }else if (listaEstadistica.get(0).getNombre() != null){ %>
                <!-- Page cuadros primera parte -->
                <div class="row">
                    <h5>La fecha escogida fue: <%=fecha%></h5>
                    <!-- Cuadro 1.1 -->
                    <div class="col-sm-4">
                        <div class="card border-success mb-3" style="max-width: 400px;">
                            <div class="row g-0">
                                <div class="col-md-4">
                                    <img src="<%=request.getContextPath()%>/ImgEstadServlet?a=Funciones&id=<%=listaEstadistica.get(0).getId()%>" style="width:128px; height:185px" alt="...">
                                </div>
                                <div class="col-md-8">
                                    <div class="card-body">
                                        <h4 class="card-title">Función mejor calificada</h4>
                                        <p class = "fs-5"> <%=listaEstadistica.get(0).getNombre()%> </p>
                                        <% double puntaje = listaEstadistica.get(0).getPuntaje();
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

                    <!-- Cuadro 1.2 -->
                    <div class="col-sm-4">
                        <div class="card border-success mb-3" style="max-width: 400px;">
                            <div class="row g-0">
                                <div class="col-md-5">
                                    <img src="<%=request.getContextPath()%>/ImgEstadServlet?a=Funciones&id=<%=listaEstadistica.get(1).getId()%>" style="width:145px; height:185px" alt="...">
                                </div>
                                <div class="col-md-7">
                                    <div class="card-body">
                                        <h4 class="card-title">Función más vista</h4>
                                        <p class = "fs-5"><%=listaEstadistica.get(1).getNombre()%></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Cuadro 1.3 -->
                    <div class="col-sm-4">
                        <div class="card border-success mb-3" style="max-width: 400px;">
                            <div class="row g-0">
                                <div class="col-md-5">
                                    <img src="<%=request.getContextPath()%>/ImgEstadServlet?a=Funciones&id=<%=listaEstadistica.get(2).getId()%>" style="width:145px; height:185px" alt="...">
                                </div>
                                <div class="col-md-7">
                                    <div class="card-body">
                                        <h4 class="card-title">Función menos vista</h4>
                                        <p class = "fs-5"><%=listaEstadistica.get(2).getNombre()%></p>
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
                                    <img src="assets/img/drama.png" style="width:145px; height:185px" alt="...">
                                </div>
                                <div class="col-md-7">
                                    <div class="card-body">
                                        <h4 class="card-title">Género mas popular</h4>
                                        <p class = "fs-5"><%=listaEstadistica.get(3).getNombre()%></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Cuadro 2.2 -->
                    <div class="col-sm-4">
                        <div class="card border-success mb-3" style="max-width: 400px;">
                            <div class="row g-0">
                                <div class="col-md-4">
                                    <img src="<%=request.getContextPath()%>/ImgEstadServlet?a=Actores&id=<%=listaEstadistica.get(4).getId()%>" style="width:128px; height:185px" alt="...">
                                </div>
                                <div class="col-md-8">
                                    <div class="card-body">
                                        <h4 class="card-title">Actor mejor calificado</h4>
                                        <p class = "fs-5"><%=listaEstadistica.get(4).getNombre()%></p>
                                        <% double puntaje2 = listaEstadistica.get(4).getPuntaje();
                                            double parteDecimal2 = puntaje2 % 1;
                                            double parteEntera2 = puntaje2 - parteDecimal2;
                                            for(int i=0;i<parteEntera2;i++){ %>
                                        <img src="assets/img/star-fill.svg"  style="width:20px; height:20px" />
                                        <% }
                                            if (parteDecimal2 >= 0.5){ %>
                                        <img src="assets/img/star-half.svg"  style="width:20px; height:20px" />
                                        <% for(int i=0;i<5-(parteEntera2+1);i++){%>
                                        <img src="assets/img/star-empty.svg"  style="width:20px; height:20px" />
                                        <% } %>
                                        <% }else { %>
                                        <% for(int i=0;i<5-(parteEntera2);i++){%>
                                        <img src="assets/img/star-empty.svg"  style="width:20px; height:20px" />
                                        <% } %>
                                        <% } %>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Cuadro 2.3 -->
                    <div class="col-sm-4">
                        <div class="card border-success mb-3" style="max-width: 400px;">
                            <div class="row g-0">
                                <div class="col-md-4">
                                    <img src="<%=request.getContextPath()%>/ImgEstadServlet?a=Directores&id=<%=listaEstadistica.get(5).getId()%>" style="width:128px; height:185px" alt="...">
                                </div>
                                <div class="col-md-8">
                                    <div class="card-body">
                                        <h4 class="card-title">Director mejor calificado</h4>
                                        <p class = "fs-5"><%=listaEstadistica.get(5).getNombre()%></p>
                                        <% double puntaje3 = listaEstadistica.get(5).getPuntaje();
                                            double parteDecimal3 = puntaje3 % 1;
                                            double parteEntera3 = puntaje3 - parteDecimal3;
                                            for(int i=0;i<parteEntera3;i++){ %>
                                        <img src="assets/img/star-fill.svg"  style="width:20px; height:20px" />
                                        <% }
                                            if (parteDecimal3 >= 0.5){ %>
                                        <img src="assets/img/star-half.svg"  style="width:20px; height:20px" />
                                        <% for(int i=0;i<5-(parteEntera3+1);i++){%>
                                        <img src="assets/img/star-empty.svg"  style="width:20px; height:20px" />
                                        <% } %>
                                        <% }else { %>
                                        <% for(int i=0;i<5-(parteEntera3);i++){%>
                                        <img src="assets/img/star-empty.svg"  style="width:20px; height:20px" />
                                        <% } %>
                                        <% } %>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <% }else { %>
                <h5>La fecha escogida fue: <%=fecha%></h5>
                <h5>No se encontró resultados</h5>
                <% } %>

                </br>

                <!-- Botones buscar funciones, actores y directores -->
                <div class="row align-items-stretch mb-5">
                    <div class="col-md-3">
                    </div>
                    <div class="col-md-3">
                    </div>
                    <div class="col-md-3">
                        <a href="<%=request.getContextPath()%>/EstadisticaServlet?a=irFunciones"><button class="btn btn-primary btn-xl" type="submit">Buscar Funciones</button></a>
                    </div>
                    <div class="col-md-3">
                        <a href="<%=request.getContextPath()%>/EstadisticaServlet?a=irAcDir"><button class="btn btn-primary btn-xl" type="submit">Buscar Actores/Directores</button></a>
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
