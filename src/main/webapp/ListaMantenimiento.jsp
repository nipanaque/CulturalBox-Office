<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.culturalbox.Beans.Horarios" %>
<%@ page import="com.example.culturalbox.Beans.Mantenimiento" %>
<jsp:useBean id="idHorario" scope="request" type="com.example.culturalbox.Beans.Horarios" />
<jsp:useBean type="java.util.ArrayList<com.example.culturalbox.Beans.Mantenimiento>" scope="request" id="listaMantenimiento"/>
<jsp:useBean type="java.util.ArrayList<com.example.culturalbox.Beans.Mantenimiento>" scope="request" id="listaMantenimientoidH"/>
<jsp:useBean id="existe" scope="session" type="java.lang.String" class="java.lang.String"/>
<jsp:useBean id="existe1" scope="session" type="java.lang.String" class="java.lang.String"/>
<jsp:useBean id="error1" scope="session" type="java.lang.String" class="java.lang.String"/>
<jsp:useBean id="error2" scope="session" type="java.lang.String" class="java.lang.String"/>
<jsp:useBean id="usuarioSesion" scope="session" type="com.example.culturalbox.Beans.Usuario" class="com.example.culturalbox.Beans.Usuario"/>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Mantenimiento</title>
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
        <section class="page-section bg-light" id="portfolio">
            <div class="container">
                </br>
                </br>
                <h2 class="section-heading text-uppercase">Listar y crear Mantenimiento</h2>
                <h6 class="section-heading">*Seleccionar una a la vez</h6>
                <%if (session.getAttribute("existe").equals("error")){%>
                <div class="text-danger nb-3">
                    Ya existe este personal en el horario.
                </div>
                <%session.removeAttribute("existe");%>
                <%}%>

                <div class="row align-items-stretch mb-5">
                    <div class="col-md-6">
                        <form method="POST" action="<%=request.getContextPath()%>/ListaHorarios?a=guardarmant">
                            </br>
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th scope="col">Nombre</th>
                                        <th scope="col">Apellido</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%for(Mantenimiento listaMantenimiento1: listaMantenimiento){%>
                                    <tr>
                                        <td><%=listaMantenimiento1.getNombre()%></td>
                                        <td><%=listaMantenimiento1.getApellido()%></td>
                                        <td><input name="idMantenimiento" id="idMantenimiento" multiple  type="checkbox"  value="<%=listaMantenimiento1.getIdMantenimiento()%>" aria-label="..." style="width:30px; height:30px "></td>
                                        <td><input type="hidden" name="idHorario" id="idHorario" value="<%=idHorario.getIdHorario()%>" /></td>
                                    </tr>
                                    <%}%>
                                </tbody>
                            </table>
                            </br>
                            <div class="row align-items-stretch mb-5">
                                <div class="col-md-2">
                                    <a href="ListaHorarios"><button type="button" class="btn btn-secondary ">Regresar</button></a>
                                </div>
                                <div class="col-md-2">
                                    <button type="submit" class="btn btn-primary " data-bs-toggle="modal" data-bs-target="#exampleModal">
                                        Agregar
                                    </button>
                                </div>
                            </div>
                        </form>
                        </br>
                        <h2 class="section-heading text-uppercase">Lista de Mantenimiento en el horario</h2>
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th scope="col">Nombre</th>
                                    <th scope="col">Apellido</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%for(Mantenimiento listaMantenimiento1: listaMantenimientoidH){%>
                                <tr>
                                    <td><%=listaMantenimiento1.getNombre()%></td>
                                    <td><%=listaMantenimiento1.getApellido()%></td>
                                </tr>
                                <%}%>
                            </tbody>
                        </table>
                    </div>
                    <%int max=0;
                    for(Mantenimiento listaMantenimiento1 : listaMantenimiento){
                        if(listaMantenimiento1.getIdMantenimiento()>max){
                            max=listaMantenimiento1.getIdMantenimiento();
                        }
                    }%>
                    <div class="col-md-4">
                        <form method="POST" action="<%=request.getContextPath()%>/ListaHorarios?a=crearmant&id=<%=idHorario.getIdHorario()%>">
                            </br>
                            <div class="form-group">
                                <input type="hidden" name="idMant" id="idMant" value="<%=max+1%>" />
                            </div>
                            <div class="form-group">
                                <label for="Nombre" class="form-label">Nombre *</label>
                                <input class="form-control" placeholder="Ingrese el nombre" type="text" name="Nombre" id="Nombre" required>
                            </div>
                            <div class="form-group">
                                <label for="Apellido" class="form-label">Apellido *</label>
                                <input class="form-control" placeholder="Ingrese el apellido" type="text" name="Apellido" id="Apellido" required>
                            </div>
                            </br>
                            <div class="row align-items-stretch mb-5">
                                <div class="col-md-2">
                                    <button type="submit" class="btn btn-primary " data-bs-toggle="modal" data-bs-target="#exampleModal">
                                        Crear
                                    </button>
                                </div>
                            </div>
                        </form>
                        <%if (session.getAttribute("existe1").equals("error1")){%>
                        <div class="text-danger nb-3">
                            Ya existe el personal puesto.
                        </div>
                        <%session.removeAttribute("existe1");%>
                        <%}%>
                        <%if (session.getAttribute("error2").equals("error2")){%>
                        <div class="text-danger nb-3">
                            Dato inválido.
                        </div>
                        <%session.removeAttribute("error2");%>
                        <%}%>
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
