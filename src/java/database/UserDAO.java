/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import modele.Utilisateur;

/**
 *
 * @author sio2
 */
public class UserDAO {

    Connection connection=null;
    static PreparedStatement requete=null;
    static ResultSet rs=null;
    
    public static boolean login(Connection connection, String username, String password){

        
        return true;
    }
}
