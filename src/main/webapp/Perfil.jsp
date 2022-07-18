<%@ page import="com.example.culturalbox.Beans.Perfil" %>
<%@ page import="com.example.culturalbox.Servlets.PerfilServlet" %>
<%@ page import="java.util.Objects" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="listaPerfil" scope="request" type="java.util.ArrayList<com.example.culturalbox.Beans.Perfil>" />
<jsp:useBean id="invalid1" scope="session" type="java.lang.String" class="java.lang.String"/>
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
                <a class="navbar-brand" href="<%=request.getContextPath()%>/MenuServlet"><img src="assets/img/pucp.png" alt="..." style="height: 65px;width: 170px;border-radius: 3px;"/></a>

                <div class="collapse navbar-collapse " id="navbarResponsive">
                    <ul class="navbar-nav ms-auto py-4 py-lg-0">
                        <div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
                            <ul class="navbar-nav">
                                <li class="nav-item dropdown">
                                    <a href="<%=request.getContextPath()%>/MenuServlet"><button class="btn btn-secondary" type="submit">Volver al menu</button></a>
                                </li>
                            </ul>
                        </div>
                    </ul>
                </div>

            </div>
        </nav>
        <form method="POST" action="<%=request.getContextPath()%>/PerfilServlet"enctype="multipart/form-data">
        <section class="page-section bg-light" id="portfolio" style="margin-top: 4%;">
            <div class="container">
                <div class="text-center" style="margin-bottom: -6%;">
                    <h2 class="section-heading text-uppercase">Mi perfil</h2>
                    <h3 class="section-subheading text-muted"></h3>
                </div>


                <img src="assets/img/objeto.jfif" style="width: 100px;margin-top: 3%" class="rounded float-end" alt="...">


                <div class="cuadrado" style="margin-left: -6%">
                    <img src="<%=request.getContextPath()%>/PerfImagenServlet" style="width: 230px;height: 150px;margin-left: 3%" class="rounded float-start" alt="...">

                    <div class="btn" style="margin-bottom: -8%">
                        <a  href="javascript:explorar();" >
                            <div class="form-group"style="position: relative; left: -55px; top: 70px;">
                                <img src="assets/img/camara.png" style="width: 50px;height: 4%;"  class="rounded float-start" alt="..." title="subir imagen"id="m">
                                <input type="file" name="f_subir" id="f_subir" style="display:none;" >
                            </div>
                        </a>
                    </div>
                </div>
                <%if (session.getAttribute("invalid1").equals("error")){%>
                </br>
                <div class="text-danger nb-2">
                    Datos invalidos.
                </div>
                <%session.removeAttribute("invalid1");%>
                <%}%>
                </div>
                <br>
                <br>
                <br>
                <br>
                <br>
                <div class="row align-items-stretch mb-5 " style="margin-top: 2%;width: 1400px;margin-left: 4%">
                    <div class="col-md-6">
                        <p class="mb-0"> DNI</p>
                        <div class="form-group">
                            <!-- Name input-->
                            <input class="form-control" id="nombre_funcion" type="text" value="<%=listaPerfil.get(0).getDni()%>"  disabled>
                        </div>
                        </br>
                        <p class="mb-0"> Código PUCP</p>
                        <div class="form-group">
                            <input class="form-control" type="text" value="<%=listaPerfil.get(0).getCodigo_pucp()%>" disabled >
                        </div>
                        </br>
                        <p class="mb-0"> Correo</p>
                        <div class="form-group">
                            <input class="form-control" type="email" value="<%=listaPerfil.get(0).getCorreo_pucp()%>" data-sb-validations="required,email" data-sb-can-submit="no" disabled>
                        </div>
                        </br>

                    </div>

                    <div class="col-md-6">

                        <p class="mb-0">Fecha de nacimiento</p>
                        <div class="form-group">
                            <input name="nacimiento" type="date" class="form-control" id="inputPassword2" value="<%=listaPerfil.get(0).getFecha_nacimiento()%>" max="2022-01-01">
                        </div>
                        </br>
                        <p class="mb-0">Dirección</p>
                        <div class="form-group">
                            <input name ="direccion" class="form-control" type="text" value="<%=listaPerfil.get(0).getDireccion()%>" required>
                        </div>
                        <br>
                        <p class="mb-0">Número de teléfono</p>
                        <div class="form-group">
                            <input maxlength="9" minlength="9" pattern="[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]" name="telefono" class="form-control" type="tel" required value="<%=listaPerfil.get(0).getNumtelefono()%>" >
                        </div>

                    </div>


                <div style="text-align: center;margin-top: 1%;">
                    <button class ="btn btn-primary btn-l" type="submit">Actualizar mis datos</button>
                </div>


            </div>
        </section>
        </form>

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
