package com.monapp.servletdemo;

import com.monapp.dao.PatientDAO;
import com.monapp.enums.Role;
import com.monapp.model.Patient;
import com.monapp.model.SignesVitaux;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;

@WebServlet("/patient")
public class PatientServlet extends HttpServlet {
   private PatientDAO patientDAO=new PatientDAO();
   @Override
    public  void doGet(HttpServletRequest request , HttpServletResponse response){
       System.out.printf("doGet");
    }
     @Override
    public  void doPost(HttpServletRequest request , HttpServletResponse response){
        System.out.printf("doPost");
       String nom= request.getParameter("nom");
        String prenom= request.getParameter("prenom");
        String email= request.getParameter("email");
        String tension =request.getParameter("tension");
        int frequence_cardiaque= Integer.parseInt(request.getParameter("frequence_cardiaque"));
        int frequence_respiratoire= Integer.parseInt(request.getParameter("frequence_respiratoire"));
        double poids=Double.parseDouble(request.getParameter("poids"));
        double taille=Double.parseDouble(request.getParameter("taille"));
        double temperature=Double.parseDouble(request.getParameter("temperature"));


        String dateString = request.getParameter("date_rendez_vous");
        String HeureString = request.getParameter("heure_rendez_vous");

         LocalDate date =LocalDate.parse(dateString);
         LocalTime time= LocalTime.parse(HeureString);

         LocalDateTime dateRendezVous=LocalDateTime.of(date,time);

        String fullName=prenom +nom;
        Patient patient= new  Patient(fullName,email, Role.PATIENT);
        SignesVitaux signesVitaux= new SignesVitaux(tension,taille,poids,frequence_respiratoire,temperature,frequence_cardiaque,patient);

        patient.addSigneVitaux(signesVitaux);
        patientDAO.save(patient);
    }
}


