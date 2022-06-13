package com.example.culturalbox.Servlets;

import com.example.culturalbox.Beans.Aforo;
import com.example.culturalbox.Beans.Sedes;
import com.example.culturalbox.Daos.EditarSedeDao;
import com.example.culturalbox.Daos.SedesDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "SedesServlet", value = "/Sedes")
public class SedesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("s") == null ? "listar" : request.getParameter("s");
        SedesDao sedesDao = new SedesDao();

        switch (action) {
            case "listar" -> {
                request.setAttribute("listaSedes",sedesDao.obtenerSedes());

                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Sedes.jsp");
                requestDispatcher.forward(request,response);
            }
            case "ver" -> {
                String id = request.getParameter("id");
                Sedes sede = sedesDao.encontrarSede(id);
                request.setAttribute("sede", sede);
                request.setAttribute("listaAforos", sedesDao.obtenerAforos(id));
                request.setAttribute("sede", sede);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("VerSede.jsp");
                requestDispatcher.forward(request, response);

            }
            case "editar" -> {
                String id = request.getParameter("id");
                Sedes sede = sedesDao.encontrarSede(id);
                request.setAttribute("sede", sede);
                request.setAttribute("listaAforos", sedesDao.obtenerAforos(id));
                request.setAttribute("sede", sede);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("EditarSede.jsp");
                requestDispatcher.forward(request, response);

            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("s") == null ? "listar" : request.getParameter("s");
        SedesDao sedesDao = new SedesDao();

        switch (action) {

            case "actualizar" -> {
                ArrayList<Aforo> listaAforosSalas = leerAforosRequest(request);
                Sedes sede = new Sedes();
                String sedeId = request.getParameter("SedeId");
                String aforoSede  = request.getParameter("AforoSede");
                sede.setId(sedeId);
                sede.setAforo(Integer.parseInt(aforoSede));
                sedesDao.actualizar(listaAforosSalas, sede);
                response.sendRedirect(request.getContextPath() + "/Sedes");
            }

        }

    }

    public ArrayList<Aforo> leerAforosRequest(HttpServletRequest request) {
        String cantidadSalasStr = request.getParameter("CantidadSalas");
        int cantidadSalasInt = Integer.parseInt(cantidadSalasStr);
        ArrayList<Aforo> listaaforos = new ArrayList();
        for(int i =1;i <= cantidadSalasInt; i++){
            Aforo aforos = new Aforo();
            String parameto = "AforoSala"+i;
            //**System.out.println(parameto);

            String aforoSala = request.getParameter(parameto);

            //**System.out.println(aforoSala);
            aforos.setAforos(Integer.parseInt(aforoSala));
            listaaforos.add(aforos);
        }
        return listaaforos;
    }

}

