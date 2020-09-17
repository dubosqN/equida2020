/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import modele.CategVente;
import modele.Cheval;
import modele.Client;
import modele.Courriel;
import modele.Lieu;
import modele.Pays;
import modele.TypeCheval;
import modele.Vente;

/**
 *
 * @author Zakina
 * 22/06/2017
 * Classe faisant la liaison entre la table Vente et la classe Vente
 */
public class VenteDAO {

    
    Connection connection=null;
    static PreparedStatement requete=null;
    static ResultSet rs=null;
    
    /* @author Zakina - 22/06/2017
    /* Méthode permettant de lister toutes les ventes enregistrées en base, triées par date décroissante.
    /* Pour chaque vente, on récupère aussi sa catégorie.
    /* La liste des vente est stockée dans une ArrayList
    */
    public static ArrayList<Vente>  getLesVentes(Connection connection){      
        ArrayList<Vente> lesVentes = new  ArrayList<Vente>();
        try
        {
            //preparation de la requete     
            requete=connection.prepareStatement("SELECT * from vente, categvente, lieu where vente.codeCategVente=categvente.code AND lieu.id = vente.id_lieu;");          
            //executer la requete
            rs=requete.executeQuery();
            
            //On hydrate l'objet métier Client avec les résultats de la requête
            while ( rs.next() ) {  
                Vente uneVente = new Vente();
                uneVente.setId(rs.getInt("id"));
                uneVente.setNom(rs.getString("nom"));
                uneVente.setDateDebutVente(rs.getString("dateDebut"));
                
                CategVente uneCateg = new CategVente();
                uneCateg.setCode(rs.getString("code"));  // on aurait aussi pu prendre CodeCateg
                uneCateg.setLibelle(rs.getString("libelle"));
                
                uneVente.setUneCategVente(uneCateg);
                lesVentes.add(uneVente);
                
                Lieu unLieu = new Lieu();
                unLieu.setId(rs.getInt("id"));
                unLieu.setVille(rs.getString("ville"));
                unLieu.setNbBoxes(rs.getInt("nbBoxes"));
                unLieu.setCommentaire(rs.getString("commentaire"));
                
                uneVente.setUnLieu(unLieu);
                
                
            }
        }   
        catch (SQLException e) 
        {
            e.printStackTrace();
        }
        return lesVentes ;    
    } 
    
    /* @author Zakina - 22/06/2017
    /* Méthode permettant de lister les clients interessés par la catégorie de la vente selectionnée (passée en paramètre de la méthode)
    /* Pour chaque client, on récupère aussi le nom de son pays
    /* La liste des clients est stockée dans une ArrayList
    */
    public static ArrayList<Client>  getLesClients(Connection connection, String codeCateg){      
        ArrayList<Client> lesClients = new  ArrayList<Client>();
        try
        {
            //preparation de la requete     
            //codeCateg="ETE";
            requete=connection.prepareStatement("SELECT c.*, p.nom as nomPays, cv.libelle FROM client c, pays p, clientcategvente cc, categVente cv where c.codePays=p.code and cc.codeClient=c.id and cv.code=cc.codeCategVente and codeCategVente= ? ORDER BY c.id");
            requete.setString(1, codeCateg);
            //executer la requete
            rs=requete.executeQuery();
             
            //On hydrate l'objet métier Client avec les résultats de la requête
            while ( rs.next() ) {  
                
                
                
                Client unClient = new Client();
                unClient.setId(rs.getInt("id"));
                unClient.setNom(rs.getString("nom"));
                unClient.setPrenom(rs.getString("prenom"));
                unClient.setRue(rs.getString("rue"));
                unClient.setCopos(rs.getString("copos"));
                unClient.setVille(rs.getString("ville"));
                unClient.setMail(rs.getString("mail"));
                
                Pays p = new Pays();
                p.setCode(rs.getString("codePays"));
                p.setNom(rs.getString("nomPays"));
                
                unClient.setUnPays(p);
                /*CategVente uneCateg = new CategVente();
                uneCateg.setCode(rs.getString("code"));  // on aurait aussi pu prendre CodeCateg
                uneCateg.setLibelle(rs.getString("libelle"));*/
                
                lesClients.add(unClient);
            }
        }   
        catch (SQLException e) 
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return lesClients ;    
    } 
    
    
    public static ArrayList<Courriel>  getLesCourriels(Connection connection, String idVente){      
        ArrayList<Courriel> lesCourriels = new  ArrayList<Courriel>();
        try
        {
            //preparation de la requete     
            requete=connection.prepareStatement("SELECT mail.* FROM vente, mail WHERE vente.id = mail.id_vente AND vente.id = ?");
            requete.setString(1, idVente);
            //executer la requete
            rs=requete.executeQuery();
             
            
            while ( rs.next() ) {  
   
                Courriel unCourriel = new Courriel();
                unCourriel.setId(rs.getInt("id"));
                unCourriel.setObjet(rs.getString("objet"));
                unCourriel.setCorps(rs.getString("corps"));
                unCourriel.setDate(rs.getString("date_mail"));
                
                lesCourriels.add(unCourriel);
                System.out.println(unCourriel);
            }
        }   
        catch (SQLException e) 
        {
            e.printStackTrace();
            
        }
        return lesCourriels ;    
    } 
    
   public static ArrayList<Cheval>  getLesChevaux(Connection connection, String idVente){      
        ArrayList<Cheval> lesChevaux = new  ArrayList<Cheval>();
        try
        {
             
            requete=connection.prepareStatement("SELECT che.*, c.nom as nomVendeur, t.libelle as race FROM client c, cheval che, typecheval t, vente where che.id_client = c.id and che.id_typeCheval=t.id and vente.id = ?");
            requete.setString(1, idVente);
            
            System.out.println("requete" + requete);
            rs=requete.executeQuery();
            
            while ( rs.next() ) { 
                
                Cheval unCheval = new Cheval();
                unCheval.setId(rs.getInt("id"));
                unCheval.setNom(rs.getString("nom"));

                Client unClient = new Client();
                unClient.setId(rs.getInt("id"));  
                unClient.setNom(rs.getString("nomVendeur"));
                
                TypeCheval unTypeCheval = new TypeCheval();
                unTypeCheval.setId(rs.getInt("id"));
                unTypeCheval.setLibelle(rs.getString("race"));
                
                unCheval.setUnClient(unClient);
                unCheval.setLeTypeDeCheval(unTypeCheval);
                
                lesChevaux.add(unCheval);

            }
            System.out.println("lesChevaux" + lesChevaux.size());
        }   
        catch (SQLException e) 
        {
            e.printStackTrace();
        }
        return lesChevaux ;
        
    }
   
    public static Cheval  getInfosCheval(Connection connection, String idCheval){      
        Cheval unCheval = new Cheval();
        try
        {
             
            requete=connection.prepareStatement("SELECT che.* FROM cheval as che where che.id = ?");
            requete.setString(1, idCheval);
            
            System.out.println("requete" + requete);
            rs=requete.executeQuery();
            
                unCheval.setId(rs.getInt("id"));
                unCheval.setNom(rs.getString("nom"));
                unCheval.setSexe(rs.getString("sexe"));
                unCheval.setPrixDepart(rs.getInt("prixDepart"));
                unCheval.setSIRE(rs.getString("SIRE"));

            
            System.out.println("lesChevaux" + unCheval.getNom());
        }   
        catch (SQLException e) 
        {
            e.printStackTrace();
        }
        return unCheval ;
        
    }

    
}
//SELECT che.*, c.nom as nomVendeur, t.libelle as race FROM client c, cheval che, typecheval t where che.id_client = c.id and che.id_typeCheval=t.id
//SELECT che.*, v.id, c.nom as nomVendeur, t.libelle as race FROM client c, cheval che, typecheval t, vente v, vente_typecheval vt where che.id_client = c.id and che.id_typeCheval=t.id and t.id = vt.id_vente and vt.id_vente = v.id and v.id = 210717;
//SELECT cheval.*, client.nom, typecheval.libelle where cheval.id_client = client.id and cheval.id = lot.id_cheval and lot.id_vente = vente.id and cheval.id_typeCheval = typecheval.id and vente.id = 210717;