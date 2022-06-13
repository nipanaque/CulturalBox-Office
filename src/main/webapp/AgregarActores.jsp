<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.culturalbox.Beans.CrearFuncion" %>
<jsp:useBean id="idFuncion" scope="request" type="com.example.culturalbox.Beans.CrearFuncion" />
<jsp:useBean type="java.util.ArrayList<com.example.culturalbox.Beans.CrearFuncion>" scope="request" id="listaActores"/>
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
        <nav class=" navbar navbar-expand-lg  navbar-dark bg-dark fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand" href="#page-top"><img src="assets/img/pucp_logo1.jpeg" alt="..." /></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars ms-1"></i>
                </button>
                <div class="collapse navbar-collapse " id="navbarResponsive">
                    <ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
                        <div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
                            <ul class="navbar-nav">
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        Admin1234
                                    </a>
                                    <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDarkDropdownMenuLink">
                                        <li><a class="dropdown-item" href="#">Perfil</a></li>
                                        <li><a class="dropdown-item" href="Directores">Directores</a></li>
                                        <li><a class="dropdown-item" href="Sedes">Sedes</a></li>
                                        <li><a class="dropdown-item" href="Clientes">Clientes</a></li>
                                        <li><a class="dropdown-item" href="operadores">Operadores</a></li>
                                        <li><a class="dropdown-item" href="#">Cerrar Sesion</a></li>
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
                    <h2 class="section-heading text-uppercase">ACTORES</h2>
                    </br>
                </div>
            </div>

            <!--Actores-->
            <div>
                <div class="container">
                    <form method="POST" action="<%=request.getContextPath()%>/ListaFunciones?a=guardaract">
                    <div class="row justify-content-evenly">
                        <%for(CrearFuncion actores: listaActores){%>
                        <div class="col-5">
                            <div class="card mb-3" style="max-width: 540px;">
                                <div class="row g-0">
                                    <div class="col-md-4">
                                        <img src="assets/img/Directores/19.jpg" style="width:150px; height:200px" class="img-fluid rounded-start" alt="...">
                                    </div>
                                    <div class="col-md-8">
                                        <div class="card-body">
                                            <input type="hidden" name="IdFuncion" id="IdFuncion" value="<%=idFuncion.getIdFuncion()%>" />
                                            <input class="form-check-input position-absolute end-0 top-0 border m-2"  name="IdActor" id="IdActor" multiple type="checkbox"  value="<%=actores.getId_actores()%>" aria-label="..." style="width:30px; height:30px ">
                                            <h6 class="card-title"><%=actores.getNombres_Actores()%></h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%}%>
                    </div>
                        </br>
                        </br>
                        <a href="ListaFunciones"><button type="button" class="btn btn-secondary btn-xl">Regresar</button></a>
                        <button type="submit" class="btn btn-primary btn-xl" data-bs-toggle="modal" data-bs-target="#exampleModal">
                            Agregar
                        </button>
                    </form>
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

