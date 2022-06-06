<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.culturalbox.Beans.Clientes" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    ArrayList<Clientes> listaClientes =  (ArrayList<Clientes>) request.getAttribute("listaClientes");
%>

<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Agency - Start Bootstrap Theme</title>
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
                                <li><a class="dropdown-item" href="Actores">Actores</a></li>
                                <li><a class="dropdown-item" href="Directores">Directores</a></li>
                                <li><a class="dropdown-item" href="Sedes">Sedes</a></li>
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
<!-- Portfolio Grid-->
<section class="page-section bg-light" id="portfolio">
    <div class="container">
        <div class="text-center">
            </br>
            <h2 class="section-heading text-uppercase">Clientes</h2>
            </br>
        </div>
        <div class="row  align-items-center">
            <div class="col-md-auto">
                <div class="text-left">
                    <h5>Filtrar por:</h5>
                </div>
            </div>
            <div class="col-md-auto">
                <select class="form-select" aria-label="Default select example" >

                    <option selected value="sin filtro" >Sin Filtro </option>
                    <option value="1" >Sede</option>
                    <option value="2">Funcion</option>
                </select>
            </div>
            <div class="col-md-auto">
                <select class="form-select" aria-label="Default select example">
                    <option selected>----</option>
                    <option selected>San Borja</option>
                    <option value="1">San Miguel</option>
                    <option selected>Doctor Strange</option>
                    <option value="1">Transformers</option>
                </select>
            </div>
            <div class="col-md-auto">
                <h1 class="btn btn-primary" href="#" role="button">Filtrar</h1>
            </div>
        </div>
        </br>
        <div class="row">
            <%for(Clientes clientes: listaClientes){%>
            <div class="col-lg-4 col-sm-6 mb-4">
                <!-- Portfolio item 1-->
                <div class="card flex-md-row mb-4 box-shadow h-md-250">
                    <img class="card-img-left" src="assets/img/user.png">
                    <div class="card-body d-flex flex-column align-items-start">
                        <h6 ><a><%=clientes.getNombre()%></a></h6>
                        <p3 class="card-text mb-auto">Función: <%=clientes.getFuncion()%></p3>
                        <p3 class="card-text mb-auto">Sede: <%=clientes.getSede()%></p3>
                        <p3 class="card-text mb-auto">Sala: <%=clientes.getSala()%></p3>
                    </div>
                </div>
            </div>
            <%}%>
        </div>
    </div>


</section>
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