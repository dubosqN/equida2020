<%-- 
    Document   : ClientAjouter
    Created on : 22/06, 16:35:27
    Author     : Zakina
--%>

<%@page import="modele.CategVente"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modele.Pays"%>
<%@page import="formulaires.ClientForm"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <title>Client Ajouter</title>
    </head>
    <body>
        
         <%
                //Client client=(Client)request.getAttribute("client");
                ClientForm form = (ClientForm)request.getAttribute("form");
            %>
        <div class="container-lg">
            <h1 class="display-3">NOUVEAU CLIENT</h1>
        <form action="ajouterClient" method="POST">
            <div class="form-group">
                <label for="nom">Nom : </label>
                <input class="form-control" id="nom" type="text" name="nom"  size="30" maxlength="30" >
            </div>
                
            <div class="form-group">
                <label for="prenom">Prénom : </label>
                <input class="form-control" id="prenom"  type="text"  name="prenom" size="30" maxlength="30">      
            </div>
              
            <div class="form-group">
                <label for="rue">Rue : </label>
                <input class="form-control" id="rue"  type="text"  name="rue" size="30" maxlength="50">
            </div>
                               
            <div class="form-group">
                <label for="copos">Code postal : </label>
                <input class="form-control" id="copos"  type="text"  name="copos" size="5" maxlength="5">
            </div>
                
            <div class="form-group">    
                <label for="ville">Ville : </label>
                <input class="form-control" id="ville"  type="text"  name="ville" size="40" maxlength="40">
            </div>
                
            <div class="form-group">    
                <label for="mail">Mail : </label>
                <input class="form-control" id="mail"  type="text"  name="mail" size="60" maxlength="60">
            </div>
                
            <div class="form-group">    
                <%-- Champ Liste des pays --%>
                <label for="pays">Pays : </label>
                <select class="form-control" id="codePays" name ="pays">
                    <%
                        ArrayList<Pays> lesPays = (ArrayList)request.getAttribute("pLesPays");
                        for (int i=0; i<lesPays.size();i++){
                            Pays p = lesPays.get(i);
                            out.println("<option value='" + p.getCode()+"'>" + p.getNom()+"</option>" );
                        } 
                    %>
                </select>
            </div>          
                
            <div class="form-group">
                <label for="categVente">Catégorie Vente : </label>
                <select class="form-control" name="categVente">
                <%
                        ArrayList<CategVente> lesCategVente = (ArrayList)request.getAttribute("pLesCategVente");
                        for (int i=0; i<lesCategVente.size();i++){
                            CategVente cv = lesCategVente.get(i);
                            out.println("<option value ='" + cv.getCode() + "'>" + cv.getLibelle() + "</option>"); 
                           
                        }
                    %>
                </select>
            </div>     
                
                
                <%-- Cases à cocher permettant de choisir les différentes catégories de vente auxquelles le client souhaite s'inscrire 
                <label for="categVente">Categories de vente : </label></br>
                 <%
                        ArrayList<CategVente> lesCategVente = (ArrayList)request.getAttribute("pLesCategVente");
                        for (int i=0; i<lesCategVente.size();i++){
                            CategVente cv = lesCategVente.get(i);
                            out.println("<input type='checkbox' id='cb" + i + "' name='" + cv.getCode() + "'>"); 
                            out.println(cv.getLibelle()); 
                            out.println("</label></br>");
                        }
                    %>
                    </br>
                    --%>
                 
                
                    <button class="btn btn-outline-success" type="submit" name="valider" id="valider" value="Valider">Valider</button> 
            </form>
        </div>
        
    </body>
</html>
