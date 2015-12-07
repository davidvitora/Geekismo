<%-- 
    Document   : index
    Created on : 20/07/2015, 18:13
    Author     : david
--%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" 
        import="br.com.geekismo.Display"
        import="java.util.List"
        import="br.com.geekismo.persistencia.jdbc.ArtigoDAO"
        import="br.com.geekismo.persistencia.entidade.Artigo"
        %> 
<!DOCTYPE html>
<html>
<head>
<title>Geekismo - Porque Geek é o novo sexy</title>
<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="js/facebook.js" ></script>
<script src="js/Display.js"></script>
<script src="js/bootstrap.min.js"></script>
<script>
        $(document).ready( function(){
            
        });    
</script>
<%
    ArtigoDAO controlador = new ArtigoDAO();
    //Limite de artigos em cada pagina
    int limiteArtigo = 3 ;
    //Artigos atualmente arquivados
    int artigosAtivos = controlador.contarArtigos();
%>
<!--Inicializa  o bean de usuario -->
<jsp:useBean id="usuario" class="br.com.geekismo.persistencia.entidade.Usuarios" scope="session">
        </jsp:useBean>
        <% 
        if( usuario.getNome() != null){
                    usuario.setEstado(true);}
        %>
</head>
<body>
<div id="fb-root"></div>

<div class="container-fluid">
    <nav id="navegacao" class="row pimba">
        <h1>menu</h1>
        
    </nav>
<div class="container">
	<header id="cabecalho" class="row">
		<img id="logo" class="img-responsive" alt="Logo"  src="_imagens/logo.png"/>
        </header>
    <nav id="pagina" class="row">
        <h1>menu</h1>
        <ul>
            <li>
                <form method="get" action="index.jsp" >
                    <button class="nave"  id="1">1</button>
                </form>
            </li>
            <%
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
                <li>
                    <form method="get" action="index.jsp" >
                        <button class="nave"  id="<%=contPaginas%>"><%=contPaginas%></button>
                    </form>
                </li>

            <%
                }
            }//Geração Dinamica Finalizada
            %>
        </ul>
    </nav>
    <div  class="row">
	<section role="main" id="publicacao" class="col-md-8">
            <div id="Conteudo">
                
            </div>
            <div id="loader" style="display:none;padding: 20px;"><img src="gifs/carregando.gif"/></div>
        </section>
        <aside role="complementary" id="lateral" class="col-md-3">
            <div class="fb-page" data-href="https://www.facebook.com/geekysmo" data-small-header="true" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true" data-show-posts="true"><div class="fb-xfbml-parse-ignore"><blockquote cite="https://www.facebook.com/geekysmo"><a href="https://www.facebook.com/geekysmo">Geekismo</a></blockquote></div></div>
	</aside>
    </div>
    <div id="footer" class="row">
            Todas as imagens de filmes, séries e etc são marcas registradas dos seus respectivos proprietários
    </div>
    </div>
</body>
</html>
