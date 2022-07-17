<%@ page import="com.example.culturalbox.Beans.Actores" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="listaActores" scope="request" type="java.util.ArrayList<com.example.culturalbox.Beans.Actores>" />
<%int contador=0;%>
<jsp:useBean id="usuarioSesion" scope="session" type="com.example.culturalbox.Beans.Usuario" class="com.example.culturalbox.Beans.Usuario"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Actores - Cultura Box</title>
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
        <a class="navbar-brand" href="<%=request.getContextPath()%>/AdminIndexServlet" ><img src="assets/img/pucp.png" alt="..." style="height: 65px;width: 170px;border-radius: 3px;"/></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            Menu
            <i class="fas fa-bars ms-1"></i>
        </button>
        <div class="collapse navbar-collapse " id="navbarResponsive">
            <ul class="navbar-nav ms-auto py-4 py-lg-0">
                <div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
                    <ul class="navbar-nav">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <%=usuarioSesion.getCorreo()%>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDarkDropdownMenuLink">
                                <li><a class="dropdown-item" href="Directores">Directores</a></li>
                                <li><a class="dropdown-item" href="Sedes">Sedes</a></li>
                                <li><a class="dropdown-item" href="Clientes">Clientes</a></li>
                                <li><a class="dropdown-item" href="operadores">Operadores</a></li>
                                <li><a class="dropdown-item" href="<%=request.getContextPath()%>/LoginServlet?finish=yes">Cerrar Sesion</a></li>
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
            <br>
            <h2 class="section-heading text-uppercase">ACTORES</h2>
            </br>
        </div>
    </div>

    <!--Actores-->
    <form method="POST" action="<%=request.getContextPath()%>/Actores?a=borrar">
    <div>
        <% int i = 0;
           int x=1;
            for ( Actores actor : listaActores) {
                if (i == 0){
                    i = 1; %>
        <!--Columna 1-->
        <div class="container">
            <div class="row justify-content-evenly">
                <div class="col-5">
                    <div class="card mb-3" style="max-width: 540px;">
                        <div class="row g-0">
                            <div class="col-md-4">
                                <img class="img-fluid1" src="<%=request.getContextPath()%>/ImgEstadServlet?a=Actores&id=<%=actor.getId()%>" style="width:150px; height:200px" class="img-fluid rounded-start" alt="..." />
                            </div>
                            <div class="col-md-8">
                                <div class="card-body">
                                    <input class="form-check-input position-absolute end-0 top-0 border m-2"   type="checkbox" name="actor<%=x%>" value="<%=actor.getId()%>" aria-label="..." style="width:30px; height:30px ">
                                    <h6 class="card-title"><%=actor.getNombre() %></h6>
                                    <p class="card-text">Obras actuales:
                                        <br/>
                                        <%for(String obra : actor.getObras()){%>
                                        <%if(obra!=null){%>
                                        <%=obra%>
                                        <%}%>
                                        <br/>
                                        <%}%>
                                        <%if(actor.getObras().size()<2){%>
                                        <br/>
                                        <%}%>

                                        <small class="text-muted" >calificacion por usuarios:</small>
                                        <br/>
                                        <% contador=0;
                                        for (int a = 1;a <= actor.getPuntaje();a++){%>
                                            <img src="assets/img/star-fill.svg"  style="width:20px; height:20px" />
                                            <%contador++;%>
                                        <%}%>
                                        <%for(int b=0;contador<5;contador++ ){%>
                                            <img src="assets/img/star.svg"  style="width:20px; height:20px" />
                                        <%}%>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%x++;}else if (i == 1){%>
                <% i = 0; %>
                <div class="col-5">
                    <div class="card mb-3" style="max-width: 540px;">
                        <div class="row g-0">
                            <div class="col-md-4">
                                <img class="img-fluid1" src="<%=request.getContextPath()%>/ImgEstadServlet?a=Actores&id=<%=actor.getId()%>" style="width:150px; height:200px" class="img-fluid rounded-start" alt="..." />
                            </div>
                            <div class="col-md-8">
                                <div class="card-body">
                                    <input class="form-check-input position-absolute end-0 top-0 border m-2"   type="checkbox"  name="actor<%=x%>" value="<%=actor.getId()%>" aria-label="..." style="width:30px; height:30px ">
                                    <h6 class="card-title"><%=actor.getNombre() %></h6>
                                    <p class="card-text"> Obras actuales:
                                        <br/>
                                        <%for(String obra : actor.getObras()){%>
                                        <%if(obra!=null){%>
                                        <%=obra%>
                                        <%}%>
                                        <br/>
                                        <%}%>
                                        <%if(actor.getObras().size()<2){%>
                                        <br/>
                                        <%}%>

                                        <small class="text-muted" >calificacion por usuarios:</small>
                                        <br/>
                                        <% contador=0;
                                            for (int a = 1;a <= actor.getPuntaje();a++){%>
                                        <img src="assets/img/star-fill.svg"  style="width:20px; height:20px" />
                                        <%contador++;%>
                                        <%}%>
                                        <%for(int b=0;contador<5;contador++ ){%>
                                        <img src="assets/img/star.svg"  style="width:20px; height:20px" />
                                        <%}%>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%x++;}
         }%>
            <input type="hidden" name="cantActores" value="<%=listaActores.size()%>" />


    <!--Botones-->
    <div class="text-center">
        </br>
        </br>
        <!-- Button trigger modal -->
        <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">
            Eliminar
        </button>
        <a href="AgregarActor.jsp"><button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">Agregar</button></a>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Advertencia</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Está seguro que desea eliminar a los actores seleccionados
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                    <button type="submit" class="btn btn-primary">Eliminar</button>
                </div>
            </div>
        </div>
    </div>
    </form>

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


</body>


</html>
