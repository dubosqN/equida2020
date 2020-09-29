<%-- 
    Document   : consulterClient
    Created on : 23 juin 2017, 10:33:23
    Author     : Zakina
--%>

<%@page import="modele.Client"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <title>Consultation CLient</title>
    </head>
    <body>
        <h1>Infos clients</h1>
        
         <%
        Client unClient = (Client)request.getAttribute("pClient");
        %>
        
        
         <table class="table table-bordered table-striped table-condensed">
            <tr><td>NOM :</td><td><% out.println(unClient.getNom());%></td></tr>
            <tr><td>PRENOM :</td><td><%  out.println(unClient.getPrenom());%></td>  </tr>
            <tr><td>ADRESSE  :</td><td><%  out.println(unClient.getRue());%></td>  </tr>
            <tr><td> CODE POSTAL  :</td><td><%  out.println(unClient.getCopos());%></td>  </tr>
            <tr><td> VILLE  :</td><td><%  out.println(unClient.getVille());%></td>  </tr>
            <tr><td> PAYS  :</td><td><%  out.println(unClient.getUnPays().getCode());%></td>  </tr>
            <tr><td> Catégories selectionnées : </td><td>
          <% for (int i=0; i<unClient.getLesCategVentes().size(); i++){
               out.println(unClient.getLesCategVentes().get(i).getCode() + "</br>");
             
          }
          %>
              </td></tr>
        </table>
        
              <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    </body>
</html>
