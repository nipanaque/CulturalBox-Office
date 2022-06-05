<%@ page import="com.example.culturalbox.Beans.Operadores" %>
<%@ page import="java.util.Objects" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean type="java.util.ArrayList<com.example.culturalbox.Beans.Operadores>" scope="request" id="operadores"/>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Operadores - Cultura Box</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="css/styles.css" rel="stylesheet" />
</head>
<body id="page-top">
<!-- Navigation-->
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
                                <li><a class="dropdown-item" href="Actores.jsp">Actores</a></li>
                                <li><a class="dropdown-item" href="Directores.jsp">Directores</a></li>
                                <li><a class="dropdown-item" href="Sedes.jsp">Sedes</a></li>
                                <li><a class="dropdown-item" href="Clientes.jsp">Clientes</a></li>
                                <li><a class="dropdown-item" href="operadores.jsp">Operadores</a></li>
                                <li><a class="dropdown-item" href="#">Cerrar Sesion</a></li>
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
            <h2 class="section-heading text-uppercase">Operadores</h2>
            </br>
        </div>
        <div class="row">
            <div class="col-lg-4 col-sm-6 mb-4">
                <!-- Portfolio item 1-->
                <% int i = 1;
                    for(Operadores op : operadores){ %>
                <h1><%=op.getNombre()%>></h1>
                <% i++;
                }%>
                <div class="card flex-md-row mb-4 box-shadow h-md-250">
                    <input class="form-check-input position-absolute end-0 top-0 border m-2"   type="checkbox" id="checkboxNoLabel" value="" aria-label="..." style="width:30px; height:30px ">
                    <img class="card-img-left" src="assets/img/portfolio/user.png">
                    <div class="card-body d-flex flex-column align-items-start">
                        <h3 ><a>Nombres Apellidos</a></h3>
                        <p class="card-text mb-auto">correo@pucp.edu.pe</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-sm-6 mb-4">
                <!-- Portfolio item 2-->
                <div class="card flex-md-row mb-4 box-shadow h-md-250">
                    <input class="form-check-input position-absolute end-0 top-0 border m-2"   type="checkbox" id="checkboxNoLabel" value="" aria-label="..." style="width:30px; height:30px ">
                    <img class="card-img-left" src="assets/img/portfolio/user.png">
                    <div class="card-body d-flex flex-column align-items-start">
                        <h3 ><a>Nombres Apellidos</a></h3>
                        <p class="card-text mb-auto">correo@pucp.edu.pe</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-sm-6 mb-4">
                <!-- Portfolio item 3-->
                <div class="card flex-md-row mb-4 box-shadow h-md-250">
                    <input class="form-check-input position-absolute end-0 top-0 border m-2"   type="checkbox" id="checkboxNoLabel" value="" aria-label="..." style="width:30px; height:30px ">
                    <img class="card-img-left" src="assets/img/portfolio/user.png">
                    <div class="card-body d-flex flex-column align-items-start">
                        <h3 ><a>Nombres Apellidos</a></h3>
                        <p class="card-text mb-auto">correo@pucp.edu.pe</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-sm-6 mb-4 mb-lg-0">
                <!-- Portfolio item 4-->
                <div class="card flex-md-row mb-4 box-shadow h-md-250">
                    <input class="form-check-input position-absolute end-0 top-0 border m-2"   type="checkbox" id="checkboxNoLabel" value="" aria-label="..." style="width:30px; height:30px ">
                    <img class="card-img-left" src="assets/img/portfolio/user.png">
                    <div class="card-body d-flex flex-column align-items-start">
                        <h3 ><a>Nombres Apellidos</a></h3>
                        <p class="card-text mb-auto">correo@pucp.edu.pe</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-sm-6 mb-4 mb-sm-0">
                <!-- Portfolio item 5-->
                <div class="card flex-md-row mb-4 box-shadow h-md-250">
                    <input class="form-check-input position-absolute end-0 top-0 border m-2"   type="checkbox" id="checkboxNoLabel" value="" aria-label="..." style="width:30px; height:30px ">
                    <img class="card-img-left" src="assets/img/portfolio/user.png">
                    <div class="card-body d-flex flex-column align-items-start">
                        <h3 ><a>Nombres Apellidos</a></h3>
                        <p class="card-text mb-auto">correo@pucp.edu.pe</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-sm-6">
                <!-- Portfolio item 6-->
                <div class="card flex-md-row mb-4 box-shadow h-md-250">
                    <input class="form-check-input position-absolute end-0 top-0 border m-2"   type="checkbox" id="checkboxNoLabel" value="" aria-label="..." style="width:30px; height:30px ">
                    <img class="card-img-left" src="assets/img/portfolio/user.png">
                    <div class="card-body d-flex flex-column align-items-start">
                        <h3 ><a>Nombres Apellidos</a></h3>
                        <p class="card-text mb-auto">correo@pucp.edu.pe</p>
                    </div>
                </div>
            </div>
        </div>
    </div>



    <!-- Contenedor de botones eliminar y agregar-->
    <div class = "container">
        <div class="row justify-content-end">
            <div class="col-2">
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Eliminar
                </button>
            </div>
            <div class="col-5">
                <a href="AgregarOperador.html"><button type="button" class="btn btn-secondary">Agregar</button></a>
            </div>
            <div class="col-1">
            </div>
        </div>
    </div>
</section>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Advertencia</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Está seguro que desea eliminar a los operadores seleccionados
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-primary">Eliminar</button>
            </div>
        </div>
    </div>
</div>



<!-- Footer-->
<footer class="footer py-4">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-4 text-lg-start">Copyright &copy; Your Website 2022</div>
            <div class="col-lg-4 my-3 my-lg-0">
                <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="Twitter"><i class="fab fa-twitter"></i></a>
                <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="Facebook"><i class="fab fa-facebook-f"></i></a>
                <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="LinkedIn"><i class="fab fa-linkedin-in"></i></a>
            </div>
            <div class="col-lg-4 text-lg-end">
                <a class="link-dark text-decoration-none me-3" href="#!">Privacy Policy</a>
                <a class="link-dark text-decoration-none" href="#!">Terms of Use</a>
            </div>
        </div>
    </div>
</footer>





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
