<%-- 
    Document   : ajouterCheval
    Created on : 12 nov. 2020, 4:52:19
    Author     : noedu
--%>
    
<%@page import="modele.Cheval"%>
<%@page import="modele.TypeCheval"%>
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
                    <li>
                        <a class="nav-link" href="/MASTER/vendeur/listerCheval?idClient=<%out.println(session.getAttribute("id_client"));%>">Lister vos chevaux</a>
                    </li>
                </ul>
                <a href="<%=request.getContextPath()%>/vendeur/profil?idUtilisateur=<% out.println(session.getAttribute("id_user")); %>" class="text-info px-3 text-decoration-none">Profil</a>
                <a href="<%=request.getContextPath()%>/_deconnexion" class="text-danger px-3 text-decoration-none" type="submit">Se deconnecter</a>
            </div>
        </nav>
        <!-- FIN DE LA NAVBAR -->
            
        <% //Client unClient = (Client) request.getAttribute("pClient"); %>
        <div class="container mt-3">      
            <div class="card">
                <div class="card-header">
                    Effectuer une demande d'ajout pour un cheval
                    
                </div>
                <div class="card-body">
                    <form class="needs-validation" novalidate action="<%=request.getContextPath()%>/vendeur/demandeCheval" method="POST">
                        <input type="hidden" class="form-control" id="client" name="client" value="<%out.println(session.getAttribute("id_client"));%>" required>
                        <div class="form-row">
                            <div class="col-md-6 mb-3">
                                <input id="id" name="id" type="hidden" value="<% out.println(); %>">
                                <label for="validationCustom01">Nom</label>
                                <input type="text" class="form-control" id="nom" name="nom" value="<% out.println(); %>" minlength="2" maxlength="50" required>
                                <div class="invalid-feedback">Saisissez un nom valide</div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="validationCustom02">Prix de départ souhaité</label>
                                <input type="text" class="form-control" id="prixDepart" name="prixDepart" value="<% out.println(); %>" minlength="2" maxlength="50" required>
                                <div class="invalid-feedback">Saisissez un prénom valide</div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-md-3 mb-3">
                                <label for="validationCustom03">Sexe</label>
                                <select class="custom-select" id="sexe" name="sexe" value="" required>
                                    <option selected disabled value="">Selectionner...</option>
                                    <option value="M">Mâle</option>
                                    <option value="F">Femelle</option>
                                </select>
                                <div class="invalid-feedback">Saisissez un sexe valide</div>
                            </div>
                            <div class="col-md-3 mb-3">
                                <label for="validationCustom04">Race</label>
                                <select class="custom-select" id="typeCheval" name="typeCheval" value="" required>
                                    <option selected disabled value="">Selectionner...</option>
                                    <%
                                        ArrayList<TypeCheval> lesTypesDeChevaux = (ArrayList)request.getAttribute("pLesTypesDeChevaux");
                                        
                                        for (int i=0; i<lesTypesDeChevaux.size();i++){
                                            TypeCheval tc = lesTypesDeChevaux.get(i);
                                            out.println("<option value ='" + tc.getId() + "'>" + tc.getLibelle() + "</option>"); 

                                        }
                                    %>
                              
                                </select>
                                <div class="invalid-feedback">Saisissez un pays valide</div>
                            </div>
                            <div class="col-md-3 mb-3">
                                <label for="validationCustom05">SIRE</label>
                                <input type="text" class="form-control" id="sire" name="sire" value="<% out.println(); %>" minlength="2" maxlength="5" required>
                                <div class="invalid-feedback">Saisissez un code postal valide</div>
                            </div>
                            <div class="col-md-3 mb-3">
                                <label for="validationCustom05">Entraineur</label>
                                <select class="custom-select" id="pays" name="" value="" required>
                                    <option selected disabled value="">Selectionner...</option>
                                    <option value="null">Pas d'entraineur</option>
                              
                                </select>
                                <div class="invalid-feedback">Saisissez un entraineur valide</div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-md-4 mb-3">
                                <label for="validationCustom01">Père</label>
                                <select class="custom-select" id="pere" name="pere" value="" required>
                                    <option selected disabled value="">Selectionner...</option>
                                    <option value="5">Pas de parents connus</option>
                                    <%
                                        ArrayList<Cheval> lesChevauxPere = (ArrayList)request.getAttribute("pLesChevauxPere");
                                        for (int i=0; i< lesChevauxPere.size();i++){
                                            Cheval che = lesChevauxPere.get(i);
                                            out.println("<option value ='" + che.getId() + "'>" + che.getNom() + "</option>"); 

                                        }
                                    %>
                                </select>
                                <div class="invalid-feedback">Saisissez un parent valide</div>
                            </div>
                            <div class="col-md-4 mb-3">
                                <label for="validationCustom02">Mère</label>
                                <select class="custom-select" id="mere" name="mere" value="" required>
                                    <option selected disabled value="">Selectionner...</option>
                                    <option value="5">Pas de parents connus</option>
                                    <%
                                        ArrayList<Cheval> lesChevauxMere = (ArrayList)request.getAttribute("pLesChevauxMere");
                                        for (int i=0; i< lesChevauxMere.size();i++){
                                            Cheval che = lesChevauxMere.get(i);
                                            out.println("<option value ='" + che.getId() + "'>" + che.getNom() + "</option>"); 

                                        }
                                    %>
                                </select>
                                <div class="invalid-feedback">Saisissez une parent valide</div>
                            </div>
                            <div class="col-md-4 mb-3">
                                <label for="validationCustom02">Image</label>
                                <input type="text" class="form-control" id="img_url" name="img_url" value="null" minlength="2" maxlength="50" required>
                                <div class="invalid-feedback">Saisissez une image valide (saisissez null si pas d'image)</div>
                            </div>
                        </div>
                        <button class="btn btn-success" type="submit">Valider</button>
                </div>
            </div>     
        </div>
               
    </form>
                      
    <script>
        // Example starter JavaScript for disabling form submissions if there are invalid fields
        /*
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
        })(); */
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