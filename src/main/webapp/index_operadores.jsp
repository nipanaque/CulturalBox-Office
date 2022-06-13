<%@ page import="com.example.culturalbox.Beans.Horarios" %>
<%@ page import="java.util.Objects" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean type="java.util.ArrayList<com.example.culturalbox.Beans.Horarios>" scope="request" id="listaHorarios"/>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Cultural Box-Office</title>
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
    <!-- Navigation-->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
      <div class="container">
        <a class="navbar-brand" href="index_operadores.html"><img src="assets/img/pucp_logo1.jpeg" alt="..." /></a>

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
                    <li><a class="dropdown-item" href="<%=request.getContextPath()%>/EstadisticaServlet">Estadisticas</a></li>
                    <li><a class="dropdown-item" href="salas.html">Salas</a></li>
                    <li><a class="dropdown-item" href="#">Cerrar Sesión</a></li>
                  </ul>
                </li>
              </ul>
            </div>
          </ul>
        </div>
      </div>

      </div>
    </nav>


    <!-- Masthead-->
    <header class="masthead">
      <div class="container">
        <div class="masthead-heading text-uppercase">Cultural Box Office PUCP</div>
        <div class="col-md-6">
          <div class="masthead-subheading">Bienvenido a la pantalla del operador.</div>
        </div>
        <div class="text-center"><a href="ListaFunciones"><button class="btn btn-primary btn-xl" type="submit">Lista de funciones</button></a></div>
        </br>
        <div class="text-center"><a href="ListaHorarios"><button class="btn btn-primary btn-xl" type="submit">Lista de horarios</button></a></div>
      </div>
    </header>

    <!-- Portfolio Grid-->
    <section class="page-section bg-light" id="portfolio">
      <div class="container">
        <div class="text-center">
          <h2 class="section-heading text-uppercase" href = "#funciones">FUNCIONES Y HORARIOS</h2>
        </div>
        </br>
        <div class="row">
          <%for(Horarios listahorarios: listaHorarios){%>
          <div class="col-lg-4 col-sm-6 mb-4">
            <!-- Funcion 1-->
            <div class="portfolio-item">
              <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal1">
                <div class="portfolio-hover">
                  <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
                </div>
                <img class="img-fluid" src="assets/img/portfolio/funcion2.jpg" alt="..." />
              </a>
              <div class="portfolio-caption">
                <div class="portfolio-caption-heading"><%=listahorarios.getNombre_funcion()%></div>
                <button type="button" class="btn btn-light">Sede: <%=listahorarios.getNombre_sede()%></button>
                <button type="button" class="btn btn-light">Stock: <%=listahorarios.getStock()%></button>
                <div></div>
                </br>
                <a href="<%=request.getContextPath()%>/IndexOpServlet?a=editar&id=<%=listahorarios.getIdHorario()%>"><button
                        type="button" class="btn btn-danger">Editar</button> </a>
              </div>
            </div>
          </div>
          <%}%>
        </div>
      </div>
    </section>

    <!-- Portfolio Modals-->
    <!-- Portfolio item 1 modal popup-->
    <%for(Horarios listahorarios: listaHorarios){%>
    <div class="portfolio-modal modal fade" id="<portfolioModal1>" tabindex="-1" role="dialog" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="close-modal" data-bs-dismiss="modal"><img src="assets/img/close-icon.svg" alt="Close modal" /></div>
          <div class="container">
            <div class="row justify-content-center">
              <div class="col-lg-8">
                <div class="modal-body">
                  <!-- Project details-->
                  <h2 class="text-uppercase"><%=listahorarios.getNombre_funcion()%></h2>
                  <p><%=listahorarios.getDescripcion_funcion()%></p>
                  <ul class="list-inline">
                    <li>
                      <strong>Día</strong>
                      <%=listahorarios.getDia()%>
                    </li>
                    </br>
                    <li>
                      <strong>Categoría:</strong>
                      <%=listahorarios.getGenero_funcion()%>>
                    </li>
                  </ul>
                  </br>
                  <button class="btn btn-primary" data-bs-dismiss="modal" type="button">
                    <i class="fas fa-xmark me-1"></i>
                    Cerrar
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <%}%>
    <!-- Portfolio item 2 modal popup-->
    <!-- Portfolio item 3 modal popup-->
    <!-- Portfolio item 4 modal popup-->
    <!-- Portfolio item 5 modal popup-->
    <!-- Portfolio item 6 modal popup-->
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

