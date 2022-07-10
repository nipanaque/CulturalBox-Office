<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="invalid1" scope="session" type="java.lang.String" class="java.lang.String"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Agregar - Cultura Box</title>
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

                                <li><a class="dropdown-item" href="Actores">Actores</a></li>
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
            <h2 class="section-heading text-uppercase">Agregar Director</h2>
            <h3 class="section-subheading text-muted">Por favor rellenar todos los campos para agregar un Director</h3>
            <%if (session.getAttribute("invalid1").equals("error")){%>
            <div class="text-danger nb-2">
                Este director ya existe.
            </div>
            <%session.removeAttribute("invalid1");%>
            <%}%>
        </div>
    </div>

    <form class="row g-3 needs-validation" novalidate action="<%=request.getContextPath()%>/Directores?a=agregar" method="POST" enctype="multipart/form-data">
        <div class="row justify-content-center">
            <!--Columna 1-->
            <div class="col-4">
                <div class="container">
                    <img src="assets/img/usuario.png" class="card-img-top" alt="..." style="width:250px; height:250px">
<<<<<<< HEAD
                    <a  href="javascript:explorar();" >
                        <div class="form-group">
                            <button type="button" class="btn btn-secondary">Subir foto</button>
                            <input type="file" name="f_subir" id="f_subir" style="display:none;" >
                        </div>
                    </a>
=======
                </div>
                <div >
                    <label for="foto" class="form-label">Foto *</label>
                </div>
                <div >
                    <input type="file" class="btn btn-primary" name="foto" style="background-color:grey; border-color:grey" id="foto" required>
>>>>>>> 0e7a2db686c3eaf31a7358ec70170e6dd8e912fa
                </div>
            </div>
            <!--Columna 2-->
            <div class="col-4">
                </br>
                <div class="mb-3">
                    </br>
                    <label for="validationCustom01" class="form-label">Nombre *</label>
                    <input type="text" class="form-control" name="nombreA" id="validationCustom01"  required>
                </div>
                <div class="mb-3">
                    <label for="validationCustom02" class="form-label">Apellido *</label>
                    <input type="text" class="form-control" name="apellidoA" id="validationCustom02"  required>
                </div>
            </div>
            <!-- Boton-->
            <div class="text-center">
                </br>
                <a href="Directores.html" class="btn btn-primary">Regresar</a>
                <button type="submit" class="btn btn-primary" >
                    Agregar
                </button>
            </div>
        </div>
    </form>



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

<script>
    var forms = document.querySelectorAll('.needs-validation');

    Array.prototype.slice.call(forms).forEach(function (form) {
        form.addEventListener('submit', function (event) {
            if (!form.checkValidity()) {
                event.preventDefault();
                event.stopPropagation();
            }

            form.classList.add('was-validated');
        }, false);
    });

</script>
<script>
    function explorar(){
        document.getElementById("f_subir").click()

    }
</script>

</body>
</html>
