<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.culturalbox.Beans.Clientes" %>
<%@ page import="com.example.culturalbox.Beans.Sedes" %>
<%@ page import="com.example.culturalbox.Beans.CrearFuncion" %>
<jsp:useBean id="listaSedes" scope="request" type="java.util.ArrayList<com.example.culturalbox.Beans.Sedes>" />
<jsp:useBean id="listaFunciones" scope="request" type="java.util.ArrayList<com.example.culturalbox.Beans.CrearFuncion>" />
<jsp:useBean id="nombreSede" scope="request" type="java.lang.String"/>
<jsp:useBean id="nombreFuncion" scope="request" type="java.lang.String"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    ArrayList<Clientes> listaClientes =  (ArrayList<Clientes>) request.getAttribute("listaClientes");
%>
<jsp:useBean id="usuarioSesion" scope="session" type="com.example.culturalbox.Beans.Usuario" class="com.example.culturalbox.Beans.Usuario"/>

<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Agency - Start Bootstrap Theme</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="css/styles.css" rel="stylesheet" />
</head>
<body id="page-top">
<!-- Navigation-->
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
                                <li><a class="dropdown-item" href="Actores">Actores</a></li>
                                <li><a class="dropdown-item" href="Directores">Directores</a></li>
                                <li><a class="dropdown-item" href="Sedes">Sedes</a></li>
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
<!-- Portfolio Grid-->
<section class="page-section bg-light" id="portfolio">
    <div class="container">
        <div class="text-center">
            </br>
            <br>
            <h2 class="section-heading text-uppercase">Clientes</h2>
            </br>
        </div>
        <form action="<%=request.getContextPath()%>/Clientes?a=filtrar" method="POST">
        <div class="row  align-items-center">
            <div class="col-md-auto">
                <div class="text-left">
                    <h5>Filtrar por sede:</h5>
                </div>
            </div>
            <div class="col-md-auto">
                <select class="form-select" aria-label="Default select example" name="sede" >

                    <option selected value="0" > --- </option>
                    <%for (Sedes sedes : listaSedes){%>
                    <option value="<%=sedes.getId()%>"><%=sedes.getNombre()%> </option>
                    <%}%>
                </select>
            </div>
            <div class="col-md-auto">
                <div class="text-left">
                    <h5>Funcion:</h5>
                </div>
            </div>
            <div class="col-md-auto">
                <select class="form-select" aria-label="Default select example" name="funcion" id="funcion">
                    <option selected value="0" >----</option>
                    <%for (CrearFuncion funcion : listaFunciones){%>
                    <option value="<%=funcion.getIdFuncion()%>"><%=funcion.getNombre()%></option>
                    <%}%>
                </select>
            </div>
                <button type="submit" class="btn btn-warning col-md-auto">Filtrar</button>
            </div>
        </div>
        <%if(nombreSede.equals("null")){%>
            <%if(nombreFuncion.equals("null")){%>
                <div style="margin-left: 2%;">
                    <h6>Mostrando todos los clientes</h6>
                </div>
            <%}else{%>
                <div>
                    <h6>Mostrando clientes por funcion (<%=nombreFuncion%>)</h6>
                </div>
            <%}%>
        <%}else if(nombreFuncion.equals("null")){%>
                <div>
                    <h6>Mostrando clientes por sede (<%=nombreSede%>)</h6>
                </div>
        <%}else{%>
                <div>
                    <h6>Mostrando clientes por sede y funcion (<%=nombreSede%> || <%=nombreFuncion%>)</h6>
                </div>
        <%}%>
        </form>
        </br>
        <div class="row">
            <%for(Clientes clientes: listaClientes){%>
            <div class="col-lg-4 col-sm-6 mb-4">
                <!-- Portfolio item 1-->
                <div class="card flex-md-row mb-4 box-shadow h-md-250">
                    <img class="img-fluid1" src="<%=request.getContextPath()%>/ImgEstadServlet?a=Usuarios&id=<%=clientes.getId()%>" style="width:150px; height:200px" class="img-fluid rounded-start" alt="..." />
                    <div class="card-body d-flex flex-column align-items-start">
                        <h6><a><%=clientes.getNombre()%></a></h6>
                    </div>
                </div>
            </div>
            <%}%>
        </div>
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



</body>
</html>