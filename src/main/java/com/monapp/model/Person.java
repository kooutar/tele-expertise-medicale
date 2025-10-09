package com.monapp.model;

import com.monapp.enums.Role;
import jakarta.persistence.*;
import org.mindrot.jbcrypt.BCrypt;
@Entity
@Table(name="person")
@Inheritance(strategy = InheritanceType.JOINED)
public class Person {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String nom;

    @Column(nullable = false, unique = true)
    private String email;

    @Column
    private String password;
    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private Role role;

    public Person(String nom, String email, String password,Role role) {
        this.nom = nom;
        this.email = email;
        this.password = HashePassword(password);
        this.role=role;
    }

    public Person() {

    }

    private String HashePassword(String password){
        String salt = BCrypt.gensalt(10);
        return  BCrypt.hashpw(password, salt);
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = HashePassword(password);
    }

    public Long getId() {
        return id;
    }
    @Override
    public String toString(){
        return nom + " "+ email + " "+ role;
    }
}
