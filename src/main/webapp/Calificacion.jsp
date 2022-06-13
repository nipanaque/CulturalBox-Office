<%@ page import="com.example.culturalbox.Beans.Calificacion" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="listaCalificacion" scope="request" type="java.util.ArrayList<com.example.culturalbox.Beans.Calificacion>" />
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">

        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Calificación</title>

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
                                    <a href="historialdeFunciones.html"><button class="btn btn-dark btn-sm" type="submit">Regresar</button></a>
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
                    <h2 class="section-heading text-uppercase"><%=listaCalificacion.get(1).getNombreFuncion()%></h2>
                    <h3 class="section-subheading text-muted"></h3>
                </div>

                <div class="row align-items-stretch mb-5">
                    <div class="col order-1">
                        <img src="assets/img/portfolio/funcion1.jpg" style="width: 400px"  class="rounded float-start" alt="...">
                    </div>
                    <div class="col order-2">
                        <div class="row">
                            <h3>Calificación: </h3>
                        </div>
                        <div class="row" style="margin-top: 8px;">
                            <h6>Director: <%=listaCalificacion.get(0).getNombreDirector()%></h6>
                        </div>

                        <div class="row"style="margin-top: 18px;">
                            <h6>Actores: </h6>
                        </div>
                        <% int i = 1;
                            for (Calificacion calificacion : listaCalificacion) { %>
                        <div class="row"style="margin-top: 18px;">
                            <h6>- <%= calificacion.getNombreActor()%> </h6>
                        </div>
                        <% i++;}%>

                    </div>
                    <div class="col order-3">
                        <div class="row">
                            <h4>Número de estrellas: </h4>
                        </div>
                        <div style="text-align: center">
                            <div class="fa fa-star" onclick="calificar(this)" style="cursor: pointer;" id="1estrelladirector"></div>
                            <div class="fa fa-star" onclick="calificar(this)" style="cursor: pointer;" id="2estrelladirector"></div>
                            <div class="fa fa-star" onclick="calificar(this)" style="cursor: pointer;" id="3estrelladirector"></div>
                            <div class="fa fa-star" onclick="calificar(this)" style="cursor: pointer;" id="4estrelladirector"></div>
                            <div class="fa fa-star" onclick="calificar(this)" style="cursor: pointer;" id="5estrelladirector"></div>
                        </div>
                        <br><br><br>
                        <%  i = 1;
                            for (Calificacion calificacion : listaCalificacion) { %>
                        <div style="text-align: center">
                            <div class="fa fa-star" onclick="calificar(this)" style="cursor: pointer;" id="1estrellaActor1"></div>
                            <div class="fa fa-star" onclick="calificar(this)" style="cursor: pointer;" id="2estrellaActor1"></div>
                            <div class="fa fa-star" onclick="calificar(this)" style="cursor: pointer;" id="3estrellaActor1"></div>
                            <div class="fa fa-star" onclick="calificar(this)" style="cursor: pointer;" id="4estrellaActor1"></div>
                            <div class="fa fa-star" onclick="calificar(this)" style="cursor: pointer;" id="5estrellaActor1"></div>
                        </div>
                        <br>
                        <% i++;}%>
                    </div>
                </div>
                <div style="text-align: center">
                    <h1>Número de estrellas para la función:</h1>
                    <div class="fa fa-star" onclick="calificar(this)" style="cursor: pointer; font-size: 3rem;" id="1estrella"></div>
                    <div class="fa fa-star" onclick="calificar(this)" style="cursor: pointer; font-size: 3rem;" id="2estrella"></div>
                    <div class="fa fa-star" onclick="calificar(this)" style="cursor: pointer; font-size: 3rem;" id="3estrella"></div>
                    <div class="fa fa-star" onclick="calificar(this)" style="cursor: pointer; font-size: 3rem;" id="4estrella"></div>
                    <div class="fa fa-star" onclick="calificar(this)" style="cursor: pointer; font-size: 3rem;" id="5estrella"></div>
                </div>
                <br><br>
                <div style="text-align: center">
                    <a href="historialdeFunciones.html"><button class="btn btn-lg btn-dark" type="submit">Guardar</button></a>
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
        var contador;
        function calificar(item){
            console.log(item);
            contador=item.id[0]
            let nombre = item.id.substring(1);
            for (let i=0;i<5;i++){
                if (i<contador){
                    document.getElementById((i+1)+nombre).style.color="orange"
                }else{
                    document.getElementById((i+1)+nombre).style.color="black"
                }
            }
        }
    </script>
</html>