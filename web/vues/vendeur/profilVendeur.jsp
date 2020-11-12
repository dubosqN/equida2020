<%-- 
    Document   : profilVendeur
    Created on : 11 nov. 2020, 17:19:03
    Author     : noedu
--%>

<%@page import="modele.Client"%>
<%@page import="modele.Pays"%>
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
                </ul>
                <a href="#" class="text-info px-3 text-decoration-none">Profil</a>
                <a href="<%=request.getContextPath()%>/_deconnexion" class="text-danger px-3 text-decoration-none" type="submit">Se deconnecter</a>
            </div>
        </nav>
        <!-- FIN DE LA NAVBAR -->

         <% Client unClient = (Client) request.getAttribute("pClient"); %>
        <div class="container mt-3">      
           <div class="card">
            <div class="card-header">
              Editer vos informations
            </div>
            <div class="card-body">
                <form class="needs-validation" novalidate action="<%=request.getContextPath()%>/vendeur/updateProfil" method="POST">
                    <div class="form-row">
                      <div class="col-md-6 mb-3">
                          <input id="id" name="id" type="hidden" value="<% out.println(unClient.getId()); %>">
                        <label for="validationCustom01">Nom</label>
                        <input type="text" class="form-control" id="nom" name="nom" value="<% out.println(unClient.getNom()); %>" minlength="2" maxlength="50" required>
                        <div class="invalid-feedback">Saisissez un nom valide</div>
                      </div>
                      <div class="col-md-6 mb-3">
                        <label for="validationCustom02">Prénom</label>
                        <input type="text" class="form-control" id="prenom" name="prenom" value="<% out.println(unClient.getPrenom()); %>" minlength="2" maxlength="50" required>
                        <div class="invalid-feedback">Saisissez un prénom valide</div>
                      </div>
                    </div>
                    <div class="form-row">
                      <div class="col-md-6 mb-3">
                        <label for="validationCustom03">Rue</label>
                        <input type="text" class="form-control" id="rue" name="rue" value="<% out.println(unClient.getRue()); %>" minlength="2" maxlength="50" required>
                        <div class="invalid-feedback">Saisissez une ville valide</div>
                      </div>
                      <div class="col-md-3 mb-3">
                        <label for="validationCustom04">Pays</label>
                        <select class="custom-select" id="pays" name="pays" value="" required>
                          <option selected disabled value="">Selectionner...</option>
                            <%
                          ArrayList<Pays> lesPays = (ArrayList)request.getAttribute("pLesPays");
                          for (int i=0; i<lesPays.size();i++){
                              Pays p = lesPays.get(i);
                              out.println("<option value='" + p.getCode()+"'>" + p.getNom()+"</option>" );
                          } 
                          %>
                        </select>
                        <div class="invalid-feedback">Saisissez un pays valide</div>
                      </div>
                      <div class="col-md-3 mb-3">
                        <label for="validationCustom05">Code Postal</label>
                        <input type="text" class="form-control" id="copos" name="copos" value="<% out.println(unClient.getCopos()); %>" minlength="2" maxlength="5" required>
                        <div class="invalid-feedback">Saisissez un code postal valide</div>
                      </div>
                    </div>
                    <div class="form-row">
                      <div class="col-md-6 mb-3">
                        <label for="validationCustom01">Adresse mail</label>
                        <input type="email" class="form-control" id="mail" name="mail" value="<% out.println(unClient.getMail()); %>" minlength="2" maxlength="50" required>
                        <div class="invalid-feedback">Saisissez une adresse mail valide</div>
                      </div>
                      <div class="col-md-6 mb-3">
                        <label for="validationCustom02">Ville</label>
                        <input type="text" class="form-control" id="ville" name="ville" value="<% out.println(unClient.getVille()); %>" minlength="2" maxlength="50" required>
                        <div class="invalid-feedback">Saisissez une ville valide</div>
                      </div>
                    </div>
                    <button class="btn btn-success" type="submit">Valider</button>
                  </form>

                  <script>
                  // Example starter JavaScript for disabling form submissions if there are invalid fields
                  (function() {
                    'use strict';
                    window.addEventListener('load', function() {
                      // Fetch all the forms we want to apply custom Bootstrap validation styles to
                      var forms = document.getElementsByClassName('needs-validation');
                      const nom = document.getElementById('nom');
                      // Loop over them and prevent submission
                      var validation = Array.prototype.filter.call(forms, function(form) {
                        form.addEventListener('submit', function(event) {

                          if (form.checkValidity() === false) {
                            event.preventDefault();
                            event.stopPropagation();
                          }
                          form.classList.add('was-validated');
                        }, false);
                      });
                    }, false);
                  })();
                  </script>
            </div>
          </div>
        </div>
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>

    </body>
    
    <div class="container p-5">
        <hr class="featurette-divider p-5">
        <footer>
            <p class="float-right">
                Pablo, Melvyn, Noé.
            </p>
            <p>
                2020 SIO2, Lycée Jean Rostand ·
                <a href="">Lycée</a>  · 
            </p>
        </footer>
    </div>
</html>