package formulaires;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import modele.Cheval;
import modele.Client;
import modele.TypeCheval;

/**
 * 
 * @author DUBOSQ
 */
public class ChevalForm {
    
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
   
    
    private static String getDataForm( HttpServletRequest request, String nomChamp ) {
        String valeur = request.getParameter( nomChamp );
        System.out.println("Valeur " + nomChamp + "valeur : " +valeur);
        if ( valeur == null || valeur.trim().length() == 0 ) {
            return null;
        } else {
            return valeur.trim();
        }   
    }
    
    
    public Cheval ajouterCheval(HttpServletRequest request) {
      
        Cheval unCheval  = new Cheval();
         
        String nom = getDataForm( request, "nom" );
        String sexe = getDataForm( request, "sexe" );
        String prixDepart = getDataForm( request, "prixDepart" );
        String SIRE = getDataForm( request, "sire" );
        int client = Integer.parseInt(getDataForm(request, "client"));
        int typeCheval = Integer.parseInt(getDataForm(request, "typeCheval"));
        int mere = Integer.parseInt(getDataForm(request, "mere"));
        int pere = Integer.parseInt(getDataForm(request, "pere"));
         
      
        unCheval.setNom(nom);
        unCheval.setSexe(sexe);
        unCheval.setPrixDepart(Integer.parseInt(prixDepart));
        unCheval.setSIRE(SIRE);
        unCheval.setUnClient(new Client(client));
        unCheval.setLeTypeDeCheval(new TypeCheval(typeCheval));
        unCheval.setMere(new Cheval(mere));
        unCheval.setPere(new Cheval(pere));
        
               
       
        return unCheval ;
    }

}

