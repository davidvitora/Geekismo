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
<%
    ArtigoDAO controlador = new ArtigoDAO();
    //Limite de artigos em cada pagina
    int limiteArtigo = 3 ;
    //Artigos atualmente arquivados
    int artigosAtivos = controlador.contarArtigos();
%>
<jsp:useBean id="artigo" class="br.com.geekismo.persistencia.entidade.Artigo" scope="session">
</jsp:useBean>
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
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/pt_BR/sdk.js#xfbml=1&version=v2.5";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<div class="container-fluid">
    <nav id="navegacao" class="row">
        <h1>menu</h1>
        <ul>
            <li>
                <form method="get" action="index.jsp" >
                    <button class="navegacao nave" onclick="submit" name="pa" value="1">HOME</button>
                </form>
            </li>
            <li>
                <form method="get" action="index.jsp" >
                    <button class="navegacao nave" onclick="submit">SOBRE</button>
                </form>
            </li>
            <% if( usuario.isEstado() == true){%>
            <li>    
                <form method="get" action="SairUsuario" >
                    <button class="navegacao nave" onclick="submit"><span class="glyphicon glyphicon-sunglasses"></span> Sair</button>
                </form>
            </li>    
            <li>     
                <form method="get">
                    <button class="navegacao nave"><jsp:getProperty name="usuario" property="nome"/></button>
                </form>
            </li>
           <%}else{%>
           <li>
               <button  class="navegacao nave" type="button" data-toggle="modal" data-target="#myModal">LOGAR</button>
           </li>
           <li>
               <div id="myModal" class="modal fade" role="dialog">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Coloque seus dados para acessar</h4>
                            </div>
                            <div class="modal-body">
                                <form role="form" action="LoginUsuario">
                                    <div class="form-group">
                                        <label for="login">Login:</label>
                                        <input name="login" type="text" class="form-control" id="login"/>
                                    </div>
                                    <div class="form-group">
                                        <label for="senha">senha:</label>
                                        <input name="senha" type="text" class="form-control" id="usr" />
                                    </div>
                                    <button type="submit" class="btn btn-default"><span style="color:Black;">Entrar</span></button>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <span>Não tem conta? <a href="Formulario_de_registro.jsp"> Cadastre-se</a>
                                <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                            </div>
                        </div>
                    </div>
                </div>  
            </li>    
           <%}%>
        </ul>
    </nav>
<div class="container">
   <%--<a href="htmleditor/Editor.jsp">aaaaa</a>--%>
	<header id="cabecalho" class="row">
		<img id="logo" class="img-responsive" alt="Logo"  src="_imagens/logo.png"/>
        </header>
    <nav id="pagina" class="row">
        <h1>menu</h1>
        <ul>
            <li>
                <form method="get" action="index.jsp" >
                    <button class="nave" onclick="submit">1</button>
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
                        <button class="nave" onclick="submit" name="pa" value="<%=contPaginas%>"><%=contPaginas%></button>
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
            <%
            List<Artigo> artigosLista = Display.getArtigos(artigosAtivos,paginaAtual,contPaginas);;
            for(Artigo u: artigosLista){%>
            <div id="Formatacao">   
                <div class="textocabecalho" align="center">
                    <form method="get" action="DefineArtigo">
                        <button class="bttitulo" onclick="submit" name="artigo" value="<%=u.getId()%>"><a class="titulo"><%=u.getTitulo()%></a></button>
                    </form>
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
