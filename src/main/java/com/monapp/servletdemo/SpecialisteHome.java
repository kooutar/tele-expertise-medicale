package com.monapp.servletdemo;

import com.monapp.model.Consultation;
import com.monapp.model.Person;
import com.monapp.model.Specialiste;
import com.monapp.service.ConsultationService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;
@WebServlet("/specialiste/Home")
public class SpecialisteHome  extends HttpServlet {
    ConsultationService consultationService= new  ConsultationService();
     @Override
    public  void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         HttpSession session= request.getSession(false);
         Person specailiste = (Person) session.getAttribute("person");
         Long specialiste_id= specailiste.getId();
         List<Consultation> consultationsJour=consultationService.afficheConsultationCurranteSpecailist(specialiste_id);
         request.setAttribute("consultationsJour",consultationsJour);
         request.getRequestDispatcher("/Views/HomeSpecialiste.jsp").forward(request,response);
     }



}
