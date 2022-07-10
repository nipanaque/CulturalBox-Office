<%@ page import="com.example.culturalbox.Beans.SalaReporte" %>
<%@ page import="com.example.culturalbox.Beans.Sedes" %>
<jsp:useBean id="listaSedes" scope="request" type="java.util.ArrayList<com.example.culturalbox.Beans.Sedes>" class="java.util.ArrayList" />
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="inicio" scope="request" type="java.lang.String" class="java.lang.String" />
<jsp:useBean id="fecha" scope="request" type="java.lang.String" class="java.lang.String" />
<jsp:useBean id="sede" scope="request" type="java.lang.String" class="java.lang.String" />
<jsp:useBean id="listaSalas" scope="request" type="java.util.ArrayList<com.example.culturalbox.Beans.SalaReporte>" class="java.util.ArrayList" />
<jsp:useBean id="usuarioSesion" scope="session" type="com.example.culturalbox.Beans.Usuario" class="com.example.culturalbox.Beans.Usuario"/>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reporte de salas</title>
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
                                        <%=usuarioSesion.getCorreo()%>
                                    </a>
                                    <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDarkDropdownMenuLink">
                                        <li><a class="dropdown-item" href="<%=request.getContextPath()%>/EstadisticaServlet">Estadisticas</a></li>
                                        <li><a class="dropdown-item" href="<%=request.getContextPath()%>/LoginServlet?finish=yes">Cerrar Sesión</a></li>
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
                <div class="text-center">
                    </br>
                    </br>
                    <h2 class="section-heading text-uppercase">Salas disponibles</h2>
                    <form method="post" class="row g-3" action="<%=request.getContextPath()%>/ReporteSalasServlet?a=buscar">
                        <div class="col-auto">
                            <label for="fecha" class="visually-hidden">Password</label>
                            <input type="date" class="form-control" name="fecha" id="fecha" placeholder="Ingrese fecha">
                        </div>
                        <div class="col-auto">
                            <select name="sede" id="sede" class="form-select">
                                <option value="1">San Miguel</option>
                                <option value="2">San Borja</option>
                            </select>
                        </div>
                        <div class="col-auto">
                            <button type="submit" class="btn btn-primary mb-3">Buscar</button>
                        </div>
                    </form>
                </div>
                <br/>
                <!-- Page Features-->
                <% if(inicio.equals("vacio")){ %>
                <h5>Seleccione la fecha y sede para visualizar el reporte de salas</h5>
                <div class="row align-items-stretch mb-5">
                    <div class="col-md-3">
                    </div>
                    <div class="col-md-3">
                    </div>
                    <div class="col-md-3">
                    </div>
                    <div class="col-md-3">
                        <a href="index_operadores.jsp"><button class="btn btn-secondary btn-xl" type="submit">Regresar</button></a>
                    </div>
                </div>
                <% }else{ %>
                <div class="row gx-lg-5">
                    <%int i=0;%>
                    <%for(SalaReporte listasalas: listaSalas){%>
                    <div class="col-lg-6 col-xxl-4 mb-5">
                        <div class="card bg-light border-0 h-100">
                            <div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
                                <h2 class="div-3" style="background-color:#DAAB00; border-color:#DAAB00; color:white">Sala <%=listasalas.getSalaSede()%></h2>
                                <%i++;%>
                                <div class="col-md-3">
                                    <div class="text-center"><a class="btn btn-success " href="<%=request.getContextPath()%>/ReporteSalasServlet?a=descargar&idSede=<%=listasalas.getIdSede()%>&idSala=<%=listasalas.getIdSala()%>&dia=<%=listasalas.getDia()%>">
                                        Download_S<%=listasalas.getSalaSede()%></a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%}%>
                    <%if(i==0){%>
                    <h5>La fecha o sede seleccionada no tiene reportes</h5>
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
                            <a href="<%=request.getContextPath()%>/OperadorIndexServlet"><button class="btn btn-secondary btn-xl" type="submit">Regresar</button></a>
                        </div>
                    </div>
                </div>
                <%}%>
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
