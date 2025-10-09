package com.monapp.servletdemo;

import com.monapp.dao.PersonDAO;
import com.monapp.enums.Role;
import com.monapp.enums.SpecialiteType;
import com.monapp.model.Person;
import com.monapp.model.Specialiste;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/specialiste")
public class SpecialisteServlet  extends HttpServlet {
    private PersonDAO personDAO = new PersonDAO();
    @Override
    public  void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        SpecialiteType[] listeSpecialites = SpecialiteType.values();

        // Envoyer vers la JSP avec l'attribut "specialites"
        req.setAttribute("specialites", listeSpecialites);
        req.getRequestDispatcher("Views/registreSpecialiste.jsp").forward(req, resp);


    }
    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String fullName= req.getParameter("nom")+req.getParameter("prenom");
        String email= req.getParameter("email");
        String password=req.getParameter("mdp");
        String specialiteString = req.getParameter("specialite");
        double tarif =Double.parseDouble(req.getParameter("tarif"));
        SpecialiteType specialiteType = SpecialiteType.valueOf(specialiteString);
        Role role= Role.SPECIALISTE;
        Person person= new Specialiste(fullName,email,password, role,tarif, specialiteType);
        personDAO.save(person);
    }
}
