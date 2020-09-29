package org.apache.jsp.vues;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import modele.Client;

public final class clientConsulter_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        <title>Consultation CLient</title>\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        <h1>Infos clients</h1>\r\n");
      out.write("        \r\n");
      out.write("         ");

        Client unClient = (Client)request.getAttribute("pClient");
        
      out.write("\r\n");
      out.write("        \r\n");
      out.write("        \r\n");
      out.write("         <table class=\"table table-bordered table-striped table-condensed\">\r\n");
      out.write("            <tr><td>NOM :</td><td>");
 out.println(unClient.getNom());
      out.write("</td></tr>\r\n");
      out.write("            <tr><td>PRENOM :</td><td>");
  out.println(unClient.getPrenom());
      out.write("</td>  </tr>\r\n");
      out.write("            <tr><td>ADRESSE  :</td><td>");
  out.println(unClient.getRue());
      out.write("</td>  </tr>\r\n");
      out.write("            <tr><td> CODE POSTAL  :</td><td>");
  out.println(unClient.getCopos());
      out.write("</td>  </tr>\r\n");
      out.write("          <tr><td> VILLE  :</td><td>");
  out.println(unClient.getVille());
      out.write("</td>  </tr>\r\n");
      out.write("          <tr><td> Catégories selectionnées</td><td>\r\n");
      out.write("          ");
 for (int i=0; i<unClient.getLesCategVentes().size(); i++){
               out.println(unClient.getLesCategVentes().get(i).getCode() + "</br>");
             
          }
          
      out.write("\r\n");
      out.write("              </td></tr>\r\n");
      out.write("        </table>\r\n");
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
