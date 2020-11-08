/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import static database.VenteDAO.requete;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import modele.Cheval;
import modele.Client;
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
            requete=connection.prepareStatement("SELECT cheval.*, typecheval.libelle as Race, chevalPere.nom as pere, chevalMere.nom as mere, client.nom as nomVendeur FROM client, cheval, typecheval, cheval chevalPere, cheval chevalMere WHERE cheval.id_typeCheval = typecheval.id AND cheval.id_pere = chevalPere.id AND cheval.id_mere = chevalMere.id AND cheval.id_client = client.id AND cheval.id = ?");
            requete.setInt(1, Integer.parseInt(idCheval));
            requete.setInt(2, Integer.parseInt(idVente));
            
            System.out.println("requete" + requete);
            rs=requete.executeQuery();
             
                while ( rs.next() ) {
                //System.out.println("Cheval/1: " + unCheval.getId());
                
                Cheval unCheval = new Cheval();
                unCheval.setId(rs.getInt("id"));
                unCheval.setNom(rs.getString("nom"));
                unCheval.setSexe(rs.getString("sexe"));
                unCheval.setImg_url(rs.getString("img_url"));
               
                Cheval unChevalPere = new Cheval();
                unChevalPere.setNom(rs.getString("pere"));
                
                Cheval unChevalMere = new Cheval();
                unChevalMere.setNom(rs.getString("mere"));
                
                
                Client unClient = new Client();
                unClient.setNom(rs.getString("nomVendeur"));
                
                TypeCheval unTypeCheval = new TypeCheval();
                unTypeCheval.setLibelle(rs.getString("Race"));
                
                
                unCheval.setLeTypeDeCheval(unTypeCheval);
                unCheval.setUnClient(unClient);
                
                unCheval.setPere(unChevalPere);
                unCheval.setMere(unChevalMere);
                
                
                }
        }   
        catch (SQLException e) 
        {
            e.printStackTrace();
        }
        return unLot;
        
    }
}
