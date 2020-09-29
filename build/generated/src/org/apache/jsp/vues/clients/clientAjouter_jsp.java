package org.apache.jsp.vues.clients;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import modele.CategVente;
import java.util.ArrayList;
import modele.Pays;
import formulaires.ClientForm;

public final class clientAjouter_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\r\n");
      out.write("\r\n");
      out.write("        <!-- Bootstrap CSS -->\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css\" integrity=\"sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z\" crossorigin=\"anonymous\">\r\n");
      out.write("        <title>Client Ajouter</title>\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        \r\n");
      out.write("         ");

                //Client client=(Client)request.getAttribute("client");
                ClientForm form = (ClientForm)request.getAttribute("form");
            
      out.write("\r\n");
      out.write("        <div class=\"container-lg\">\r\n");
      out.write("            <h1 class=\"display-3\">NOUVEAU CLIENT</h1>\r\n");
      out.write("        <form action=\"ajouterClient\" method=\"POST\">\r\n");
      out.write("            <div class=\"form-group\">\r\n");
      out.write("                <label for=\"nom\">Nom : </label>\r\n");
      out.write("                <input class=\"form-control\" id=\"nom\" type=\"text\" name=\"nom\"  size=\"30\" maxlength=\"30\" >\r\n");
      out.write("            </div>\r\n");
      out.write("                \r\n");
      out.write("            <div class=\"form-group\">\r\n");
      out.write("                <label for=\"prenom\">Prénom : </label>\r\n");
      out.write("                <input class=\"form-control\" id=\"prenom\"  type=\"text\"  name=\"prenom\" size=\"30\" maxlength=\"30\">      \r\n");
      out.write("            </div>\r\n");
      out.write("              \r\n");
      out.write("            <div class=\"form-group\">\r\n");
      out.write("                <label for=\"rue\">Rue : </label>\r\n");
      out.write("                <input class=\"form-control\" id=\"rue\"  type=\"text\"  name=\"rue\" size=\"30\" maxlength=\"50\">\r\n");
      out.write("            </div>\r\n");
      out.write("                               \r\n");
      out.write("            <div class=\"form-group\">\r\n");
      out.write("                <label for=\"copos\">Code postal : </label>\r\n");
      out.write("                <input class=\"form-control\" id=\"copos\"  type=\"text\"  name=\"copos\" size=\"5\" maxlength=\"5\">\r\n");
      out.write("            </div>\r\n");
      out.write("                \r\n");
      out.write("            <div class=\"form-group\">    \r\n");
      out.write("                <label for=\"ville\">Ville : </label>\r\n");
      out.write("                <input class=\"form-control\" id=\"ville\"  type=\"text\"  name=\"ville\" size=\"40\" maxlength=\"40\">\r\n");
      out.write("            </div>\r\n");
      out.write("                \r\n");
      out.write("            <div class=\"form-group\">    \r\n");
      out.write("                <label for=\"mail\">Mail : </label>\r\n");
      out.write("                <input class=\"form-control\" id=\"mail\"  type=\"text\"  name=\"mail\" size=\"60\" maxlength=\"60\">\r\n");
      out.write("            </div>\r\n");
      out.write("                \r\n");
      out.write("            <div class=\"form-group\">    \r\n");
      out.write("                ");
      out.write("\r\n");
      out.write("                <label for=\"pays\">Pays : </label>\r\n");
      out.write("                <select class=\"form-control\" id=\"codePays\" name =\"pays\">\r\n");
      out.write("                    ");

                        ArrayList<Pays> lesPays = (ArrayList)request.getAttribute("pLesPays");
                        for (int i=0; i<lesPays.size();i++){
                            Pays p = lesPays.get(i);
                            out.println("<option value='" + p.getCode()+"'>" + p.getNom()+"</option>" );
                        } 
                    
      out.write("\r\n");
      out.write("                </select>\r\n");
      out.write("            </div>          \r\n");
      out.write("                \r\n");
      out.write("            <div class=\"form-group\">\r\n");
      out.write("                <label for=\"categVente\">Catégorie Vente : </label>\r\n");
      out.write("                <select class=\"form-control\" name=\"categVente\">\r\n");
      out.write("                ");

                        ArrayList<CategVente> lesCategVente = (ArrayList)request.getAttribute("pLesCategVente");
                        for (int i=0; i<lesCategVente.size();i++){
                            CategVente cv = lesCategVente.get(i);
                            out.println("<option value ='" + cv.getCode() + "'>" + cv.getLibelle() + "</option>"); 
                           
                        }
                    
      out.write("\r\n");
      out.write("                </select>\r\n");
      out.write("            </div>     \r\n");
      out.write("                \r\n");
      out.write("                \r\n");
      out.write("                ");
      out.write("\r\n");
      out.write("                 \r\n");
      out.write("                \r\n");
      out.write("                    <button class=\"btn btn-outline-success\" type=\"submit\" name=\"valider\" id=\"valider\" value=\"Valider\">Valider</button> <br>\r\n");
      out.write("            </form>\r\n");
      out.write("        </div>\r\n");
      out.write("        \r\n");
      out.write("    </body>\r\n");
      out.write("</html>\r\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
