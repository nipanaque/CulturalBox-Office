<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

      </div>
    </nav>


    <!-- Masthead-->
    <header class="masthead">
      <div class="container">
        <div class="masthead-heading text-uppercase">Cultural Box Office PUCP</div>
        <div class="col-md-6">
          <div class="masthead-subheading">Bienvenido a la pantalla del operador.</div>
        </div>
        <div class="text-center"><a href="nuevafuncion.html"><button class="btn btn-primary btn-xl" type="submit">Crear funciones</button></a></div>
      </div>
    </header>

    <!-- Portfolio Grid-->
    <section class="page-section bg-light" id="portfolio">
      <div class="container">
        <div class="text-center">
          <h2 class="section-heading text-uppercase" href = "#funciones">FUNCIONES</h2>
          <h3 class="section-subheading text-muted">Funciones registradas</h3>
        </div>
        <div class="row">
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
                <div class="portfolio-caption-heading">EL COMIENZO DEL FIN: Grupo Y</div>
                <button type="button" class="btn btn-light">Stock: 50</button>
                <div></div>
                <a href="editarfuncion.html"><button type="button" class="btn btn-danger" >Editar</button></a>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-sm-6 mb-4">
            <!-- Portfolio item 2-->
            <div class="portfolio-item">
              <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal1">
                <div class="portfolio-hover">
                  <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
                </div>
                <img class="img-fluid" src="assets/img/portfolio/funcion1.jpg" alt="..." />
              </a>
              <div class="portfolio-caption">
                <div class="portfolio-caption-heading">COFFE CONCERT: Andrés Cruz</div>
                <button type="button" class="btn btn-light">Stock: 100</button>
                <div></div>
                <a href="editarfuncion.html"><button type="button" class="btn btn-danger" >Editar</button></a>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-sm-6 mb-4">
            <!-- Funcion 3-->
            <div class="portfolio-item">
              <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal1">
                <div class="portfolio-hover">
                  <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
                </div>
                <img class="img-fluid" src="assets/img/portfolio/funcion3.jpg" alt="..." />
              </a>
              <div class="portfolio-caption">
                <div class="portfolio-caption-heading">TEATRO JOVEN</div>
                </br>
                <button type="button" class="btn btn-light">Stock: 50</button>
                <div></div>
                <a href="editarfuncion.html"><button type="button" class="btn btn-danger" >Editar</button></a>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-sm-6 mb-4">
            <!-- Portfolio item 4-->
            <div class="portfolio-item">
              <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal4">
                <div class="portfolio-hover">
                  <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
                </div>
                <img class="img-fluid" src="assets/img/portfolio/funcion5.jpg" alt="..." />
              </a>
              <div class="portfolio-caption">
                <div class="portfolio-caption-heading">ZEN 20 AÑOS</div>
                <button type="button" class="btn btn-light">Stock: 150</button>
                <div></div>
                <a href="editarfuncion.html"><button type="button" class="btn btn-danger" >Editar</button></a>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-sm-6 mb-4 mb-sm-0">
            <!-- Portfolio item 5-->
            <div class="portfolio-item">
              <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal5">
                <div class="portfolio-hover">
                  <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
                </div>
                <img class="img-fluid" src="assets/img/portfolio/funcion4.jpg" alt="..." />
              </a>
              <div class="portfolio-caption">
                <div class="portfolio-caption-heading">SOUTHWEST</div>
                <button type="button" class="btn btn-light">Stock: 50</button>
                <div></div>
                <a href="editarfuncion.html"><button type="button" class="btn btn-danger" >Editar</button></a>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-sm-6">
            <!-- Portfolio item 6-->
            <div class="portfolio-item">
              <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal6">
                <div class="portfolio-hover">
                  <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
                </div>
                <img class="img-fluid" src="assets/img/portfolio/funcion6.jpg" alt="..." />
              </a>
              <div class="portfolio-caption">
                <div class="portfolio-caption-heading">CORO DE NIÑOS</div>
                <button type="button" class="btn btn-light">Stock: 50</button>
                <div></div>
                <a href="editarfuncion.html"><button type="button" class="btn btn-danger" >Editar</button></a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Footer-->
    <footer class="footer py-4">
      <div class="container">
        <div class="row align-items-center">
          <div class="col-lg-4 text-lg-start">Copyright &copy; Cultural Box-Office 2022</div>
          <div class="col-lg-4 my-3 my-lg-0">
            <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="Twitter"><i class="fab fa-twitter"></i></a>
            <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="Facebook"><i class="fab fa-facebook-f"></i></a>
            <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="LinkedIn"><i class="fab fa-linkedin-in"></i></a>
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
    <div class="portfolio-modal modal fade" id="portfolioModal1" tabindex="-1" role="dialog" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="close-modal" data-bs-dismiss="modal"><img src="assets/img/close-icon.svg" alt="Close modal" /></div>
          <div class="container">
            <div class="row justify-content-center">
              <div class="col-lg-8">
                <div class="modal-body">
                  <!f-->
                  <h2 class="text-uppercase">Project Name</h2>
                  <p class="item-intro text-muted">Lorem ipsum dolor sit amet consectetur.</p>
                  <img class="img-fluid d-block mx-auto" src="assets/img/portfolio/1.jpg" alt="..." />
                  <p>Use this area to describe your project. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est blanditiis dolorem culpa incidunt minus dignissimos deserunt repellat aperiam quasi sunt officia expedita beatae cupiditate, maiores repudiandae, nostrum, reiciendis facere nemo!</p>
                  <ul class="list-inline">
                    <li>
                      <strong>Client:</strong>
                      Threads
                    </li>
                    <li>
                      <strong>Category:</strong>
                      Illustration
                    </li>
                  </ul>
                  <button class="btn btn-primary btn-xl text-uppercase" data-bs-dismiss="modal" type="button">
                    <i class="fas fa-xmark me-1"></i>
                    Close Project
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Portfolio item 2 modal popup-->
    <div class="portfolio-modal modal fade" id="portfolioModal2" tabindex="-1" role="dialog" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="close-modal" data-bs-dismiss="modal"><img src="assets/img/close-icon.svg" alt="Close modal" /></div>
          <div class="container">
            <div class="row justify-content-center">
              <div class="col-lg-8">
                <div class="modal-body">
                  <!-- Project details-->
                  <h2 class="text-uppercase">Project Name</h2>
                  <p class="item-intro text-muted">Lorem ipsum dolor sit amet consectetur.</p>
                  <img class="img-fluid d-block mx-auto" src="assets/img/portfolio/2.jpg" alt="..." />
                  <p>Use this area to describe your project. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est blanditiis dolorem culpa incidunt minus dignissimos deserunt repellat aperiam quasi sunt officia expedita beatae cupiditate, maiores repudiandae, nostrum, reiciendis facere nemo!</p>
                  <ul class="list-inline">
                    <li>
                      <strong>Client:</strong>
                      Explore
                    </li>
                    <li>
                      <strong>Category:</strong>
                      Graphic Design
                    </li>
                  </ul>
                  <button class="btn btn-primary btn-xl text-uppercase" data-bs-dismiss="modal" type="button">
                    <i class="fas fa-xmark me-1"></i>
                    Close Project
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Portfolio item 3 modal popup-->
    <div class="portfolio-modal modal fade" id="portfolioModal3" tabindex="-1" role="dialog" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="close-modal" data-bs-dismiss="modal"><img src="assets/img/close-icon.svg" alt="Close modal" /></div>
          <div class="container">
            <div class="row justify-content-center">
              <div class="col-lg-8">
                <div class="modal-body">
                  <!-- Project details-->
                  <h2 class="text-uppercase">Project Name</h2>
                  <p class="item-intro text-muted">Lorem ipsum dolor sit amet consectetur.</p>
                  <img class="img-fluid d-block mx-auto" src="assets/img/portfolio/3.jpg" alt="..." />
                  <p>Use this area to describe your project. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est blanditiis dolorem culpa incidunt minus dignissimos deserunt repellat aperiam quasi sunt officia expedita beatae cupiditate, maiores repudiandae, nostrum, reiciendis facere nemo!</p>
                  <ul class="list-inline">
                    <li>
                      <strong>Client:</strong>
                      Finish
                    </li>
                    <li>
                      <strong>Category:</strong>
                      Identity
                    </li>
                  </ul>
                  <button class="btn btn-primary btn-xl text-uppercase" data-bs-dismiss="modal" type="button">
                    <i class="fas fa-xmark me-1"></i>
                    Close Project
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Portfolio item 4 modal popup-->
    <div class="portfolio-modal modal fade" id="portfolioModal4" tabindex="-1" role="dialog" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="close-modal" data-bs-dismiss="modal"><img src="assets/img/close-icon.svg" alt="Close modal" /></div>
          <div class="container">
            <div class="row justify-content-center">
              <div class="col-lg-8">
                <div class="modal-body">
                  <!-- Project details-->
                  <h2 class="text-uppercase">Project Name</h2>
                  <p class="item-intro text-muted">Lorem ipsum dolor sit amet consectetur.</p>
                  <img class="img-fluid d-block mx-auto" src="assets/img/portfolio/4.jpg" alt="..." />
                  <p>Use this area to describe your project. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est blanditiis dolorem culpa incidunt minus dignissimos deserunt repellat aperiam quasi sunt officia expedita beatae cupiditate, maiores repudiandae, nostrum, reiciendis facere nemo!</p>
                  <ul class="list-inline">
                    <li>
                      <strong>Client:</strong>
                      Lines
                    </li>
                    <li>
                      <strong>Category:</strong>
                      Branding
                    </li>
                  </ul>
                  <button class="btn btn-primary btn-xl text-uppercase" data-bs-dismiss="modal" type="button">
                    <i class="fas fa-xmark me-1"></i>
                    Close Project
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Portfolio item 5 modal popup-->
    <div class="portfolio-modal modal fade" id="portfolioModal5" tabindex="-1" role="dialog" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="close-modal" data-bs-dismiss="modal"><img src="assets/img/close-icon.svg" alt="Close modal" /></div>
          <div class="container">
            <div class="row justify-content-center">
              <div class="col-lg-8">
                <div class="modal-body">
                  <!-- Project details-->
                  <h2 class="text-uppercase">Project Name</h2>
                  <p class="item-intro text-muted">Lorem ipsum dolor sit amet consectetur.</p>
                  <img class="img-fluid d-block mx-auto" src="assets/img/portfolio/5.jpg" alt="..." />
                  <p>Use this area to describe your project. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est blanditiis dolorem culpa incidunt minus dignissimos deserunt repellat aperiam quasi sunt officia expedita beatae cupiditate, maiores repudiandae, nostrum, reiciendis facere nemo!</p>
                  <ul class="list-inline">
                    <li>
                      <strong>Client:</strong>
                      Southwest
                    </li>
                    <li>
                      <strong>Category:</strong>
                      Website Design
                    </li>
                  </ul>
                  <button class="btn btn-primary btn-xl text-uppercase" data-bs-dismiss="modal" type="button">
                    <i class="fas fa-xmark me-1"></i>
                    Close Project
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Portfolio item 6 modal popup-->
    <div class="portfolio-modal modal fade" id="portfolioModal6" tabindex="-1" role="dialog" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="close-modal" data-bs-dismiss="modal"><img src="assets/img/close-icon.svg" alt="Close modal" /></div>
          <div class="container">
            <div class="row justify-content-center">
              <div class="col-lg-8">
                <div class="modal-body">
                  <!-- Project details-->
                  <h2 class="text-uppercase">Project Name</h2>
                  <p class="item-intro text-muted">Lorem ipsum dolor sit amet consectetur.</p>
                  <img class="img-fluid d-block mx-auto" src="assets/img/portfolio/6.jpg" alt="..." />
                  <p>Use this area to describe your project. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est blanditiis dolorem culpa incidunt minus dignissimos deserunt repellat aperiam quasi sunt officia expedita beatae cupiditate, maiores repudiandae, nostrum, reiciendis facere nemo!</p>
                  <ul class="list-inline">
                    <li>
                      <strong>Client:</strong>
                      Window
                    </li>
                    <li>
                      <strong>Category:</strong>
                      Photography
                    </li>
                  </ul>
                  <button class="btn btn-primary btn-xl text-uppercase" data-bs-dismiss="modal" type="button">
                    <i class="fas fa-xmark me-1"></i>
                    Close Project
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
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

