<%@ page contentType="application/vnd.ms-excel" %>
<%@ page import="com.example.culturalbox.Beans.Horarios, java.util.*" %>
<jsp:useBean type="java.util.ArrayList<com.example.culturalbox.Beans.Horarios>" scope="request" id="reporte_horarios"/>

<%
    String nombreArchivo = "Reporte.xls";
    response.setHeader("Content-Disposition", "attachment;filename="+nombreArchivo);
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Reporte de Salas Excel</title>
    </head>
    <body>
        <h1>Reporte de Horarios en la Sala</h1>
        <table border="1">
            <tr>
                <th>Funcion</th>
                <th>Genero</th>
                <th>Duracion</th>
                <th>Stock</th>
                <th>Costo</th>
                <th>Tickets Vendidos</th>
                <th>Recaudacion (Soles)</th>
            </tr>
            <%for(Horarios reporte: reporte_horarios ){%>
            <tr>
                <td><%=reporte.getNombre_funcion()%></td>
                <td><%=reporte.getGenero_funcion()%></td>
                <td><%=reporte.getDuracion()%></td>
                <td><%=reporte.getStock()%></td>
                <td><%=reporte.getCosto()%></td>
                <td><%=reporte.getTickets_vendidos()%></td>
                <td><%=reporte.getRecaudacion()%></td>
            </tr>
            <%}%>
        </table>
    </body>
</html>
