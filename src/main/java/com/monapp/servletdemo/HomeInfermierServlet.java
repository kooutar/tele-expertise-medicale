package com.monapp.servletdemo;

import com.monapp.model.Consultation;
import com.monapp.service.ConsultationService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/Views/HomeInfermier")
public class HomeInfermierServlet extends HttpServlet {
    private ConsultationService consultationService= new ConsultationService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Consultation> consultationsCourantes=consultationService.afficheConsultationCurrante();
        request.setAttribute("consultationsCourantes",consultationsCourantes);
        request.getRequestDispatcher("/Views/HomeInfermier.jsp").forward(request, response);
    }
}