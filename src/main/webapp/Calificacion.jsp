<%@ page import="com.example.culturalbox.Beans.Calificacion" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="listaCalificacion" scope="request" type="java.util.ArrayList<com.example.culturalbox.Beans.Calificacion>" />
<jsp:useBean id="inicio" scope="request" type="java.lang.String" class="java.lang.String" />
<jsp:useBean id="cambio" scope="request" type="java.lang.String" class="java.lang.String" />
<% String idcompra = (String) request.getAttribute("idcompra"); %>

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
                <a class="navbar-brand" href="<%=request.getContextPath()%>/MenuServlet"><img src="assets/img/pucp.png" alt="..." style="height: 40px;width: 120px;"/></a>

                <div class="collapse navbar-collapse " id="navbarResponsive">
                    <ul class="navbar-nav ms-auto py-4 py-lg-0">
                        <div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
                            <ul class="navbar-nav">
                                <li class="nav-item dropdown">
                                    <a href="<%=request.getContextPath()%>/MenuServlet"><button class="btn btn-dark btn-sm" type="submit">Volver al menú</button></a>
                                </li>
                            </ul>
                        </div>
                    </ul>
                </div>

            </div>
        </nav>
        <section class="page-section bg-light" id="portfolio">
            <div   class="container">
                </br>
                <div class="text-center">
                    <h2 class="section-heading text-uppercase"><%=listaCalificacion.get(1).getNombreFuncion()%></h2>
                    <h3 class="section-subheading text-muted"></h3>
                </div>

                <div class="row align-items-stretch mb-5">
                    <div class="col order-1">
                        <img class="img-fluid1" src="<%=request.getContextPath()%>/ImgEstadServlet?a=Funciones&id=<%=listaCalificacion.get(0).getPuntajeFuncion()%>" style="width:356px; height:490px" alt="..." />
                    </div>

                    <div class="col order-2" >
                    <% int r=0;



                    for (Calificacion calificacion1 : listaCalificacion) {

                                    r++;}%>






                        <% if(r==2){%>
                            <form method="POST" action="<%=request.getContextPath()%>/CalificacionServlet?a=guardar&f=<%=listaCalificacion.get(0).getPuntajeFuncion()%>&d=<%=listaCalificacion.get(0).getPuntajeDirector()%>&a1=<%=listaCalificacion.get(0).getPuntajeActor()%>&a2=<%=listaCalificacion.get(1).getPuntajeActor()%>&idcompra=<%=idcompra%>">
                        <%}else if(r==3){%>
                            <form method="POST" action="<%=request.getContextPath()%>/CalificacionServlet?a=guardar&f=<%=listaCalificacion.get(0).getPuntajeFuncion()%>&d=<%=listaCalificacion.get(0).getPuntajeDirector()%>&a1=<%=listaCalificacion.get(0).getPuntajeActor()%>&a2=<%=listaCalificacion.get(1).getPuntajeActor()%>&a3=<%=listaCalificacion.get(2).getPuntajeActor()%>&idcompra=<%=idcompra%>">
                                    <%}else if(r==7){%>
                                <form method="POST" action="<%=request.getContextPath()%>/CalificacionServlet?a=guardar&f=<%=listaCalificacion.get(0).getPuntajeFuncion()%>&d=<%=listaCalificacion.get(0).getPuntajeDirector()%>&a1=<%=listaCalificacion.get(0).getPuntajeActor()%>&a2=<%=listaCalificacion.get(1).getPuntajeActor()%>&a3=<%=listaCalificacion.get(2).getPuntajeActor()%>&a4=<%=listaCalificacion.get(3).getPuntajeActor()%>&a5=<%=listaCalificacion.get(4).getPuntajeActor()%>&a6=<%=listaCalificacion.get(5).getPuntajeActor()%>&a7=<%=listaCalificacion.get(6).getPuntajeActor()%>&idcompra=<%=idcompra%>">
                                    <%}else if(r==10){%>
                                <form method="POST" action="<%=request.getContextPath()%>/CalificacionServlet?a=guardar&f=<%=listaCalificacion.get(0).getPuntajeFuncion()%>&d=<%=listaCalificacion.get(0).getPuntajeDirector()%>&a1=<%=listaCalificacion.get(0).getPuntajeActor()%>&a2=<%=listaCalificacion.get(1).getPuntajeActor()%>&a3=<%=listaCalificacion.get(2).getPuntajeActor()%>&a4=<%=listaCalificacion.get(3).getPuntajeActor()%>&a5=<%=listaCalificacion.get(4).getPuntajeActor()%>&a6=<%=listaCalificacion.get(5).getPuntajeActor()%>&a7=<%=listaCalificacion.get(6).getPuntajeActor()%>&a8=<%=listaCalificacion.get(7).getPuntajeActor()%>&a9=<%=listaCalificacion.get(8).getPuntajeActor()%>&a10=<%=listaCalificacion.get(9).getPuntajeActor()%>&idcompra=<%=idcompra%>">
                                    <%}%>

                        <table class="table-responsive">
                            <thead>
                                <tr>
                                    <th colspan="2">
                                        <h3>Calificación:</h3>
                                    </th>
                                    <th>
                                        <h3> </h3>
                                    </th>
                                    <th>
                                    <h3># de estrellas </h3>
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td colspan="2" class="align-middle">
                                        <h6>Director: <%=listaCalificacion.get(0).getNombreDirector()%></h6>
                                    </td>
                                    <td class="align-middle">
                                        <h6>          </h6>
                                    </td>

                                    <td class="align-top">
                                        <div class="form-group">

                                            <select class="form-select" name="starsDirector" aria-label="Default select example" required>
                                                <option selected disabled value="">Calificar</option>
                                                <option value="-1">---</option>
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>

                                            </select>
                                        </div>
                                    </td>

                                </tr>
                                <tr>
                                    <td>Actores: </td>
                                </tr>
                                <%  int i = 1;
                                    for (Calificacion calificacion : listaCalificacion) {%>
                                <tr>

                                    <td  colspan="2" class="align-bottom">
                                        <h6>- <%= calificacion.getNombreActor()%></h6>
                                    </td>
                                    <td class="align-middle">
                                        <h6>          </h6>
                                    </td>
                                    <td class="align-top">
                                        <select class="form-select" name="starsActor<%=i%>" aria-label="Default select example" required>
                                            <option selected disabled value="">Calificar</option>
                                            <option value="-1">---</option>
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="4">4</option>
                                            <option value="5">5</option>

                                        </select>
                                    </td>


                                </tr>
                                <tr>
                                    <td>    </td>
                                </tr>
                                <% i++;}%>
                                <tr>
                                    <td colspan="2">
                                        <h3>Número de estrellas de la función: </h3>
                                    </td>
                                    <td class="align-middle">
                                        <h6>          </h6>
                                    </td>

                                    <td class="align-middle">
                                        <select class="form-select" name="stars" aria-label="Default select example" required>
                                            <option selected disabled value="">Calificar</option>
                                            <option value="-1">---</option>
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="4">4</option>
                                            <option value="5">5</option>

                                        </select>
                                    </td>

                                </tr>

                            </tbody>
                        </table>
                        <br>
                                <a href="<%=request.getContextPath()%>/HistorialServlet" class="btn btn-danger">Regresar</a>
                                <button  type="submit" class="btn btn-primary">Guardar</button>
                            </form>
                    </div>
                </div>
            </div>
        </section>


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