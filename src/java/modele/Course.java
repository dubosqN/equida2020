/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modele;

import java.util.ArrayList;

/**
 *
 * @author sio2
 */
public class Course {
    private int id;
    private String libelle;
    private String dateCourse;
    private String ville;
    private ArrayList<Participer> lesParticipations;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLibelle() {
        return libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    public String getDateCourse() {
        return dateCourse;
    }

    public void setDateCourse(String dateCourse) {
        this.dateCourse = dateCourse;
    }

    public String getVille() {
        return ville;
    }

    public void setVille(String ville) {
        this.ville = ville;
    }

    public ArrayList<Participer> getLesParticipations() {
        return lesParticipations;
    }

    public void setLesParticipations(ArrayList<Participer> lesParticipations) {
        this.lesParticipations = lesParticipations;
    }
    
    public void addUneParticipation (Participer uneParticiaption){
        if(lesParticipations == null){
            lesParticipations = new ArrayList<Participer>();
        }
        lesParticipations.add(uneParticiaption);
    }
    
}
