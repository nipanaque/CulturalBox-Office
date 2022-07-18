<%@ page import="java.time.LocalDate" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="idHorario" scope="request" type="com.example.culturalbox.Beans.Horarios" />
<jsp:useBean id="cruce" scope="session" type="java.lang.String" class="java.lang.String"/>
<jsp:useBean id="costo" scope="session" type="java.lang.String" class="java.lang.String"/>
<jsp:useBean id="usuarioSesion" scope="session" type="com.example.culturalbox.Beans.Usuario" class="com.example.culturalbox.Beans.Usuario"/>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Editar Horario</title>
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
                <a class="navbar-brand" href="index_operadores.jsp" ><img src="assets/img/pucp.png" alt="..." style="height: 65px;width: 170px;border-radius: 3px;"/></a>

                <div class="collapse navbar-collapse " id="navbarResponsive">
                    <ul class="navbar-nav ms-auto py-4 py-lg-0">
                        <div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
                            <ul class="navbar-nav">
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <%=usuarioSesion.getCorreo()%>
                                    </a>
                                    <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDarkDropdownMenuLink">
                                        <li><a class="dropdown-item" href="<%=request.getContextPath()%>/EstadisticaServlet">Estadisticas</a></li>
                                        <li><a class="dropdown-item" href="ReporteSalasServlet">Salas</a></li>
                                        <li><a class="dropdown-item" href="<%=request.getContextPath()%>/LoginServlet?finish=yes">Cerrar Sesión</a></li>
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
                    <h2 class="section-heading text-uppercase">Editar Horario</h2>
                    <%if (session.getAttribute("cruce").equals("error")){%>
                    <div class="text-danger nb-3">
                        No se puede editar el horario
                    </div>
                    <%session.removeAttribute("cruce");%>
                    <%}%>
                    <%if (session.getAttribute("costo").equals("error")){%>
                    <div class="text-danger nb-3">
                        No se puede editar el horario
                    </div>
                    <%session.removeAttribute("costo");%>
                    <%}%>

                <form class="row g-3 needs-validation" method="POST" action="<%=request.getContextPath()%>/ListaHorarios?a=actualizar">
                    <!--Columna 1-->
                    <div class="col-md-5">
                        <div class="form-group">
                            <label for="nombre_funcion" class="form-label">Nombre Función *</label>
                            <input class="form-control" id="nombre_funcion" type="text" value="<%=idHorario.getNombre_funcion()%>"  disabled>
                            <input type="hidden" name="nombre_funcion1" id="nombre_funcion1" value="<%=idHorario.getNombre_funcion()%>" />
                        </div>
                        </br>
                        <div class="form-group">
                            <label for="genero_funcion" class="form-label">Género *</label>
                            <input class="form-control" id="genero_funcion" type="text" value="<%=idHorario.getGenero_funcion()%>"  disabled>
                        </div>
                        </br>
                        <div class="form-group">
                            <label for="Sede" class="form-label">Sede *</label>
                            <input class="form-control" id="Sede" type="text" value="<%=idHorario.getNombre_sede()%>"  disabled>
                        </div>
                        <div class="form-group">
                            <input type="hidden" name="idhora" id="idhora" value="<%=idHorario.getIdHorario()%>" />
                        </div>
                        <div class="form-group">
                            <input type="hidden" name="idSede" id="idSede" value="<%=idHorario.getIdSede()%>" />
                        </div>
                        </br>
                        <div class="form-group">
                            <label for="SalaSede" class="form-label">Sala *</label>
                            <input class="form-control" id="SalaSede" type="text" value="<%=idHorario.getSalaSede()%>"  disabled>
                        </div>
                        <div class="form-group">
                            <input type="hidden" name="idSala" id="idSala" value="<%=idHorario.getIdSala()%>" />
                        </div>
                        </br>
                        </br>
                        <div class="row align-items-stretch mb-5">
                            <div class="col-md-3">
                                <a href="ListaHorarios"><button type="button" class="btn btn-secondary btn-xl">Regresar</button></a>
                            </div>
                            <div class="col-md-3">
                            </div>
                            <div class="col-md-3">
                                <button type="submit" class="btn btn-primary btn-xl" >
                                    Editar
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-5">
                        <div class="form-group">
                            <label for="Aforo" class="form-label">Aforo *</label>
                            <input class="form-control" id="Aforo" type="text" value="<%=idHorario.getHorario_aforo()%>"  disabled>
                        </div>
                        </br>
                        <div class="form-group">
                            <%
                                LocalDate todaysDate = LocalDate.now();
                                LocalDate tommorrosDate = todaysDate.plusDays(1);
                                String tomorrowToStr = tommorrosDate.toString();
                                String todayToStr = todaysDate.toString();
                            %>
                            <label for="dia" class="form-label">Fecha de la función *</label>
                            <input type="date" class="form-control" name="dia" id="dia" max="2022-12-31" min="<%=tomorrowToStr%>" required>
                        </div>
                        </br>
                        <div class="form-group">
                            <label for="tiempo_inicio" class="form-label">Hora de la función *</label>
                            <input type="time" class="form-control" min="13:00" max="21:00" step="1800" name="tiempo_inicio" id="tiempo_inicio" required >
                        </div>
                        </br>
                        <div class="form-group">
                            <label for="costo" class="form-label">Precio de la entrada *</label>
                            <input class="form-control" placeholder="Ingrese el precio de entrada" type="number" min="1.00" max="20.00" step="0.5" name="costo" id="costo" required>
                        </div>
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
