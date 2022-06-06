<%@ page import="com.example.culturalbox.Beans.Sedes" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="listaSedes" scope="request" type="java.util.ArrayList<com.example.culturalbox.Beans.Sedes>" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Sedes - Cultura Box</title>
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
                                <li><a class="dropdown-item" href="Actores">Actores</a></li>
                                <li><a class="dropdown-item" href="Directores.jsp">Directores</a></li>
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
            <h2 class="section-heading text-uppercase">Sedes</h2>
            <h3 class="section-subheading text-muted">Sedes Disponibles</h3>
        </div>
    </div>

    <div class="row justify-content-center">
        <div class="col-4">
            <div class="card mx-auto " style="width: 18rem;">
                <img src="assets/img/Sede1.jpg" class="card-img-top" alt="...">
                <div class="card-body text-center">
                    <h5 class="card-title">Sede <%=listaSedes.get(0).getNombre()%></h5>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">Ubicado en <%=listaSedes.get(0).getUbicacion()%></li>
                        <li class="list-group-item">Aforo total: <%=listaSedes.get(0).getAforo()%></li>
                        <li class="list-group-item">Cantidad de salas: <%=listaSedes.get(0).getCantidadSalas()%></li>
                    </ul>
                    <a href="EditarSede" class="btn btn-primary">Editar</a>
                </div>
            </div>
        </div>
        <div class="col-4">
            <div class="text-center">
                <div class="card mx-auto" style="width: 18rem;">
                    <img src="assets/img/Sede2.jpg" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">Sede <%=listaSedes.get(1).getNombre()%></h5>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item">Ubicado en <%=listaSedes.get(1).getUbicacion()%></li>
                            <li class="list-group-item">Aforo total: <%=listaSedes.get(1).getAforo()%></li>
                            <li class="list-group-item">Cantidad de salas: <%=listaSedes.get(1).getCantidadSalas()%></li>
                        </ul>
                        <a href="EditarSede" class="btn btn-primary">Editar</a>
                    </div>
                </div>
            </div>

        </div>
    </div>







</section>

<!-- Footer-->
<footer class="footer py-4">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-4 text-lg-start">Copyright &copy; Cultura Box</div>
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