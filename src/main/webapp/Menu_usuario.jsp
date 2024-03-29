<%@ page import="com.example.culturalbox.Beans.Menu" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.culturalbox.Beans.Compra" %>
<%@ page import="com.example.culturalbox.Beans.Horarios" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ArrayList<Menu> listaMenu =  (ArrayList<Menu>) request.getAttribute("listaMenu");
    ArrayList<ArrayList<Horarios>> listaListasHorarios = (ArrayList<ArrayList<Horarios>>) request.getAttribute("listaListasHorarios");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>MENU PRINCIPAL</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:500,700" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="css/styles.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</head>
<body id="page-top">
<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
    <div class="container">
        <a class="navbar-brand" href="#page-top" ><img src="assets/img/pucp.png" alt="..." style="height: 65px;width: 170px;border-radius: 3px;"/></a>

        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0" style="margin-right: -80px;">
                <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/LoginServlet">Iniciar Sesion</a></li>
                <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/RegistroUsuarioServlet">Registrate</a></li>
                <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/LoginServlet">
                    <img src="assets/img/carrito.png" style="width: 90px"  class="rounded float-start" alt="...">
                </a></li>
            </ul>
        </div>
    </div>
</nav>
<!-- Masthead-->
    <header class="masthead">
        <div class="container" style="margin-top:-50px">
            <div class="masthead-heading text-uppercase">Cultural Box Office PUCP</div>
            <div class="masthead-subheading">Cultural Box-Office es una plataforma donde podrás comprar de manera fácil y rápida tus tickets de tus funciones favoritas.</div>
            <a class="btn btn btn-warning btn-primary btn-lg text-uppercase" style="background-color: #f8d83a;color: #002362;font-style: italic;" href="#portfolio" ><strong>Ver Funciones</strong></a>
        </div>
    </header>

    <!-- Portfolio Grid-->
    <section class="page-section bg-light" id="portfolio">
        <div class="container">
            <div class="text-center">
                <h2 class="section-heading text-uppercase" href="<%=request.getContextPath()%>/MenuServlet" href = "#funciones">FUNCIONES</h2>
                <h3 class="section-subheading text-muted">Los espectáculos más esperados</h3>
            </div>
            <div class="row">


                <% int i = 1;
                    for (Menu menu : listaMenu) { %>
                <div class="col-lg-4 col-sm-6 mb-4">
                    <!-- Funcion 1-->
                    <div class="portfolio-item">
                        <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal<%=i%>">
                            <div class="portfolio-hover">
                                <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
                            </div>
                            <img class="img-fluid1" src="<%=request.getContextPath()%>/ImgEstadServlet?a=Funciones&id=<%=menu.getIdFuncion()%>" style="width:356px; height:420px" alt="..." />
                        </a>
                        <div class="portfolio-caption">
                            <div class="portfolio-caption-heading"><%=menu.getNombre_funcion()%></div>

                            <div></div>
                            <div data-bs-toggle="modal" href="#Modal<%=i%>" style ="margin-top:5%;">
                                <button href="<%=request.getContextPath()%>/MenuServlet?a=verHorarios&nombre=<%=menu.getNombre_funcion()%>"
                                        type="button" class="btn btn-danger">Añadir al carrito</button>
                            </div>
                        </div>
                    </div>
                </div>
                <% i++;
                } %>


            </div>
        </div>

    </section>

    <!-- Footer-->
    <footer class="footer py-4">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-4 text-lg-start">Copyright &copy; Cultural Box-Office 2022</div>
                <div class="col-lg-4 my-3 my-lg-0">
                    <a class="btn btn-dark btn-social mx-2" href="https://twitter.com/CCULTURALPUCP" aria-label="Twitter"><i class="fab fa-twitter"></i></a>
                    <a class="btn btn-dark btn-social mx-2" href="https://facebook.com/ccpucp/" aria-label="Facebook"><i class="fab fa-facebook-f"></i></a>
                    <a class="btn btn-dark btn-social mx-2" href="https://www.instagram.com/ccpucp/" aria-label="Instagram"><i class="fab fa-instagram"></i></a>
                </div>
                <div class="col-lg-4 text-lg-end">
                    <a class="link-dark text-decoration-none">Av. Camino Real 1075, San Isidro 15073</a>
                </div>
            </div>
        </div>
    </footer>

    <!-- Portfolio Modals-->

    <!-- Portfolio item 1 modal popup-->
    <% int j = 1;
        for (ArrayList<Horarios> listaHorarios:listaListasHorarios) { %>
    <center><div class="portfolio-modal modal fade" id="Modal<%=j%>" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog" style="width: 60%">
            <div class="modal-content" >
                <div class="close-modal" data-bs-dismiss="modal"><img src="assets/img/close-icon.svg" style="width:20px; height:20px" alt="Close modal" /></div>
                <div class="container" >
                    <div class="row justify-content-center" >
                        <div class="col-lg-8" style="padding: 0;">
                            <div class="modal-body" style="padding: 0;">
                                <!-- Project details-->
                                <h2 class="text-uppercase" style="font-size: 28px;">Seleccionar Horario</h2>
                                <ul class="list-inline" style="margin-left:auto;">
                                    <% int r = 1;
                                        for (Horarios horarios : listaHorarios) { if(horarios.getStock() > 0){%>
                                    <li style="margin-top:4%;" >
                                        <a class="btn btn-outline-dark" href="<%=request.getContextPath()%>/LoginServlet">
                                            <strong>Dia: </strong> <%=horarios.getDia()%>
                                            <strong>Hora: </strong><%=horarios.getT_init()%> |
                                            <%=horarios.getDuracion()%> min
                                        </a>
                                        <h7 style="font-size:15px"><strong> <%=horarios.getNombre_sede()%> </strong></h7>
                                        <h7 style="font-size:15px"><strong> (stock: <%=horarios.getStock()%>)</strong></h7>
                                        <h7 style="font-size:15px"><strong>---- S/.<%=horarios.getCosto()%></strong></h7>
                                    </li>
                                    <%} r++;
                                    } %>
                                </ul>

                                <button class="btn btn-warning btn-xl text-uppercase" data-bs-dismiss="modal" type="button">
                                    <i class="fas fa-xmark me-1"></i>
                                    Regresar
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div></center>
    <% j++;
    } %>


    <% int s = 1;
        for (Menu menu : listaMenu) { %>
    <center><div class="portfolio-modal modal fade" id="portfolioModal<%=s%>" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog" style="width: 40%">
            <div class="modal-content">
                <div class="close-modal" data-bs-dismiss="modal"><img src="assets/img/close-icon.svg" style="width:20px; height:20px" alt="Close modal" /></div>
                <div class="container" >
                    <div class="row justify-content-center" >
                        <div class="col-lg-8" style="padding: 0;">
                            <div class="modal-body" style="padding: 0;">
                                <!-- Project details-->
                                <h2 class="text-uppercase" style="font-size: 28px;"><%=menu.getNombre_funcion()%></h2>
                                <p class="item-intro text-muted"><%=menu.getDirector()%></p>
                                <img class="img-fluid d-block mx-auto" src="assets/img/sinopsis.png" style="width:150px; height:50px" alt="..." />
                                <p style="color: black;font-size:14px;"><%=menu.getDescripcion()%></p>
                                <ul class="list-inline">

                                    <li>
                                        <strong>Categoría:</strong>
                                        <%=menu.getGenero()%>
                                    </li>
                                    <li>
                                        <strong>Restricción de edad:</strong>
                                        <%=menu.getRestriccion()%>
                                    </li >

                                </ul>
                                <button class="btn btn-warning btn-xl text-uppercase" data-bs-dismiss="modal" type="button">
                                    <i class="fas fa-xmark me-1"></i>
                                    Regresar
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div></center>
    <% s++;
    } %>


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