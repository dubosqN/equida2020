<%-- 
    Document   : cheteur
    Created on : 8 oct. 2020, 09:10:37
    Author     : sio2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% if(session.getAttribute("acheteur") == null){
            session.invalidate();
            request.setAttribute("errMessage", "Déconnexion");
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/login");
            requestDispatcher.forward(request, response);
            System.out.println("------------------ Accès refusé ---------------");
            
        }%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!(Acheteur)</h1>
        <div style="text-align: right"><a href="<%=request.getContextPath()%>/_deconnexion">Deconnexion</a></div>
    </body>
</html>
