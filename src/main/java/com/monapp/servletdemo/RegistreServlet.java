package com.monapp.servletdemo;


import com.monapp.dao.PersonDAO;
import com.monapp.enums.Role;
import com.monapp.model.Person;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;






@WebServlet("/registre")
public class RegistreServlet extends HttpServlet {
  private PersonDAO personDAO = new PersonDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();
        out.println("Servlet RegistreServlet fonctionne !");
        System.out.println("salam");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            String name=request.getParameter("nom");
            String prenom=request.getParameter("prenom");
            String email=request.getParameter("email");
            String password=request.getParameter("mdp");
            String fullName= name+" "+ prenom;
        Person person= new Person(fullName,email,password, Role.INFIRMIER);
        personDAO.save(person);
    }
}