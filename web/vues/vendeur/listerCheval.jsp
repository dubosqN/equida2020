<%-- 
    Document   : listerCheval
    Created on : 12 nov. 2020, 14:49:43
    Author     : sio2
--%>

<%@page import="modele.Cheval"%>
<%@page import="java.util.ArrayList"%>
<!doctype html>
<html lang="fr">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
            
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
            
        <title>Equida - Accueil</title>
    </head>
    <body>
        
        
        <!-- NAVBAR -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            
            <a class="navbar-brand" href="#">
                <img src="../vues/Images/black-head-horse-side-view-with-horsehair.png" width="30" height="30" class="d-inline-block align-top"  alt="" loading="lazy">
                Master
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
                
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="/MASTER/vendeur/Accueil">Accueil <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/MASTER/vendeur/ajouterCheval">Ajouter un cheval</a>
                    </li>
                </ul>
                <a href="<%=request.getContextPath()%>/vendeur/profil?idUtilisateur=<% out.println(session.getAttribute("id_user")); %>" class="text-info px-3 text-decoration-none">Profil</a>
                <a href="<%=request.getContextPath()%>/_deconnexion" class="text-danger px-3 text-decoration-none" type="submit">Se deconnecter</a>
            </div>
        </nav>
        <!-- FIN DE LA NAVBAR -->
                <%
            
            ArrayList<Cheval> lesChevaux = (ArrayList)request.getAttribute("pLesChevaux");
        %>
        <div class="container">
            <h1 class="text-center p-3">Liste de vos chevaux</h1>
        <table class="table table-hover table-striped shadow-lg p-3 mb-5 bg-white rounded">
            <thead>
              <tr>
            
                    <th class="align-middle">ID</th>
                    <th class="align-middle">NOM</th>
                    <th class="align-middle">SEXE</th>
                    <th class="align-middle">PRIX DEPART</th>
                    <th class="align-middle">SIRE</th>
                    <th class="align-middle">IMG</th>
                    <th class="align-middle">TYPE CHEVAL</th>
                    <th class="align-middle">MERE</th>
                    <th class="align-middle">PERE</th>
                    <th class="align-middle">STATUS</th>
              
              </tr>
            </thead>

            <tbody>
                <tr>
                    <%
                        
                    for(int i = 0; i < lesChevaux.size();i++)
                    {
                        
                        Cheval unCheval = lesChevaux.get(i); 
                        out.println("<tr>");
                        out.println("<th scope='row' class='align-middle'>");
                        out.println(unCheval.getId());
                        out.println("</th>");
                        
                        out.println("<td class='align-middle'> ");
                        out.println(unCheval.getNom());
                        out.println("</td class='align-middle'>");
                        
                        out.println("<td class='align-middle'> ");
                        out.println(unCheval.getSexe());
                        out.println("</td>");
                        
                        out.println("<td class='align-middle'> ");
                        out.println(unCheval.getPrixDepart());
                        out.println("</td>");
                        
                        out.println("<td class='align-middle'> ");
                        out.println(unCheval.getSIRE());
                        out.println("</td>");
                        
                        out.println("<td class='align-middle'> ");
                        out.println("<img src='../vues/Images/"+ unCheval.getImg_url() +"' width='100' height='100'>");
                        out.println("</td>");

                        out.println("<td class='align-middle'> ");
                        out.println(unCheval.getLeTypeDeCheval().getLibelle());
                        out.println("</td>");
                        
                        out.println("<td class='align-middle'> ");
                        out.println(unCheval.getMere().getNom());
                        out.println("</td class='align-middle'>");
                        
                        out.println("<td class='align-middle'> ");
                        out.println(unCheval.getPere().getNom());
                        out.println("</td class='align-middle'>");
  
                         int isActive = unCheval.getIsActive();
                            if(isActive == 0){
                                out.println("<td class='align-middle'> ");
                                out.println("<div class='text-danger'> Cheval non approuvé. </div>");
                                out.println("</td class='align-middle'>");
                            }
                            else{
                                out.println("<td class='align-middle'> ");
                                out.println("<div class='text-success'> Cheval approuvé. </div>");
                                out.println("</td class='align-middle'>");
                            }
                               
                    }
                    %>
                </tr>

            </tbody>

        </table>
                                                                        <%
                        if(lesChevaux.size() < 1){
                out.println("<h1 class='text-center'>Vous n'avez pas encore de chevaux.</h1>");
            
            }
            %>
       </div>
    </body>
</html>
