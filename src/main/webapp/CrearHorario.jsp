<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Crear Horarios</title>
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
                    <h2 class="section-heading text-uppercase">Crear Horarios</h2>

                <form class="row g-3 needs-validation" novalidate action="index.html" method="GET" enctype="multipart/form-data">
                    <!--Columna 1-->
                    <div class="col-md-6">
                        <div class="form-group">
                            <!-- Name input-->
                            <label for="validationCustom01" class="form-label">Nombre de la función *</label>
                            <input class="form-control" id="nombre_funcion" type="text" value="Asu Mare"  disabled>
                        </div>
                        </br>
                        <div class="form-group">
                            <label for="validationCustom03" class="form-label">Sedes *</label>
                            <select class="form-select" id="validationCustom03" required>
                                <option disabled>Seleccione sede</option>
                                <option>San Miguel</option>
                                <option>San Borja</option>
                            </select>
                        </div>
                        </br>
                        <div class="form-group">
                            <label for="validationCustom04" class="form-label">Salas *</label>
                            <select class="form-select" id="validationCustom04" required>
                                <option disabled>Seleccione las salas</option>
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                            </select>
                        </div>
                        </br>
                        <div class="form-group">
                            <label for="validationCustom06" class="form-label">Stock *</label>
                            <input class="form-control" placeholder="Ingrese el stock" type="number" min="0" max="25" step="1" id="validationCustom06" required>
                        </div>
                        </br>
                        <div class="form-group">
                            <label for="validationCustom10" class="form-label">Precio de la entrada *</label>
                            <input class="form-control" placeholder="Ingrese el precio de entrada" type="number" min="1.00" max="20.00" step="0.5" id="validationCustom09" required>
                        </div>
                        </br>
                        </br>
                        <div class="row align-items-stretch mb-5">
                            <div class="col-md-3">
                                <a href="nuevafuncion.html" class="btn btn-primary btn-xl">Regresar</a>
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
                            <label for="validationCustom08" class="form-label">Fecha de la función *</label>
                            <input type="date" class="form-control" id="validationCustom08" required>
                        </div>
                        </br>
                        <div class="form-group">
                            <label for="validationCustom09" class="form-label">Hora de la función *</label>
                            <input type="time" class="form-control" name="hora" min="15:00" max="21:00" step="1800" id="validationCustom09" required >
                        </div>
                        </br>
                        <div class="form-group form-group-textarea mb-md-0">
                            <label for="validationCustom13" class="form-label">Añadir lista de mantenimiento *</label>
                            <!-- Message input-->
                            <textarea class="form-control" type="text" placeholder="Lista de mantenimiento" id="validationCustom12" required></textarea>
                        </div>
                        </br>
                        <div class="form-group">
                            <label for="validationCustom14" class="form-label">Lista de Mantenimiento anteriores *</label>
                            <select class="form-select" id="validationCustom14" required>
                                <option disabled>Seleccionar</option>
                                <option>Jorge Espejo</option>
                                <option>Claudio Pizarro</option>
                                <option>Edison Flores</option>
                            </select>
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