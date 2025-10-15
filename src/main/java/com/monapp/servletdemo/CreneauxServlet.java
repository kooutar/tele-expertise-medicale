package com.monapp.servletdemo;

import com.monapp.dao.ConsultationDAO;
import com.monapp.dao.SpecialisteDAO;
import com.monapp.model.Consultation;
import com.monapp.model.Creneaux;
import com.monapp.model.Specialiste;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.time.LocalDate;
import java.time.LocalTime;

@WebServlet("/Creneaux")
public class CreneauxServlet  extends HttpServlet {
    private ConsultationDAO consultationDAO = new ConsultationDAO();
    private SpecialisteDAO specialisteDAO=new SpecialisteDAO();
   @Override
    public  void doPost(HttpServletRequest request, HttpServletResponse response) {
           Long idConsultation =Long.parseLong(request.getParameter("idConsultation"));
           Long idSpecialiste=Long.parseLong(request.getParameter("specialiste"));
           LocalDate jour =LocalDate.parse(request.getParameter("date"));
           LocalTime heure=LocalTime.parse(request.getParameter("time"));
           Creneaux creneaux=new Creneaux(null,jour,heure,true);
       Specialiste specialiste= specialisteDAO.getSpecialisteById(idSpecialiste);
           Consultation c =consultationDAO.getConsulationById(idConsultation);
           c.setSpecialiste(specialiste);
           c.setCreneau(creneaux);
           consultationDAO.save(c);
   }
}
