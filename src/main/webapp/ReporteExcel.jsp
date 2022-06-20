<%@ page contentType="application/vnd.ms-excel" %>
<%@ page import="com.example.culturalbox.Beans.Horarios" %>
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
        <table>
            <tr>
                <th>Función</th>
                <th>Género</th>
                <th>Duración</th>
                <th>Stock</th>
                <th>Costo</th>
                <th>Tickets Vendidos</th>
                <th>Recaudación (Soles)</th>
            </tr>
            <%for(Horarios reporte: reporte_horarios ){%>
            <tr>
                <td><%=reporte.getNombre_funcion()%></td>
                <td><%=reporte.getGenero_funcion()%></td>
                <td><%=reporte.getDuracion()%></td>
                <td><%=reporte.getStock()%></td>
                <td><%=reporte.getTickets_vendidos()%></td>
                <td><%=reporte.getTickets_vendidos()%></td>
                <td><%=reporte.getRecaudacion()%></td>
            </tr>
            <%}%>
        </table>
    </body>
</html>
