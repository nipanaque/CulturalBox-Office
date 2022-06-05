<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
                                <li><a class="dropdown-item" href="Actores.html">Actores</a></li>
                                <li><a class="dropdown-item" href="Directores.html">Directores</a></li>
                                <li><a class="dropdown-item" href="Sedes.html">Sedes</a></li>
                                <li><a class="dropdown-item" href="Clientes.html">Clientes</a></li>
                                <li><a class="dropdown-item" href="operadores.html">Operadores</a></li>
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
            <h2 class="section-heading text-uppercase">Sede San Borja</h2>
            <h3 class="section-subheading text-muted"></h3>
        </div>

        <div class="card mb-3">
            <img src="assets/img/Sede2.jpg" class="card-img-top" alt="...">
            <div class="card-body">
                <h5 class="card-title">Datos</h5>
                <p class="card-text">Ubicado en Av.Los Santos 134</p>
                <div class="row g-3 align-items-center">
                    <div class="col-auto">
                        <label for="inputAforoSede" class="col-form-label">Aforo de la sede: </label>
                    </div>
                    <div class="col-auto">
                        <input type="number" id="inputAforoSede" class="form-control" aria-describedby="passwordHelpInline" value="660">
                    </div>
                    <div class="col-auto">
                    </div>
                </div>
                <!-- Tabla de salas-->
                </br>
                <table class="table mx-auto" style="width:500px">
                    <thead class="table-dark">
                    <tr>
                        <th scope="col" style="width:250px">Sala </th>
                        <th scope="col">Aforo</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>1</td>
                        <td><input type="number" id="inputAforoSede" class="form-control" aria-describedby="passwordHelpInline" value="66"></td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td><input type="number" id="inputAforoSede" class="form-control" aria-describedby="passwordHelpInline" value="45"></td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td><input type="number" id="inputAforoSede" class="form-control" aria-describedby="passwordHelpInline" value="72"></td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td><input type="number" id="inputAforoSede" class="form-control" aria-describedby="passwordHelpInline" value="60"></td>
                    </tr>
                    <tr>
                        <td>5</td>
                        <td><input type="number" id="inputAforoSede" class="form-control" aria-describedby="passwordHelpInline" value="55"></td>
                    </tr>
                    <tr>
                        <td>6</td>
                        <td><input type="number" id="inputAforoSede" class="form-control" aria-describedby="passwordHelpInline" value="80"></td>
                    </tr>
                    <tr>
                        <td>7</td>
                        <td><input type="number" id="inputAforoSede" class="form-control" aria-describedby="passwordHelpInline" value="63"></td>
                    </tr>
                    <tr>
                        <td>8</td>
                        <td><input type="number" id="inputAforoSede" class="form-control" aria-describedby="passwordHelpInline" value="80"></td>
                    </tr>
                    </tbody>
                </table>

                <div class="text-center">
                    <a href="Sedes.html" class="btn btn-primary">Regresar</a>
                    <a href="Sedes.html" class="btn btn-secondary">Guardar</a>
                </div>

                </br>
                <p class="card-text"><small class="text-muted">Ultima modificacion hace 2 días</small></p>
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
