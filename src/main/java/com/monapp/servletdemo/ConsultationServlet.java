package com.monapp.servletdemo;

import com.monapp.dao.ConsultationDAO;
import com.monapp.dao.SpecialisteDAO;
import com.monapp.enums.StatusConsultation;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
@WebServlet("/ConsultationServlet")
public class ConsultationServlet extends HttpServlet {
    private ConsultationDAO consultationDAO= new ConsultationDAO();

    @Override
    public  void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        System.out.println("---- doPut ConsultationServlet ----");
        System.out.println("status param = " + req.getParameter("status"));
        System.out.println("idConsultation param = " + req.getParameter("idConsultation"));

        StatusConsultation status= StatusConsultation.valueOf(req.getParameter("status"));
         Long idConsultation = Long.parseLong(req.getParameter("idConsultation"));
         consultationDAO.AddAvisGenaraliste(status,idConsultation);
         resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        // ✅ Retourner un vrai JSON
        resp.getWriter().write("{\"message\": \"mise à jour avec succès\"}");
    }

}
