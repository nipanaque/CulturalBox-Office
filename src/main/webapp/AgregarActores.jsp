<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.culturalbox.Beans.CrearFuncion" %>
<jsp:useBean id="idFuncion" scope="request" type="com.example.culturalbox.Beans.CrearFuncion" />
<jsp:useBean type="java.util.ArrayList<com.example.culturalbox.Beans.CrearFuncion>" scope="request" id="listaActores"/>
<jsp:useBean type="java.util.ArrayList<com.example.culturalbox.Beans.CrearFuncion>" scope="request" id="listaActoresFuncion"/>
<jsp:useBean id="existe" scope="session" type="java.lang.String" class="java.lang.String"/>
<jsp:useBean id="usuarioSesion" scope="session" type="com.example.culturalbox.Beans.Usuario" class="com.example.culturalbox.Beans.Usuario"/>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Actores - Cultura Box</title>
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
                                        <li><a class="dropdown-item" href="ReporteSalasServlet">Salas</a></li>
                                        <li><a class="dropdown-item" href="<%=request.getContextPath()%>/LoginServlet?finish=yes">Cerrar Sesión</a></li>
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
            <!--Actores-->
            <div class="container">
                </br>
                </br>

                <div class="row align-items-stretch mb-5">
                    <div class="col-md-6">
                        <h2 class="section-heading text-uppercase">Agregar actores</h2>
                        <form method="POST" action="<%=request.getContextPath()%>/ListaFunciones?a=guardaract">
                            </br>
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th scope="col">Nombres</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%for(CrearFuncion actores: listaActores){%>
                                    <tr>
                                        <td><%=actores.getNombres_Actores()%></td>
                                        <td><input name="IdActor" id="IdActor" multiple  type="checkbox"  value="<%=actores.getId_actores()%>" aria-label="..." style="width:30px; height:30px "></td>
                                        <td><input type="hidden" name="IdFuncion" id="IdFuncion" value="<%=idFuncion.getIdFuncion()%>" /></td>
                                    </tr>
                                    <%}%>
                                </tbody>
                            </table>
                            </br>
                            <div class="row align-items-stretch mb-5">
                                <div class="col-md-2">
                                    <a href="ListaFunciones"><button type="button" class="btn btn-secondary ">Regresar</button></a>
                                </div>
                                <div class="col-md-2">
                                    <button type="submit" class="btn btn-primary " data-bs-toggle="modal" data-bs-target="#exampleModal">
                                        Agregar
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="col-md-6">
                        <%if(listaActoresFuncion.size()>0){%>
                        <h2 class="section-heading text-uppercase">Lista actores</h2>
                        </br>
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th scope="col">Nombres</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%for(CrearFuncion actores: listaActoresFuncion){%>
                                <tr>
                                    <td><%=actores.getNombres_Actores()%></td>
                                </tr>
                                <%}%>
                            </tbody>
                        </table>
                        <h6 class="section-heading">*Seleccionar una a la vez</h6>
                        <%} else{%>
                        <h2 class="section-heading text-uppercase">Aún no hay actores en la Función</h2>
                        <h6 class="section-heading">*Seleccionar una a la vez</h6>
                        <%}%>
                        <%if (session.getAttribute("existe").equals("error")){%>
                        <div class="text-danger nb-3">
                            Ya existe el actor en la función.
                        </div>
                        <%session.removeAttribute("existe");%>
                        <%}%>
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

        <!-- Footer-->

    </body>


</html>

