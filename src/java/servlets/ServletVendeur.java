/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import database.CategVenteDAO;
import database.ChevalDAO;
import database.ClientDAO;
import database.LotDAO;
import database.PaysDAO;
import database.TypeDeChevalDAO;
import formulaires.ChevalForm;
import formulaires.ClientForm;
import formulaires.EnchereForm;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.ArrayList;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modele.CategVente;
import modele.Cheval;
import modele.Client;
import modele.Enchere;
import modele.Pays;
import modele.TypeCheval;

/**
 *
 * @author sio2
 */
public class ServletVendeur extends HttpServlet {
    
    Connection connection;
    
    @Override
    public void init() {
        ServletContext servletContext = getServletContext();
        connection = (Connection) servletContext.getAttribute("connection");
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServletVendeur</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletVendeur at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String url = request.getRequestURI();
        if (url.equals(request.getContextPath() + "/vendeur/Accueil")) {
            ArrayList<Cheval> lesChevaux = ChevalDAO.getLesChevaux(connection);
            request.setAttribute("pLesChevaux", lesChevaux);   
            
            this.getServletContext().getRequestDispatcher("/vues/vendeur/Vendeur.jsp").forward(request, response);
        }
        
        if (url.equals(request.getContextPath() + "/vendeur/profil")) {
            ArrayList<Pays> lesPays = PaysDAO.getLesPays(connection);
            request.setAttribute("pLesPays", lesPays);
            
            String id_user = request.getParameter("idUtilisateur");
            Client unClient = ClientDAO.getClientById(connection, id_user);
            request.setAttribute("pClient", unClient);
            
            ArrayList<CategVente> lesCategVentes = CategVenteDAO.getLesCategVentes(connection);
            request.setAttribute("pLesCategVente", lesCategVentes);
            this.getServletContext().getRequestDispatcher("/vues/vendeur/profilVendeur.jsp").forward(request, response);
        }
        
        if (url.equals(request.getContextPath() + "/vendeur/ajouterCheval")) {
            ArrayList<Cheval> lesChevaux = ChevalDAO.getLesChevaux(connection);
            request.setAttribute("pLesChevaux", lesChevaux);
            
            ArrayList<TypeCheval> lesTypeDeChevaux = TypeDeChevalDAO.getLesTypeDeChevaux(connection);
            request.setAttribute("pLesTypesDeChevaux", lesTypeDeChevaux);
            
            ArrayList<Client> lesClients = ClientDAO.getLesClients(connection);
            request.setAttribute("pLesClients", lesClients);
            
            ArrayList<Cheval> lesChevauxMere = ChevalDAO.getLesChevaux(connection);
            request.setAttribute("pLesChevauxMere", lesChevauxMere);
            
            ArrayList<Cheval> lesChevauxPere = ChevalDAO.getLesChevaux(connection);
            request.setAttribute("pLesChevauxPere", lesChevauxPere);
            
            this.getServletContext().getRequestDispatcher("/vues/vendeur/ajouterCheval.jsp").forward(request, response);
        }   
        
        if (url.equals(request.getContextPath() + "/vendeur/listerCheval")) {
            String id_client = request.getParameter("idClient");
            
            ArrayList<Cheval> lesChevaux = ChevalDAO.getLesChevauxByClient(connection, id_client);
            request.setAttribute("pLesChevaux", lesChevaux);
           
            
            this.getServletContext().getRequestDispatcher("/vues/vendeur/listerCheval.jsp").forward(request, response);
        }  
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = request.getRequestURI();
        
        if (url.equals(request.getContextPath() + "/vendeur/updateProfil")) {
            ClientForm form = new ClientForm();
            Client unClient = form.updateClient(request);

            /* Stockage du formulaire et de l'objet dans l'objet request */
            request.setAttribute("form", form);
            request.setAttribute("pClient", unClient);

            if (form.getErreurs().isEmpty()){
                ClientDAO.updateClient(connection, unClient);
                getServletContext().getRequestDispatcher("/vues/vendeur/updateProfilRecap.jsp" ).forward(request, response);
            }
        }
        
        if (url.equals(request.getContextPath() + "/vendeur/demandeCheval")) {
            ChevalForm unChevalForm = new ChevalForm();
            Cheval unCheval = unChevalForm.ajouterCheval(request);
            request.setAttribute("pCheval", unCheval);

             if (unChevalForm.getErreurs().isEmpty()){
                ChevalDAO.ajouterCheval(connection, unCheval);
                getServletContext().getRequestDispatcher("/vues/vendeur/updateProfilRecap.jsp" ).forward(request, response);
            }
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
