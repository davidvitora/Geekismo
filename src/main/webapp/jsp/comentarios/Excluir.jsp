<%-- 
    Document   : RegistroComentario
    Created on : 15/10/2015, 15:42:16
    Author     : Administrador
--%>

<%@page import="br.com.geekismo.persistencia.jdbc.ComentarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
    <%
        ComentarioDAO Controlador = new ComentarioDAO();
        Controlador.excluirComentario
            (Integer.parseInt(request.getParameter("id")));
    %>
    <a href="../../index.jsp">Ver comentarios</a>
</html>
