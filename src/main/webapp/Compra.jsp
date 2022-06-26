<%@ page import="com.example.culturalbox.Beans.Compra" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: victor
  Date: 12/06/2022
  Time: 22:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ArrayList<Compra> comprasNopagadas =  (ArrayList<Compra>) request.getAttribute("comprasNopagadas");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu de compra</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <!-- Importando estilos personalizados -->
    <link rel="stylesheet" type="text/css" href="css/styles.css">

</head>

<body>
<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-dark fixed-top bg-dark" id="mainNav">
    <div class="container-md">
        <a class="navbar-brand" href="<%=request.getContextPath()%>/MenuServlet"><img src="assets/img/pucp.png" alt="..." style="height: 65px;width: 170px;border-radius: 3px;"></a>

        <div class="collapse navbar-collapse " id="navbarResponsive">
            <ul class="navbar-nav ms-auto py-4 py-lg-0">
                <div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
                    <ul class="navbar-nav">
                        <li class="nav-item dropdown">
                            <a href="<%=request.getContextPath()%>/MenuServlet"><button class="btn btn-primary btn-sm" type="submit">Volver al menu</button></a>
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
            <br>
            <h2 class="section-heading text-uppercase text-dark">Menú de Compra</h2>
            <h3 class="section-subheading text-muted"></h3>
        </div>

        <table class="table caption-top">
            <caption>Seleccione la cantidad de tickets que desea por cada función</caption>
            <thead>
            <tr>
                <th scope="col" class="text">#</th>
                <th scope="col">Función</th>
                <th scope="col">Horario</th>
                <th scope="col">Precio Unitario</th>
                <th scope="col">N° tickets</th>
                <th scope="col"></th>
            </tr>
            </thead>
            <tbody>
            <% int i = 1;
                int total = 0;
                ArrayList<String> idsCompra = new ArrayList<>();
                for(Compra compra:comprasNopagadas){%>
            <tr>
                <th scope="row" class="text"><%=i%></th>
                <td><%=compra.getNombre_funcion()%></td>
                <td><%=compra.getT_init()%></td>
                <td>S/<%=compra.getCosto()%></td>
                <td>
                    <label for="num_tickets" class="form-label"></label>
                    <input type="number" value = "1" name="num_tickets" id="num_tickets" min="1" max="10">
                    <a href="<%=request.getContextPath()%>/MenuServlet?a=borrarCompra&id=<%=compra.getIdCompra()%>"><button class="btn btn-success btn-sm" type="submit">Seleccionar</button></a>
                    <%=compra.getNu_tickets()%>
                </td>
                <td>
                    <a href="<%=request.getContextPath()%>/MenuServlet?a=borrarCompra&id=<%=compra.getIdCompra() %>"><button class="btn btn-danger btn-md" type="submit">Cancelar</button></a>
                </td>
            </tr>
            <%i++;
                total = total+compra.getCosto();
                idsCompra.add(compra.getIdCompra());
            }%>
            </tbody>
            <tfoot>
            <tr><td colspan="2"></td>
                <td><h4>TOTAL: </h4></td>
                <td><h4>S/<%=total%></h4></td>
                <td><button type="button" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#exampleModal">IR A PAGAR</button></td>
            </tr></tfoot>
        </table>
    </div>
</section>

<!-- MODAL DE FACTURACION-->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Pago con tarjeta crédito/débito</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- Credit card form content -->
                <div class="tab-content">
                    <!-- credit card info-->
                    <div id="credit-card" class="tab-pane fade show active pt-3">
                        <form method="POST" action="<%=request.getContextPath()%>/MenuServlet?a=crearCompra2">
                            <div class="form-group">
                                <label for="titular"><h6>Titular de la tarjeta</h6></label>
                                <input type="text" name="titular" id="titular" placeholder="Nombre" required="" class="form-control ">
                            </div>
                            <div class="form-group">
                                <label for="tarjeta"><h6>Número de tarjeta</h6></label><div class="input-group">
                                <input type="text" name="tarjeta" id="tarjeta" placeholder="Número válido" class="form-control " required="">
                                <div class="input-group-append"> <span class="input-group-text text-muted"> <i class="fab fa-cc-visa mx-1"></i> <i class="fab fa-cc-mastercard mx-1"></i> <i class="fab fa-cc-amex mx-1"></i> </span> </div>
                            </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-8">
                                    <div class="form-group">
                                        <label for="mes"><span class="hidden-xs"><h6>Fecha de Expiración</h6></span></label>
                                        <div class="input-group">
                                            <input type="number" placeholder="MM" name="mes" id="mes" class="form-control" required="" min="1" max="12">
                                            <input type="number" placeholder="YY" name="anho" id="anho" class="form-control" min="2022" max="2040" required="">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group mb-4"> <label for="cvv" data-toggle="tooltip" title="Three digit CV code on the back of your card">
                                        <h6>CVV <i class="fa fa-question-circle d-inline"></i></h6>
                                    </label> <input type="text" name="cvv" id="cvv" required="" class="form-control"> </div>
                                </div>
                            </div>
                            <div class="card-footer"><a href="/MenuServlet">
                                <button type="submit" class="subscribe btn btn-primary btn-block shadow-sm position"> Confirmar Pago </button></a>
                            </div></form>
                    </div> <!-- End -->
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>