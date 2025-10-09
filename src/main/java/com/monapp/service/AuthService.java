package com.monapp.service;

import com.monapp.dao.PersonDAO;
import com.monapp.model.Person;
import org.mindrot.jbcrypt.BCrypt;

import java.util.Optional;

public class AuthService {
 private PersonDAO personeDAO= new PersonDAO();

  public Person authenticate(String email , String password){

    Person person= personeDAO.FinByEmail(email);
      System.out.println(person);
    if(person!=null && BCrypt.checkpw(password,person.getPassword())){
         return  person;
    }

    return null;
  }
}
