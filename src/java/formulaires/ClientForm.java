/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package formulaires;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import modele.CategVente;
import modele.Client;
import modele.Pays;

/**
 * 
 * @author DUBOSQ
 */
public class ClientForm {
    
    private String resultat;
    private Map<String, String> erreurs = new HashMap<String, String>();

    public String getResultat() {
        return resultat;
    }

    public void setResultat(String resultat) {
        this.resultat = resultat;
    }

    public Map<String, String> getErreurs() {
        return erreurs;
    }

    public void setErreurs(Map<String, String> erreurs) {
        this.erreurs = erreurs;
    }
    
    //méthode de validation du champ de saisie nom
    private void validationNom( String nom ) throws Exception {
        if ( nom != null && nom.length() < 3 ) {
        throw new Exception( "Le nom d'utilisateur doit contenir au moins 3 caractères." );
        }
    }

    private void setErreur(String champ, String message ) {
    erreurs.put(champ, message);
    }    
    
    private static String getDataForm(HttpServletRequest request, String nomChamp) {
        String valeur = request.getParameter( nomChamp );
        if ( valeur == null || valeur.trim().length() == 0 ) {
            return null;
        } else {
            return valeur.trim();
        }   
    }
    
    
    public Client ajouterClient( HttpServletRequest request ) {
      
        Client unClient  = new Client();
         
        String nom = getDataForm( request, "nom" );
        String prenom = getDataForm( request, "prenom");
        String rue = getDataForm( request, "rue" );
        String copos = getDataForm( request, "copos");
        String ville = getDataForm( request, "ville" );
        String pays = getDataForm( request, "pays" );
         
      
        unClient.setPrenom(prenom);
        unClient.setRue(rue);
        unClient.setCopos(copos);
        unClient.setVille(ville);
        unClient.setUnPays(new Pays(pays));
               
       
        return unClient;
    }
    
    public Client updateClient( HttpServletRequest request ) {
      
        Client unClient  = new Client();
         
        String id = getDataForm(request, "id");
        String nom = getDataForm(request, "nom");
        String prenom = getDataForm(request, "prenom");
        String rue = getDataForm(request, "rue");
        String copos = getDataForm(request, "copos");
        String ville = getDataForm(request, "ville");
        String mail = getDataForm(request, "mail");
        String pays = getDataForm(request, "pays");
        
        unClient.setId(Integer.parseInt(id));
        unClient.setNom(nom);
        unClient.setPrenom(prenom);
        unClient.setRue(rue);
        unClient.setCopos(copos);
        unClient.setVille(ville);
        unClient.setMail(mail);
        unClient.setUnPays(new Pays(pays));
               
       
        return unClient;
    }
    
}
