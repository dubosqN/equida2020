/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import static database.ChevalDAO.rs;
import static database.ClientDAO.requete;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import modele.Client;
import modele.Utilisateur;

/**
 *
 * @author sio2
 */
public class UserDAO {

    Connection connection=null;
    static PreparedStatement requete=null;
    static ResultSet rs=null;
    
    public Utilisateur getUtilisateur(Connection connection, String username, String password){
        Utilisateur unUtilisateur = new Utilisateur();
        
        try {
            requete=connection.prepareStatement("select * from utilisateur where username = ? and password = ?");
            requete.setString(1, username);
            requete.setString(2, username);
            rs=requete.executeQuery();
            
            while (rs.next()) {
                unUtilisateur.setUsername(rs.getString(username));
                unUtilisateur.setPassword(rs.getString(password));
                
            }
            
            
        } catch (Exception e) {
        }
        return unUtilisateur;
    }
    
    public static Utilisateur ajouterUtilisateur(Connection connection, Utilisateur unUtilisateur){      
        int idGenere = -1;
        try
        {
            requete=connection.prepareStatement("INSERT INTO utilisateur (username, email, password, id_role)\n" +
                    "VALUES (?,?,?,?)", requete.RETURN_GENERATED_KEYS );
            requete.setString(1, unUtilisateur.getUsername());
            requete.setString(2, unUtilisateur.getEmail());
            requete.setString(3, unUtilisateur.getPassword());
            requete.setInt(4, unUtilisateur.getRole().getId());

            requete.executeUpdate();
            System.out.println("query:" + requete);
            rs = requete.getGeneratedKeys();
            while ( rs.next() ) {
                idGenere = rs.getInt( 1 );
                unUtilisateur.setId(idGenere);
            }
            
        }   
        catch (SQLException e) 
        {
            e.printStackTrace();
        }
        return unUtilisateur ;    
    }
}
