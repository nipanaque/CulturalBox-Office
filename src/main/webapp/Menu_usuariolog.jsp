<%@ page import="com.example.culturalbox.Beans.Menu" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.culturalbox.Beans.Compra" %>
<%@ page import="com.example.culturalbox.Beans.Horarios" %>
<%--
  Created by IntelliJ IDEA.
  User: victor
  Date: 13/06/2022
  Time: 11:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ArrayList<Menu> listaMenu =  (ArrayList<Menu>) request.getAttribute("listaMenu");
    ArrayList<Horarios> listaHorarios =  (ArrayList<Horarios>) request.getAttribute("listaHorario");

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>MENU USUARIO</title>
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


</head>
<body id="page-top">
<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
    <div class="container">
        <a class="navbar-brand" href="#page-top" ><img src="assets/img/pucp.png" alt="..." style="height: 65px;width: 170px;"/></a>
        <div class="collapse navbar-collapse " id="navbarResponsive">
            <ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
                <div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
                    <ul class="navbar-nav">
                        <li class="nav-item"><a class="nav-link" href="compra.html">
                            <img src="assets/img/carrito.png" style="width: 90px;margin-right:6px;margin-top:8px;"  class="rounded float-start" alt="...">
                            <span class="badge rounded-pill bg-danger"style="margin-left:-6px;">
                                         5
                                         <span class="visually-hidden">unread messages</span>
                                         </span>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" style="margin-right:12px;"href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                DiegoZ@gmail.com
                            </a>
                            <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDarkDropdownMenuLink">
                                <li><a class="dropdown-item" href="miperfil2.html">Perfil</a></li>
                                <li><a class="dropdown-item" href="historialdeFunciones.html">Historial de Funciones</a></li>
                                <li><a class="dropdown-item" href="usuario_menu.html">Cerrar Sesión</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
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
            <h2 class="section-heading text-uppercase" href = "#funciones">FUNCIONES</h2>
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
                        <img class="img-fluid1" src="assets/img/portfolio/funcion2.jpg" alt="..." />
                    </a>
                    <div class="portfolio-caption">
                        <div class="portfolio-caption-heading"><%=menu.getNombre_funcion()%></div>

                        <div></div>
                        <div data-bs-toggle="modal" href="#portfolioModal<%=i%>" style ="margin-top:5%;">
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
    <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-center">
            <li class="page-item disabled">
                <a class="page-link" href="#" tabindex="-1">Previous</a>
            </li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item">
                <a class="page-link" href="#">Next</a>
            </li>
        </ul>
    </nav>
</section>

<!-- Footer-->
<footer class="footer py-4">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-4 text-lg-start">Copyright &copy; 2022 Cultural Box-Office PUCP</div>
            <div class="col-lg-4 my-3 my-lg-0">
                <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="Twitter"><i class="fab fa-twitter"></i></a>
                <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="Facebook"><i class="fab fa-facebook-f"></i></a>
                <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="Instagram"><i class="fab fa-instagram"></i></a>
            </div>
            <div class="col-lg-4 text-lg-end">
                <a class="link-dark text-decoration-none me-3" href="#!">Privacy Policy</a>
                <a class="link-dark text-decoration-none" href="#!">Terms of Use</a>
            </div>
        </div>
    </div>
</footer>
<!-- Portfolio Modals-->

<!-- Portfolio item 1 modal popup-->
<% int j = 1;
    for (Menu menu : listaMenu) { %>
<div class="portfolio-modal modal fade" id="portfolioModal<%=j%>" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="close-modal" data-bs-dismiss="modal"><img src="assets/img/close-icon.svg" alt="Close modal" /></div>
            <div class="container" >
                <div class="row justify-content-center" >
                    <div class="col-lg-8" style="padding: 0;">
                        <div class="modal-body" style="padding: 0;">
                            <!-- Project details-->
                            <h2 class="text-uppercase" style="font-size: 28px;"><%=menu.getNombre_funcion()%></h2>
                            <p class="item-intro text-muted"><%=menu.getDirector()%></p>
                            <img class="img-fluid d-block mx-auto" src="assets/img/laRoca.jpg" alt="..." />
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
</div>


<div class="portfolio-modal modal fade" id="portfolioModal<%=j%>" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" style="height:330px;">
            <div class="close-modal" data-bs-dismiss="modal"><img src="assets/img/close-icon.svg" alt="Close modal" /></div>
            <div class="container" >
                <div class="row justify-content-center" >
                    <div class="col-lg-8" style="padding: 0;">
                        <div class="modal-body" style="padding: 0;">
                            <!-- Project details-->
                            <h2 class="text-uppercase" style="font-size: 28px;">Seleccionar Horario</h2>
                            <ul class="list-inline" style="margin-left:auto;">
                                <% int r = 1;
                                    for (Horarios horarios : listaHorarios) { %>
                                <li style="margin-top:4%;">
                                    <a class="btn btn-outline-dark" href="compra.html">
                                        <strong>Horario <%=j%>: </strong>
                                        <%=horarios.getTiempo_inicio()%>
                                        Duración: <%=horarios.getDuracion()%>
                                    </a>
                                    <h9 style="font-size:10px"><strong> (stock: <%=horarios.getStock()%>)</strong></h9>
                                    <h9 style="font-size:10px"><strong>----- Precio: S/.<%=horarios.getCosto()%></strong></h9>
                                </li>
                                <% r++;
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
</div>
<% j++;
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