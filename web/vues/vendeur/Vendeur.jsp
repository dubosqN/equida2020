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
                        <a class="nav-link" href="/EquidaWeb20/vendeur/Accueil">Accueil <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/EquidaWeb20/vendeur/ajouterCheval">Ajouter un cheval</a>
                    </li>
                </ul>
                <a href="<%=request.getContextPath()%>/vendeur/profil?idUtilisateur=<% out.println(session.getAttribute("id_user")); %>" class="text-info px-3 text-decoration-none">Profil</a>
                <a href="<%=request.getContextPath()%>/_deconnexion" class="text-danger px-3 text-decoration-none" type="submit">Se deconnecter</a>
            </div>
        </nav>
        <!-- FIN DE LA NAVBAR -->
            
        
        <div class="jumbotron jumbotron-fluid">
            <div class="container">
                <h1 class="display-4"><% out.println("Bienvenue, " + session.getAttribute("vendeur") + "."); %></h1>
                <span class="font-weight-light">Lors de votre première connexion n'oubliez pas de renseigner vos informations dans l'onglet profil.</span>
            </div>
        </div> 
        <% //ArrayList<CategVente> lesCategVentes = (ArrayList)request.getAttribute("pLesCategVente"); %>
        <div class="container">
            <h1 class="text-center">Liste de vos chevaux</h1>
                
            <div class="row row-cols-1 row-cols-md-2">
                <% 
%>
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