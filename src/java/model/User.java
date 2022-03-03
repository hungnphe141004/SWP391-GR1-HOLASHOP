/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author ASUS
 */
public class User {
     private String userNamme;
    private String password;
    private String email;

    public User() {
    }

    public User(String userNamme, String password, String email) {
        this.userNamme = userNamme;
        this.password = password;
        this.email = email;
    }

    public String getUserNamme() {
        return userNamme;
    }

    public void setUserNamme(String userNamme) {
        this.userNamme = userNamme;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    
}
