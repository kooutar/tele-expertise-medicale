package com.monapp.servletdemo;

import com.monapp.model.Person;
import com.monapp.service.AuthService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
     private AuthService authService=new AuthService();
    public  void doPost(HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException {
        String email= request.getParameter("email");
        String password = request.getParameter("password");
        Person person =authService.authenticate(email,password);
        if (person != null) {
            switch (person.getRole().name()) {
                case "INFIRMIER" ->
                        response.sendRedirect(request.getContextPath() + "/Views/HomeInfermier");
                case "GENERALISTE" ->
                        response.sendRedirect(request.getContextPath() + "/Views/HomeGeneraliste.jsp");
                case "SPECIALISTE" ->
                        response.sendRedirect(request.getContextPath() + "/Views/HomeSpecialiste.jsp");
                default ->
                        response.sendRedirect(request.getContextPath() + "/vide.jsp");
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/null.jsp");
        }





    }
}
