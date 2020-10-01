<%-- 
    Document   : Lister les Chevaux 
    Created on : 22/06/2017, 07:43
    Author     : DUBOSQ
--%>

<%@page import="modele.Cheval"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modele.Vente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        

        
        <title>LISTE DES CHEVAUX</title>
    </head>
    <body>
        
    <div class="container-lg">
        <h1>LISTE DES CHEVAUX</h1>
         <%
        ArrayList<Cheval> lesChevaux = (ArrayList)request.getAttribute("pLesChevaux");
        %>
        <table class="table table-hover table-striped shadow-lg p-3 mb-5 bg-white rounded">
            <thead>
              <tr>
                    <th>ID</th>
                    <th>NOM</th>
                    <th>SEXE</th>
                    <th>PRIX DEPART</th>
                    <th>SIRE</th>
                    <th>CLIENT</th>  
                    <th>TYPE CHEVAL</th>
                    <th>MERE</th>
                    <th>PERE</th>
                    
                    <th>Modifier</th>
                    <th>Supprimer</th>
              </tr>
            </thead>
            <tbody>
                <tr>
                    <%
                    for(int i = 0; i < lesChevaux.size();i++)
                    {
                        
                        Cheval unCheval = lesChevaux.get(i); 
                        out.println("<tr>");
                        out.println("<th scope='row'>");
                        out.println(unCheval.getId());
                        out.println("</th>");
                        
                        out.println("<td> ");
                        out.println(unCheval.getNom());
                        out.println("</td>");
                        
                        out.println("<td> ");
                        out.println(unCheval.getSexe());
                        out.println("</td>");
                        
                        out.println("<td> ");
                        out.println(unCheval.getPrixDepart());
                        out.println("</td>");
                        
                        out.println("<td> ");
                        out.println(unCheval.getSIRE());
                        out.println("</td>");
                        
                        out.println("<td> ");
                        out.println(unCheval.getUnClient().getNom());
                        out.println("</td>");
                        
                        out.println("<td> ");
                        out.println(unCheval.getLeTypeDeCheval().getLibelle());
                        out.println("</td>");
                        
                        out.println("<td> ");
                        out.println(unCheval.getMere().getNom());
                        out.println("</td>");
                        
                        out.println("<td> ");
                        out.println(unCheval.getPere().getNom());
                        out.println("</td>");
                        
                        out.println("<td><a href ='../ServletVentes/listerLesCourriels?idVente="+ unCheval.getId()+"'>");
                        out.println("<i class='fas fa-edit'></i>");
                        out.println("</td>");
                        
                        out.println("<td><a href ='../ServletVentes/listerLesChevaux?idVente="+ unCheval.getId()+"'>");
                        out.println("<i class='fas fa-trash-alt'></i>");
                        out.println("</td>");
                        
                               
                    }
                    %>
                </tr>
            </tbody>
        </table>

    </div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/015f2278b9.js" crossorigin="anonymous"></script>
    </body>
</html>
