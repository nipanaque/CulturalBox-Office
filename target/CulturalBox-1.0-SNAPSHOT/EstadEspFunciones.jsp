<%@ page import="com.example.culturalbox.Beans.Estadistica" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="respuesta" scope="request" type="java.lang.String" class="java.lang.String" />
<jsp:useBean id="usuarioSesion" scope="session" type="com.example.culturalbox.Beans.Usuario" class="com.example.culturalbox.Beans.Usuario"/>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>EstadisticasFuncion</title>
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
    <body>
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
        </br>
        <section class="page-section bg-light" id="portafolio">
            <div class="container">
                <br/>
                    <h2 class="section-heading text-uppercase">Estadísticas Específicas Funciones</h2>

                <!-- Cuadro que encierra el formulario y la imagen-->
                <div class="container">
                    <div class="row">
                        <div class="row">
                            <div class="col-sm-7">

                                <form method="post" id="form1" action="<%=request.getContextPath()%>/EstadisticaServlet?a=buscarEspeciFun">
                                    <div class="row align-items-stretch mb-5">
                                        <div class="col-md-11">
                                            <p class="mb-0"> Género</p>
                                            <div class="form-group">
                                                <!--Lista fija-->
                                                <select class="form-select" id="genero" name="genero" required>
                                                    <option selected disabled value="">Seleccionar género</option>
                                                    <option value="Terror">Terror</option>
                                                    <option value="Suspenso">Suspenso</option>
                                                    <option value="Comedia">Comedia</option>
                                                    <option value="Drama">Drama</option>
                                                </select>
                                            </div>
                                            </br>
                                            <p class="mb-0"> Nombre de la función</p>
                                            <div class="form-group">
                                                <!--Lista variable-->
                                                <input type="text" class="form-control" name="nomFuncion" id="nomFuncion" placeholder="Ingrese Nombre" required>
                                            </div>
                                            </br>
                                            <p class="mb-0"> Fecha</p>
                                            <div class="form-group">
                                                <!-- date input-->
                                                <input type="date" class="form-control" id="fecha" name="fecha" required>
                                            </div>
                                            </br>
                                            <p class="mb-0"> Hora</p>
                                            <div class="form-group">
                                                <input type="time" class="form-control" id="hora" name="hora" min="09:00" max="24:00" required>
                                            </div>
                                        </div>
                                    </div>
                                </form>

                            </div>


                            <div class="col-sm-1">
                                <img src="assets/img/local.jpg" style="width:500px; height:335px" alt="...">
                            </div>
                        </div>
                    </div>
                </div>

                <%if(session.getAttribute("msg") != null){%>
                <div>
                    <div class="alert alert-danger" role="alert"><%=session.getAttribute("msg")%></div>
                </div>
                <%session.removeAttribute("msg");%>
                <%}%>

                <div class="row align-items-stretch mb-5">
                    <div class="col-md-3">
                    </div>
                    <div class="col-md-3">
                    </div>
                    <div class="col-md-3">
                        <!--Este es un boton externo al formulario, pero vinculado con el form="form1" ya que el id del formulario es tambien "form1"-->
                        <a><button class="btn btn-primary btn-xl" type="submit" form="form1">Buscar</button></a>
                    </div>
                    <div class="col-md-3">
                        <a href="<%=request.getContextPath()%>/EstadisticaServlet?a=inicio"><button class="btn btn-secondary btn-xl">Regresar</button></a>
                    </div>
                </div>
            </div>
        </section>

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