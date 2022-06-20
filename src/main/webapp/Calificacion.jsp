<%@ page import="com.example.culturalbox.Beans.Calificacion" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="listaCalificacion" scope="request" type="java.util.ArrayList<com.example.culturalbox.Beans.Calificacion>" />
<jsp:useBean id="inicio" scope="request" type="java.lang.String" class="java.lang.String" />
<jsp:useBean id="cambio" scope="request" type="java.lang.String" class="java.lang.String" />
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">

        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Calificación</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
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
            <div   class="container">
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
                            <h6>- <%= calificacion.getNombreActor()%></h6>
                            <% if(i==2){%>
                            <br><br>
                            <%}%>
                        </div>
                        <% i++;}%>
                        <br><br><br><br><br>
                        <div class="row">
                            <h3>Número de estrellas de la función: </h3>
                        </div>

                    </div>
                    <div class="col order-3">
                        <div class="row">
                            <h4>Número de estrellas: </h4>
                        </div>
                        <form method="POST" action="<%=request.getContextPath()%>/CalificacionServlet?a=guardar&f=<%=listaCalificacion.get(0).getPuntajeFuncion()%>&d=<%=listaCalificacion.get(0).getPuntajeDirector()%>&a1=<%=listaCalificacion.get(0).getPuntajeActor()%>&a2=<%=listaCalificacion.get(1).getPuntajeActor()%>&a3=<%=listaCalificacion.get(2).getPuntajeActor()%>">
                            <div class="form-group">

                                <input type="number" class="form-control" name="starsDirector" id="starsDirector" required>
                            </div>
                            <br><br>
                            <%  i = 1;
                                for (Calificacion calificacion : listaCalificacion) {%>
                            <% if(i==1){%>
                            <select class="form-select" name="starsActor1" aria-label="Default select example" required>
                                <option selected disabled value="">Calificar</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>

                            </select>
                            <br>
                            <%}else if(i==2){%>
                            <select class="form-select" name="starsActor2" aria-label="Default select example" required>
                                <option selected disabled value="">Calificar</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>

                            </select>
                            <br>
                            <%}else if(i==3){%>
                            <select class="form-select" name="starsActor3" aria-label="Default select example" required>
                                <option selected disabled value="">Calificar</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>

                            </select>
                            <br>
                            <%}else if(i==4){%>
                            <select class="form-select" name="starsActor4" aria-label="Default select example" required>
                                <option selected disabled value="">Calificar</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>

                            </select>
                            <br>
                            <%}else if(i==5){%>
                            <select class="form-select" name="starsActor5" aria-label="Default select example" required>
                                <option selected disabled value="">Calificar</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>

                            </select>
                            <br>
                            <%} i++;}%>

                            <br><br><br><br><br>
                            <div class="form-group">

                                <input type="number" class="form-control" name="stars" id="stars" required>
                            </div>
                            <br>
                            <a href="<%=request.getContextPath()%>/HistorialServlet" class="btn btn-danger">Regresar</a>
                            <button  type="submit" class="btn btn-primary">Guardar</button>
                        </form>


                    </div>
                    <div class="col order-4">
                        <br><br>
                        <i class="fa-solid fa-star "></i>
                    </div>
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
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js" integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-kjU+l4N0Yf4ZOJErLsIcvOU2qSb74wXpOhqTvwVx3OElZRweTnQ6d31fXEoRD1Jy" crossorigin="anonymous"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <!-- * *                               SB Forms JS                               * *-->
        <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    </body>
    <script>

    </script>
</html>