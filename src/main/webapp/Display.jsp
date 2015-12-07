<%-- 
    Document   : Display
    Created on : 01/11/2015, 22:43:03
    Author     : Administrador
--%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" 
        import="br.com.geekismo.Display"
        import="java.util.List"
        import="br.com.geekismo.persistencia.jdbc.ArtigoDAO"
        import="br.com.geekismo.persistencia.entidade.Artigo"
        %>
<html>
    <head>
        <script src="js/DisplayArticles.js"></script>
    </head>
    <body>
    <%
        ArtigoDAO controlador = new ArtigoDAO();
        //Limite de artigos em cada pagina
        int limiteArtigo = 3 ;
        //Artigos atualmente arquivados
        int artigosAtivos = controlador.contarArtigos();
        //interador
        int i ;
        //Contador de paginas
        int contPaginas = 1;
        int contArtigos = limiteArtigo;
        //Pagina que está sendo vizualizada
        int paginaAtual;
        String protocoloPagina = request.getParameter("pa");
        if( protocoloPagina == null) paginaAtual = 1;
        else paginaAtual = Integer.parseInt(protocoloPagina);
        //Finalizado
        //Geração dinamica de Botões de pagina
        for( i = 1; i <= artigosAtivos; i++) {
        if (i > contArtigos){
        contPaginas++;
        contArtigos += 3; %>
        <%
        }
        }
        %>
            <%
            List<Artigo> artigosLista = Display.getArtigos(artigosAtivos,paginaAtual,contPaginas);;
            for(Artigo u: artigosLista){%>
            <div id="Formatacao">   
                <div class="textocabecalho" align="center">
                        <button class="btitulo" value="<%=u.getId()%>"><a class="titulo"><%=u.getTitulo()%></a></button>
                    <div id="data"> <span class="data"> Criciuma, <%=u.getData()%></span> <span class="data">Autor(a): <%=u.getAutor()%></span></div>
                </div>                
                <div id="texto">
                    <%=u.getCorpo()%>
                </div>
                <div class="rodapedivisao">
                    <div class="Comentarios">
                        <p class="Comentarios" ><%=controlador.contarComentario(u.getId())%> Comentários</p>
                    </div>
                </div>
            </div>    
            <%}%>
    </body>
</html>