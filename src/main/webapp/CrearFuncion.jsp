<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Crear Función</title>
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
                <a class="navbar-brand" href="index.html"><img src="assets/img/pucp_logo1.jpeg" alt="..." /></a>

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
                                        <li><a class="dropdown-item" href="estadisticasgeneral.html">Estadisticas</a></li>
                                        <li><a class="dropdown-item" href="salas.html">Salas</a></li>
                                        <li><a class="dropdown-item" href="#">Cerrar Sesión</a></li>
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
                    <h2 class="section-heading text-uppercase">Crear Función</h2>

                <form class="row g-3 needs-validation" novalidate action="horario.html" method="GET" enctype="multipart/form-data">
                    <!--Columna 1-->
                    <div class="col-md-6">
                        <div class="form-group">
                            <!-- Name input-->
                            <label for="validationCustom01" class="form-label">Nombre de la Funcion *</label>
                            <input type="text" class="form-control" placeholder="Ingrese nombre de la función" id="validationCustom01" required>
                        </div>
                        </br>
                        <div class="form-group">
                            <!-- Name input-->
                            <label for="validationCustom02" class="form-label">Género *</label>
                            <select class="form-select" id="validationCustom02" required>
                                <option disabled>Seleccionar género</option>
                                <option>Terror</option>
                                <option>Suspenso</option>
                                <option>Comedia</option>
                                <option>Drama</option>
                            </select>
                        </div>
                        </br>
                        <div class="form-group">
                            <!-- Name input-->
                            <label for="validationCustom03" class="form-label">Duración (minutos) *</label>
                            <input class="form-control" placeholder="Ingrese la duración en minutos" type="number" min="0" max="180" step="1" id="validationCustom03" required>
                        </div>
                        </br>
                        <div class="form-group">
                            <label for="validationCustom05" class="form-label">Restricción de edad *</label>
                            <select class="form-select" id="validationCustom05" required>
                                <option disabled>Ingrese restricción</option>
                                <option>+18</option>
                                <option>Apto para todos</option>
                            </select>
                        </div>
                        </br>
                        </br>
                        </br>
                        <div class="row align-items-stretch mb-5">
                            <div class="col-md-3">
                                <a href="index.html" class="btn btn-primary btn-xl">Regresar</a>
                            </div>
                            <div class="col-md-3">
                            </div>
                            <div class="col-md-3">
                                <button type="submit" class="btn btn-primary btn-xl" >
                                    Crear
                                </button>
                            </div>
                            <div class="col-md-3">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="validationCustom11" class="form-label">Añadir director *</label>
                            <select class="form-select" id="validationCustom11" required>
                                <option disabled>Seleccionar</option>
                                <option>Michael Bay</option>
                                <option>Guillermo Del Toro</option>
                            </select>
                        </div>
                        </br>
                        <div class="form-group">
                            <label for="validationCustom12" class="form-label">Añadir actores *</label>
                            <select class="form-select" id="validationCustom12" required>
                                <option disabled>Seleccionar</option>
                                <option>Chespiritio</option>
                                <option>La Roca</option>
                                <option>Ben Affleck</option>
                                <option>Cachín</option>
                            </select>
                        </div>
                        </br>
                        <div class="form-group form-group-textarea mb-md-0">
                            <!-- Message input-->
                            <label for="validationCustom07" class="form-label">Descripción de la función *</label>
                            <textarea class="form-control" type="text" placeholder="Descripción de la función" id="validationCustom07" required></textarea>
                        </div>
                        </br>
                        <div class="form-group">
                            <label for="banner" class="form-label">Banner *</label>
                            <input type="file" class="btn btn-primary" name="banner" style="background-color:grey; border-color:grey" id="banner" required>
                        </div>
                    </div>
                </form>
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

    </body>
</html>
