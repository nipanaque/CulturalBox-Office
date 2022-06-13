<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Buscar Actor/Director</title>

        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:500,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <style>
            .div-3 {
                background-color: #58d0ca;
            }
            .div-4 {
                background-color: #abec4b;
            }
        </style>
    </head>
    <body id="page-top">
        <!-- Navigation-->
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
        <hr/>
        <!-- Portfolio Grid-->
        <section class="page-section bg-light" id="portfolio">
            <div class="container">
                    <h2 class="section-heading text-uppercase">Buscar: Actores / Directores</h2>
                    <h3 class="section-subheading text-muted">Seleccionar a partir de las siguientes listas y buscar</h3>
                <!-- Page Features-->
                <div class="row gx-lg-5">
                    <div class="col-lg-6 col-xxl-4 mb-5">
                        <div class="card bg-light border-0 h-100">
                            <div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
                                <h2 class="div-3">Actor</h2>
                                <select class="form-select" id="validationCustom04" required>
                                    <option>Seleccionar actor</option>
                                    <option>Andress Wiesse Zuasnabar</option>
                                    <option>Pedro Suarez Vertiz</option>
                                    <option>Juan Vertiz Soliz</option>
                                    <option>Salomon Castillo Grith</option>
                                    <option>Soho Minho Masuchita Kito</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-xxl-4 mb-5">
                        <div class="card bg-light border-0 h-100">
                            <div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
                                <h1 class="div-3"></h1>
                                <div class="col-md-3">
                                    <div class="text-center">
                                        <a href="estad_actor.html"><button class="btn btn-success btn-xl" type="submit">Buscar_Actor</button></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-xxl-4 mb-5">
                        <div class="card bg-light border-0 h-100">
                            <div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
                                <h2 class="div-3">Director</h2>
                                <select class="form-select" id="validationCustom04" required>
                                    <option>Seleccionar director</option>
                                    <option>Goerge Lucas Fontonasi</option>
                                    <option>Julio Ramo Ribeyro</option>
                                    <option>Son Goku Dakota Blert</option>
                                    <option>Elon George Musk Zino</option>
                                    <option>Bill Jimmy Gates Newtron</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-xxl-4 mb-5">
                        <div class="card bg-light border-0 h-100">
                            <div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
                                <h1 class="div-3"></h1>
                                <div class="col-md-3">
                                    <div class="text-center">
                                        <a href="estad_director.html"><button class="btn btn-success btn-xl" type="submit">Buscar_Director</button></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Return button-->
                    <div class="row align-items-stretch mb-5">
                        <div class="col-md-3">
                        </div>
                        <div class="col-md-3">
                        </div>
                        <div class="col-md-3">
                        </div>
                        <div class="col-md-3">
                            <a href="estadisticasgeneral.html"><button class="btn btn-primary btn-xl" type="submit">Regresar</button></a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>

