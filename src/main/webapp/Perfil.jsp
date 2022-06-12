<%@ page import="com.example.culturalbox.Beans.Perfil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="listaPerfil" scope="request" type="java.util.ArrayList<com.example.culturalbox.Beans.Perfil>" />
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Perfil</title>
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
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top bg-dark" id="mainNav">
            <div class="container">
                <a class="navbar-brand" href="usuario_logeado.html"><img src="assets/img/pucp_logo.jpeg" alt="..." style="height: 40px;width: 120px;"/></a>

                <div class="collapse navbar-collapse " id="navbarResponsive">
                    <ul class="navbar-nav ms-auto py-4 py-lg-0">
                        <div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
                            <ul class="navbar-nav">
                                <li class="nav-item dropdown">
                                    <a href="usuario_logeado.html"><button class="btn btn-dark btn-sm" type="submit">Volver al menu</button></a>
                                </li>
                            </ul>
                        </div>
                    </ul>
                </div>

            </div>
        </nav>
        <section class="page-section bg-light" id="portfolio">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">Mi perfil</h2>
                    <h3 class="section-subheading text-muted"></h3>
                </div>
                <img src="assets/objeto.jfif" style="width: 100px" class="rounded float-end" alt="...">
                <div class="cuadrado">
                    <img src="assets/img/logo.png" style="width: 100px"  class="rounded float-start" alt="...">

                    <div class="btn">
                        <a  href="javascript:explorar();" >
                            <div style="position: relative; left: -55px; top: 70px;">
                                <img src="assets/img/camara.png" style="width: 40px"  class="rounded float-start" alt="..." title="subir imagen">
                                <input type="file" name="f_subir" id="f_subir" style="display: none;">
                            </div>
                    </div>
                </div>
                </a>
                <br>
                <br>
                <br>
                <br>
                <br>
                <div class="row align-items-stretch mb-5">
                    <div class="col-md-6">
                        <p class="mb-0"> DNI</p>
                        <!-- <h6 style="color: red;">Nombre de la función</h6>-->
                        <div class="form-group">
                            <!-- Name input-->
                            <input class="form-control" id="nombre_funcion" type="text" value="<%=listaPerfil.get(1).getDni()%>"  disabled>

                            <div class="invalid-feedback" data-sb-feedback="nombre_funcion:required">Un nombre es requerido.</div>
                        </div>
                        </br>
                        <p class="mb-0"> Código PUCP</p>
                        <div class="form-group">
                            <input class="form-control" type="text" value="<%=listaPerfil.get(1).getCodigo_pucp()%>" disabled >
                        </div>
                        </br>
                        <p class="mb-0"> Correo</p>
                        <div class="form-group">
                            <input class="form-control" type="email" value="<%=listaPerfil.get(1).getCorreo_pucp()%>" data-sb-validations="required,email" data-sb-can-submit="no" disabled>
                        </div>
                        </br>
                    </div>
                    <div class="col-md-6">
                        <p class="mb-0">Fecha de nacimiento</p>
                        <div class="form-group">
                            <label for="inputPassword2" class="visually-hidden">Password</label>
                            <input type="date" class="form-control" id="inputPassword2" placeholder="Ingrese fecha">
                        </div>

                        </br>
                        <p class="mb-0">Dirección</p>
                        <div class="form-group">
                            <input class="form-control" type="text" placeholder="Ingrese dirección" >
                        </div>
                        <br>
                        <p class="mb-0">Número de teléfono</p>
                        <div class="form-group">
                            <input class="form-control" type="tel" placeholder="Ingrese numero de teléfono" >
                        </div>
                    </div>
                </div>


                <div style="text-align: center">
                    <a href="#"><button class="btn btn-dark" type="submit">Actualizar mis datos</button></a>
                </div>

            </div>
        </section>


        <footer class="footer py-4">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-4 text-lg-start">Copyright &copy; Cultural Box-Office 2022</div>
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <!-- * *                               SB Forms JS                               * *-->
        <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    </body>
    <script>
        function explorar(){
            document.getElementById("f_subir").click()

        }
    </script>
</html>
