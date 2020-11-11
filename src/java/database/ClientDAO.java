package database;

import static database.VenteDAO.requete;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import modele.Cheval;
import modele.Client;
import modele.Pays;
import modele.TypeCheval;

/**
 *
 * @author Dubosq
 */

public class ClientDAO {
    
    Connection connection=null;
    static PreparedStatement requete=null;
    static ResultSet rs=null;
    
    public static ArrayList<Client> getLesClients(Connection connection){      
        ArrayList<Client> lesClients = new  ArrayList<Client>();
        try
        {
            //preparation de la requete     
            requete=connection.prepareStatement("select * from client");
            
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
                
                Pays unPays = new Pays();
                unPays.setCode(rs.getString("codePays"));
                
                unClient.setUnPays(unPays);

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
    
    // Méthode permettant d'insérer un client en base à partir de l'objet client passé en paramètre
    // Cette méthode renvoie l'objet client
    public static Client ajouterClient(Connection connection, Client unClient){      
        int idGenere = -1;
        try
        {
            //preparation de la requete
            // id (clé primaire de la table client) est en auto_increment,donc on ne renseigne pas cette valeur
            // la paramètre RETURN_GENERATED_KEYS est ajouté à la requête afin de pouvoir récupérer l'id généré par la bdd (voir ci-dessous)
            // supprimer ce paramètre en cas de requête sans auto_increment.
            requete=connection.prepareStatement("insert into client (nom, prenom, rue, copos, ville, codePays, mail)\n" +
                    "VALUES (?,?,?,?,?,?,?)", requete.RETURN_GENERATED_KEYS );
            requete.setString(1, unClient.getNom());
            requete.setString(2, unClient.getPrenom());
            requete.setString(3, unClient.getRue());
            requete.setString(4, unClient.getCopos());
            requete.setString(5, unClient.getVille());
            requete.setString(6, unClient.getUnPays().getCode());
            requete.setString(7, unClient.getMail());

           /* Exécution de la requête */
            requete.executeUpdate();
            
             // Récupération de id auto-généré par la bdd dans la table client
            rs = requete.getGeneratedKeys();
            while ( rs.next() ) {
                idGenere = rs.getInt( 1 );
                unClient.setId(idGenere);
            }
            
            // ajout des enregistrement dans la table clientcategvente
            for (int i=0;i<unClient.getLesCategVentes().size();i++){
                PreparedStatement requete2=connection.prepareStatement("insert into clientcategvente (codeClient, codeCategVente )\n" +
                    "VALUES (?,?)");
                 requete2.setInt(1, unClient.getId());
                 requete2.setString(2, unClient.getLesCategVentes().get(i).getCode());
                 requete2.executeUpdate();
            }
            
        }   
        catch (SQLException e) 
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return unClient ;    
    }
    
    public static Client getClientById(Connection connection, String idUtilisateur){      
        
        Client unClient = null;
        try
        {
              unClient = new Client();
            requete=connection.prepareStatement("SELECT client.* from client, utilisateur where utilisateur.id_client = client.id and utilisateur.id = ?");
            requete.setInt(1, Integer.parseInt(idUtilisateur));

            rs=requete.executeQuery();
             
                while ( rs.next() ) {
     
                unClient.setId(rs.getInt("id"));
                unClient.setNom(rs.getString("nom"));
                unClient.setPrenom(rs.getString("prenom"));
                unClient.setRue(rs.getString("rue"));
                unClient.setCopos(rs.getString("copos"));
                unClient.setVille(rs.getString("ville"));
                unClient.setMail(rs.getString("mail"));
                
                Pays unPays = new Pays();
                unPays.setCode(rs.getString("codePays"));
                
                unClient.setUnPays(unPays);
                }
        }   
        catch (SQLException e) 
        {
            e.printStackTrace();
        }
        return unClient;
        
    }
    
    public static Client updateClient(Connection connection, Client unClient){      
        try
        {
            requete=connection.prepareStatement("UPDATE client SET nom = ?, prenom = ?, rue = ?, copos = ?, ville = ?, mail = ?, codePays = ? WHERE id = ?");
            requete.setString(1, unClient.getNom());
            requete.setString(2, unClient.getPrenom());
            requete.setString(3, unClient.getRue());
            requete.setString(4, unClient.getCopos());
            requete.setString(5, unClient.getVille());
            requete.setString(6, unClient.getMail());
            requete.setString(7, unClient.getUnPays().getCode());
            requete.setInt(8, unClient.getId());


           /* Exécution de la requête */
            requete.executeUpdate();

            
        }   
        catch (SQLException e) 
        {
            e.printStackTrace();
        }
        return unClient ;    
    }
    
}
