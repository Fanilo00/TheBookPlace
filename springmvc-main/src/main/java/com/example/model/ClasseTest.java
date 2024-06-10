package com.example.model;

public class ClasseTest {
    String nom;

    public ClasseTest(String nom) {
        this.nom = nom;
    }

    public ClasseTest() {
    }

    public String getNom() {
        return nom;
    }

    public ClasseTest setNom(String nom) {
        this.nom = nom;
        return this;
    }
}
