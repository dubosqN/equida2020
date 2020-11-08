/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import static database.ClientDAO.requete;
import static database.VenteDAO.requete;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import modele.Cheval;
import modele.Client;
import modele.Enchere;
import modele.Lot;
import modele.Pays;
import modele.TypeCheval;

/**
 *
 * @author noedu
 */
public class LotDAO {
        Connection connection=null;
    static PreparedStatement requete=null;
    static ResultSet rs=null;
    
     public static Lot getLotByIdCheval(Connection connection, String idCheval, String idVente){      
        
        Lot unLot = null;
        try
        {
              unLot = new Lot();
            requete=connection.prepareStatement("SELECT * from lot where lot.id_cheval = ? and lot.id_vente = ?");
            requete.setInt(1, Integer.parseInt(idCheval));
            requete.setInt(2, Integer.parseInt(idVente));
            
            System.out.println("requeteLot:" + requete);
            rs=requete.executeQuery();
             
                while ( rs.next() ) {
                System.out.println("Lot =================: " + unLot.getId());
                unLot.setId(rs.getInt("id"));
                unLot.setPrixDepart(rs.getInt("prixDepart"));

                }
        }   
        catch (SQLException e) 
        {
            e.printStackTrace();
        }
        return unLot;  
    }
     
     public static Enchere encherirSurUnLot(Connection connection, Enchere uneEnchere){      
        int idGenere = -1;
        try
        {
            //preparation de la requete
            // id (clé primaire de la table client) est en auto_increment,donc on ne renseigne pas cette valeur
            // la paramètre RETURN_GENERATED_KEYS est ajouté à la requête afin de pouvoir récupérer l'id généré par la bdd (voir ci-dessous)
            // supprimer ce paramètre en cas de requête sans auto_increment.
            requete=connection.prepareStatement("insert into enchere (montant, id_lot)\n" +
                    "VALUES (?,?)", requete.RETURN_GENERATED_KEYS );
            requete.setInt(1, uneEnchere.getMontant());
            requete.setInt(2, uneEnchere.getLot().getId());

           /* Exécution de la requête */
            requete.executeUpdate();
            
             // Récupération de id auto-généré par la bdd dans la table client
            rs = requete.getGeneratedKeys();
            while ( rs.next() ) {
                idGenere = rs.getInt( 1 );
                uneEnchere.setId(idGenere);
            }
            
        }   
        catch (SQLException e) 
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return uneEnchere ;    
    }
}
