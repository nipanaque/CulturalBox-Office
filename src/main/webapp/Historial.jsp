<%@ page import="com.example.culturalbox.Beans.Historial" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="listaHistorial" scope="request" type="java.util.ArrayList<com.example.culturalbox.Beans.Historial>" />
<jsp:useBean id="funcionesvigentes" scope="request" type="java.util.ArrayList<com.example.culturalbox.Beans.Historial>" />
<%@ page import="com.example.culturalbox.Beans.Menu" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.culturalbox.Beans.Horarios" %>
<%
    ArrayList<Menu> listaMenu =  (ArrayList<Menu>) request.getAttribute("listaMenu");
    ArrayList<ArrayList<Horarios>> listaListasHorarios = (ArrayList<ArrayList<Horarios>>) request.getAttribute("listaListasHorarios");
    int contCompras = (int) request.getAttribute("contCompras");
%>
<jsp:useBean id="usuarioSesion" scope="session" type="com.example.culturalbox.Beans.Usuario" class="com.example.culturalbox.Beans.Usuario"/>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">

        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Historial</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:500,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css"/>
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
                                <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/MenuServlet?a=listarCompras">
                                    <img src="assets/img/carrito.png" style="width: 90px;margin-right:6px;margin-top:8px;"  class="rounded float-start" alt="...">
                                    <span class="badge rounded-pill bg-danger"style="margin-left:-6px;">
                                         <%=contCompras%>
                                         <span class="visually-hidden">unread messages</span>
                                         </span>
                                </a></li>
                                <li class="nav-item dropdown">


                                    <a href="<%=request.getContextPath()%>/MenuServlet"><button class="btn btn-secondary btn-sm" type="submit">Volver al menu</button></a>
                                </li>
                            </ul>
                        </div>
                    </ul>
                </div>

            </div>
        </nav>
        <section class="page-section bg-light" id="portfolio" style="margin-top: 4%">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">Historial de funciones</h2>
                    <h3 class="section-subheading text-muted"></h3>
                </div>

                <div class="row align-items-stretch mb-5">
                    <div class="col-md-6">
                        <p class="mb-0"> Funciones vigentes</p>
                        <!-- <h6 style="color: red;">Nombre de la función</h6>-->
                        <div class="form-group">
                            <!-- Name input-->
                            <table id="tablap" class="table table-striped table-bordered" style="width:100%">
                                <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Funcion</th>
                                        <th colspan="2" scope="col">Sede</th>
                                        <th colspan="2" scope="col">Nº tickets</th>
                                        <th scope="col"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%  int i = 1;
                                        for (Historial historial : funcionesvigentes) {%>
                                    <tr>

                                        <td scope="row"><%= i%></td>
                                        <td colspan="2"><%= historial.getNombre_funcion()%></td>
                                        <td><%= historial.getNombre_sede()%></td>
                                        <td colspan="2" scope="col"><%= historial.getNum_ticket()%></td>

                                        <td>
                                            <button type="button" data-bs-toggle="modal" data-bs-target="#Modal<%=i%>" class="btn btn-danger">Cancelar</button>
                                        </td>
                                    </tr>
                                    <% i++;}%>
                                </tbody>
                            </table>
                        </div>
                        </br>

                    </div>

                    <div class="col-md-6">
                        <p class="mb-0"> Funciones pasadas</p>
                        <!-- <h6 style="color: red;">Nombre de la función</h6>-->
                        <div class="form-group">
                            <!-- Name input-->
                            <table id="tablax" class="table table-striped table-bordered" style="width:100%">
                                <thead>
                                    <th>#</th>
                                    <th>Función</th>
                                    <th>Sede</th>
                                    <th>Calificación</th>
                                </thead>
                                <tbody>
                                    <%   i = 1;
                                        for (Historial historial1 : listaHistorial) {%>
                                    <tr>
                                        <td><%= i%></td>
                                        <td><%= historial1.getNombre_funcion()%></td>
                                        <td><%= historial1.getNombre_sede()%></td>
                                        <td>
                                            <a  href="<%=request.getContextPath()%>/CalificacionServlet?a=crear&idf=<%=historial1.getNum_ticket()%>"><button class="btn btn-dark btn-md" type="submit">Calificar</button></a>
                                        </td>
                                    </tr>
                                    <% i++;}%>
                                </tbody>
                            </table>
                        </div>
                        </br>

                    </div>
                </div>
            </div>
            <!-- Modal -->
            <%int j = 1;
                for(Historial historial2 : funcionesvigentes){ %>
            <div class="modal fade" id="Modal<%=j%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <center><h5 class="modal-title" id="exampleModalLabel">Advertencia</h5></center>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <center>¿Esta seguro de cancelar su función? No habrá reembolso alguno y además la acción es irreversible</center>
                            <br>
                            <form method="POST" action="<%=request.getContextPath()%>/HistorialServlet?a=cancelar">
                                <input style="display: none" name="idCompra" value="<%=historial2.getIdCompra()%>">
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                                    <button type="submit" class="btn btn-danger">Cancelar</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <%j++;}%>
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
        <!-- JQUERY -->
        <script src="https://code.jquery.com/jquery-3.4.1.js"
                integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous">
        </script>
        <!-- DATATABLES -->
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js">
        </script>
        <script>
            $(document).ready(function () {
                $('#tablax').DataTable({
                    language: {
                        processing: "Tratamiento en curso...",
                        search: "Buscar&nbsp;:",
                        lengthMenu: "Agrupar de _MENU_ items",
                        info: "Mostrando del item _START_ al _END_ de un total de _TOTAL_ items",
                        infoEmpty: "No existen datos.",
                        infoFiltered: "(filtrado de _MAX_ elementos en total)",
                        infoPostFix: "",
                        loadingRecords: "Cargando...",
                        zeroRecords: "No se encontraron datos con tu busqueda",
                        emptyTable: "No hay datos disponibles en la tabla.",
                        paginate: {
                            first: "Primero",
                            previous: "Anterior",
                            next: "Siguiente",
                            last: "Ultimo"
                        },
                        aria: {
                            sortAscending: ": active para ordenar la columna en orden ascendente",
                            sortDescending: ": active para ordenar la columna en orden descendente"
                        }
                    },
                    scrollY: 400,
                    lengthMenu: [ [10, 25, -1], [10, 25, "All"] ],
                });
            });
        </script>
        <script>
            $(document).ready(function () {
                $('#tablap').DataTable({
                    language: {
                        processing: "Tratamiento en curso...",
                        search: "Buscar&nbsp;:",
                        lengthMenu: "Agrupar de _MENU_ items",
                        info: "Mostrando del item _START_ al _END_ de un total de _TOTAL_ items",
                        infoEmpty: "No existen datos.",
                        infoFiltered: "(filtrado de _MAX_ elementos en total)",
                        infoPostFix: "",
                        loadingRecords: "Cargando...",
                        zeroRecords: "No se encontraron datos con tu busqueda",
                        emptyTable: "No hay datos disponibles en la tabla.",
                        paginate: {
                            first: "Primero",
                            previous: "Anterior",
                            next: "Siguiente",
                            last: "Ultimo"
                        },
                        aria: {
                            sortAscending: ": active para ordenar la columna en orden ascendente",
                            sortDescending: ": active para ordenar la columna en orden descendente"
                        }
                    },
                    scrollY: 400,
                    lengthMenu: [ [10, 25, -1], [10, 25, "All"] ],
                });
            });
        </script>
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
