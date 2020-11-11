/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import modele.Utilisateur;

/**
 *
 * @author sio2
 */
public class UserDAO {

    Connection connection=null;
    static PreparedStatement requete=null;
    static ResultSet rs=null;
    public static int id_client;
    
    public String[] authentification(Connection connection, Utilisateur unUtilisateur){
        String username = unUtilisateur.getUsername();
        String password = unUtilisateur.getPassword();
        
        String usernameDB = "";
        String passwordDB = "";
        String roleDB = "";
        String idDB;
        String[] resultat = new String[2];
        
        try {
            requete = connection.prepareStatement("SELECT utilisateur.id, utilisateur.username, utilisateur.password, role.libelle as role from utilisateur, role where utilisateur.id_role = role.id");
            rs = requete.executeQuery();
            
            while (rs.next()) {
                usernameDB = rs.getString("username");
                passwordDB = rs.getString("password");
                roleDB = rs.getString("role");
                idDB = String.valueOf(rs.getInt("id"));

                if (username.equals(usernameDB) && password.equals(passwordDB) && roleDB.equals("admin")) {
                    resultat[0] = "admin";
                    resultat[1] = idDB;
                    return resultat;
                } else if (username.equals(usernameDB) && password.equals(passwordDB) && roleDB.equals("employee")) {
                    resultat[0] = "employee";
                    resultat[1] = idDB;
                    return resultat;
                } else if (username.equals(usernameDB) && password.equals(passwordDB) && roleDB.equals("acheteur")) {
                    resultat[0] = "acheteur";
                    resultat[1] = idDB;
                    return resultat;
                } else if (username.equals(usernameDB) && password.equals(passwordDB) && roleDB.equals("vendeur")) {
                    resultat[0] = "vendeur";
                    resultat[1] = idDB;
                    return resultat;
                }
            }
          
        } catch (Exception e) {
            e.printStackTrace();
        }
        resultat[0] = "Erreur d'authentitfication";
        return resultat;
    }
    
    public static Utilisateur ajouterUtilisateur(Connection connection, Utilisateur unUtilisateur){      
        int idGenere = -1;
        try
        {
            
            requete=connection.prepareStatement("INSERT INTO client ()\n" +
                    "VALUES ()", requete.RETURN_GENERATED_KEYS );
            
            requete.executeUpdate();
            System.out.println("query:" + requete);
            rs = requete.getGeneratedKeys();
            while ( rs.next() ) {
                idGenere = rs.getInt(1);
                id_client = rs.getInt(1);
                unUtilisateur.setId(idGenere);
            }
            
            requete=connection.prepareStatement("INSERT INTO utilisateur (username, email, password, id_role, id_client)\n" +
                    "VALUES (?,?,?,?,?)", requete.RETURN_GENERATED_KEYS );
            requete.setString(1, unUtilisateur.getUsername());
            requete.setString(2, unUtilisateur.getEmail());
            requete.setString(3, unUtilisateur.getPassword());
            requete.setInt(4, unUtilisateur.getRole().getId());
            requete.setInt(5, id_client);

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
