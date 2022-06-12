<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Editar Función</title>
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
                <a class="navbar-brand" href="index.jsp"><img src="assets/img/pucp_logo1.jpeg" alt="..." /></a>

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
                    </br>
                    <h2 class="section-heading text-uppercase">Editar Función</h2>

                <form class="row g-3 needs-validation" novalidate action="index.jsp">
                    <!--Columna 1-->
                    <div class="col-md-5">
                        <div class="form-group">
                            <!-- Name input-->
                            <label for="validationCustom01" class="form-label">Nombre de la función *</label>
                            <input class="form-control" id="nombre_funcion" type="text" value="Asu Mare"  disabled>
                        </div>
                        </br>
                        <div class="form-group">
                            <!-- Name input-->
                            <label for="validationCustom02" class="form-label">Género *</label>
                            <input class="form-control" id="nombre_funcion" type="text" value="Comedia"  disabled>
                        </div>
                        </br>
                        <div class="form-group">
                            <!-- Name input-->
                            <label for="validationCustom03" class="form-label">Duración *</label>
                            <input class="form-control" id="nombre_funcion" type="text" value="120"  disabled>
                        </div>
                        </br>
                        <div class="form-group">
                            <label for="validationCustom04" class="form-label">Sala *</label>
                            <input class="form-control" id="nombre_funcion" type="text" value="2"  disabled>
                        </div>
                        </br>
                        <div class="form-group">
                            <label for="validationCustom05" class="form-label">Restricción de edad *</label>
                            <input class="form-control" id="nombre_funcion" type="text" value="Apto para todos"  disabled>
                        </div>
                        </br>
                        <div class="form-group">
                            <label for="validationCustom06" class="form-label">Aforo *</label>
                            <input class="form-control" id="nombre_funcion" type="text" value="20"  disabled>
                        </div>
                        </br>
                        </br>
                        <button type="submit" class="btn btn-primary btn-xl" >
                            Editar
                        </button>
                    </div>
                    <div class="col-md-5">
                        <div class="form-group">
                            <label for="validationCustom08" class="form-label">Fecha de la función *</label>
                            <input type="date" class="form-control" id="validationCustom08" required>
                        </div>
                        <div class="form-group">
                            <label for="validationCustom09" class="form-label">Hora de la función *</label>
                            <input type="time" class="form-control" name="hora" min="15:00" max="21:00" step="1800" id="validationCustom09" required >
                        </div>
                        </br>
                        <div class="form-group">
                            <label for="validationCustom10" class="form-label">Precio de la entrada *</label>
                            <input class="form-control" placeholder="Ingrese el precio de entrada" type="number" min="1.00" max="20.00" step="0.5" id="validationCustom09" required>
                        </div>
                        </br>
                        <div class="form-group">
                            <label for="validationCustom11" class="form-label">Director *</label>
                            <!-- Name input-->
                            <input class="form-control" id="nombre_funcion" type="text" value="Cachin"  disabled>
                        </div>
                        </br>
                        <div class="form-group">
                            <label for="validationCustom12" class="form-label">Lista de actores *</label>
                            <select class="form-control" id="validationCustom12">
                                <option>Actores</option>
                                <option disabled>Chespiritio</option>
                                <option disabled>La Roca</option>
                                <option disabled>Ben Affleck</option>
                                <option disabled>Cachín</option>
                            </select>
                        </div>
                        </br>
                        <div class="form-group form-group-textarea mb-md-0">
                            <label for="validationCustom13" class="form-label">Lista de mantenimiento *</label>
                            <select class="form-control" id="validationCustom13">
                                <option>Mantenimiento</option>
                                <option disabled>Jaimito</option>
                                <option disabled>Rodri</option>
                                <option disabled>Pepe</option>
                            </select>
                        </div>
                        </br>
                    </div>
                </form>
            </div>



        </section>

        <!-- Footer-->


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
