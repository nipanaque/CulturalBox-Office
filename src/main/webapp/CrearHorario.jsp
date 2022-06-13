<%@ page import="com.example.culturalbox.Beans.Sedes" %>
<%@ page import="com.example.culturalbox.Beans.CrearFuncion" %>
<%@ page import="java.util.Objects" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean type="java.util.ArrayList<com.example.culturalbox.Beans.Sedes>" scope="request" id="listaSedes"/>
<jsp:useBean type="java.util.ArrayList<com.example.culturalbox.Beans.CrearFuncion>" scope="request" id="listaFunciones"/>
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
                </br>
                <h2 class="section-heading text-uppercase">Crear Horarios</h2>

                <form class="row g-3 needs-validation" method="POST" action="<%=request.getContextPath()%>/CrearHorario?a=guardar">
                    <!--Columna 1-->
                    <div class="col-md-6">
                        <div class="form-group">
                            <!-- Name input-->
                            <label for="funcion" class="form-label">Nombre de la función *</label>
                            <select class="form-select" name="funcion" id="funcion" required>
                                <%for(CrearFuncion listafuncion1 : listaFunciones){%>
                                <optgroup label="<%=listafuncion1.getNombre()%>">
                                    <option><%=listafuncion1.getIdFuncion()%></option>
                                </optgroup>
                                <%}%>
                            </select>
                        </div>
                        </br>
                        <div class="form-group">
                            <label for="sede" class="form-label">Sedes *</label>
                            <select class="form-select" name="sede" id="sede" required>
                                <option disabled>Seleccione sede</option>
                                <%int j=1;%>
                                <%for(Sedes listasedes1 : listaSedes){%>
                                <optgroup label="<%=listasedes1.getNombre()%>">
                                    <option><%=j++%></option>
                                </optgroup>
                                <%}%>
                            </select>
                        </div>
                        </br>
                        <div class="form-group">
                            <%int i=1;%>
                            <label for="sala" class="form-label">Salas *</label>
                            <select class="form-select" name="sala" id="sala" required>
                                <option disabled>Seleccione las salas</option>
                                <%while(i<=5){%>
                                <option><%=i++%></option>
                                <%}%>
                            </select>
                        </div>
                        </br>
                        <div class="form-group">
                            <label for="stock" class="form-label">Stock *</label>
                            <input class="form-control" placeholder="Ingrese el stock" type="number" min="0" max="25" step="1" name="stock" id="stock" required>
                        </div>
                        </br>
                        <div class="form-group">
                            <label for="costo" class="form-label">Precio de la entrada *</label>
                            <input class="form-control" placeholder="Ingrese el precio de entrada" type="number" min="1.00" max="20.00" step="0.5" name="costo" id="costo" required>
                        </div>
                        </br>
                        </br>
                        <div class="row align-items-stretch mb-5">
                            <div class="col-md-3">
                                <a href="index_operadores.jsp" class="btn btn-primary btn-xl">Regresar</a>
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
                            <label for="dia" class="form-label">Fecha de la función *</label>
                            <input type="date" class="form-control" name="dia" id="dia" required>
                        </div>
                        </br>
                        <div class="form-group">
                            <label for="tiempo_inicio" class="form-label">Hora de la función *</label>
                            <input type="time" class="form-control" min="15:00" max="21:00" step="1800" name="tiempo_inicio" id="tiempo_inicio" required >
                        </div>
                        </br>
                        <div class="form-group">
                            <label for="vigencia" class="form-label">Vigencia *</label>
                            <select class="form-select" name="vigencia" id="vigencia" >
                                <option disabled>Seleccione Vigencia</option>
                                <option>1</option>
                                <option>0</option>
                            </select>
                        </div>
                        </br>
                        <div class="form-group form-group-textarea mb-md-0">
                            <label for="mantenimiento" class="form-label">Añadir lista de mantenimiento *</label>
                            <!-- Message input-->
                            <textarea class="form-control" type="text" placeholder="Lista de mantenimiento" id="mantenimiento" ></textarea>
                        </div>
                        </br>
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