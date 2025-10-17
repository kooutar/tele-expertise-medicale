package com.monapp.servletdemo;

import com.monapp.dao.SpecialisteDAO;
import com.monapp.model.Consultation;
import com.monapp.model.Specialiste;
import com.monapp.service.ConsultationService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/generaliste")
public class HomeGeneralisteServlet extends HttpServlet {
    private ConsultationService consultationService= new ConsultationService();
    private SpecialisteDAO specialisteDAO= new SpecialisteDAO();
    @Override
    public  void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Consultation> consultationsJour=consultationService.afficheConsultationCurrante();
        List<Specialiste> listeSpecialistes= specialisteDAO.getAllSpecialiste();
        request.setAttribute("consultationsJour",consultationsJour);
        request.setAttribute("listeSpecialistes",listeSpecialistes);
        request.getRequestDispatcher("/Views/HomeGeneraliste.jsp").forward(request,response);
    }
}
