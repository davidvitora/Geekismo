<%-- 
    Document   : articlefullmodel
    Created on : 17/10/2015, 23:08:45
    Author     : Administrador
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" 
        import="br.com.geekismo.persistencia.jdbc.ArtigoDAO"
        import="br.com.geekismo.persistencia.entidade.Artigo"
        import="br.com.geekismo.persistencia.jdbc.ComentarioDAO" 
        import="java.util.List"
        import="br.com.geekismo.persistencia.entidade.Comentarios"%>
<!DOCTYPE html>
<html>
<head>
    <title>Geekismo - Porque Geek é o novo sexy</title>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
        <jsp:useBean id="usuario" class="br.com.geekismo.persistencia.entidade.Usuarios" scope="session">
        </jsp:useBean>
        <jsp:useBean id="artigo" class="br.com.geekismo.persistencia.entidade.Artigo" scope="session">
        </jsp:useBean>
        <%
            if( usuario.getNome() != null){
                    usuario.setEstado(true);}
        %>
</head>
<body>
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
</div>
<div class="container">
    <header id="cabecalho" class="row">
        <img id="logo" class="img-responsive"  src="_imagens/logo.png"/>

    </header>
    <div id="publicacao" class="row">
        
        <section role="main" id="publicacao" class="col-md-12">
            <div id="Formatacao">     
                <div class="textocabecalho" align="center">
                    <form method="get" action="DefineArtigo">
                        <button class="bttitulo" onclick="submit" name="artigo" value="<%=artigo.getId()%>"><a class="titulo"><%=artigo.getTitulo()%></a></button>
                    </form>
                    <div id="data"> <span class="data"> Criciuma, <%=artigo.getData()%></span> <span class="data">Autor(a): <%=artigo.getAutor()%></span></div>
                </div>  
                <div id="texto">
                    <%=artigo.getCorpo()%>
                </div>
                <div class="rodapedivisao">
                    <div class="Comentarios">
                        
                <% 
                    ComentarioDAO Controlador = new ComentarioDAO();
                    List<Comentarios> lista = Controlador.buscarComentarios
                    (artigo.getId());
                    for(Comentarios u: lista){
                        if( Integer.parseInt(u.getId_usuario()) == usuario.getId()){%>
                         <div class="media">
                                <div class="media-left">
                                    <a href="#">
                                    <img class="media-object" src="_imagens/_icones/avatar.png" alt="...">
                                    </a>
                                </div>
                                <div class="media-body">
                                    <h4 class="media-heading"><span class="comennome"><%=u.getNome()%></span></h4>
                                    <p class="textocomentario"><%=u.getComentario()%></p>
                                </div>
                                <form action="ExcluirComentario" method="get">
                                        <input class="esconder" name="id" value="<%=u.getId()%>"/>
                                        <button type="submit" class="btn btn-default botao">Excluir</button>
                                </form>
                         </div>
                      <%}else{%>
                             <div class="media">
                                <div class="media-left">
                                    <a href="#">
                                    <img class="media-object" src="_imagens/_icones/avatar.png" alt="...">
                                    </a>
                                </div>
                                <div class="media-body">
                                    <h4 class="media-heading"><span class="comennome"><%=u.getNome()%></span></h4>
                                    <div class="textocomentario"><p><%=u.getComentario()%></p></div>
                                </div>
                            </div>
                      <%}}%>
                    </div>
                </div>
                <% if( usuario.isEstado() == true){%>
                <div>
                    <br/>
                    <div style="padding: 20px;">
                        <form role="form" method="get" action="AdicionarComentario">
                            <div class="form-group">
                                <label for="comment">Comentário:</label>
                                <textarea name="comentario" class="form-control" rows="5" id="comment"></textarea>
                            </div>
                            <button type="submit" class="btn btn-default">Enviar</button>
                        </form>
                    </div>
                </div>
                <%}else{%>
                <div class="enviarcomentario">
                    <p>Para enviar um comentário faça <a  style="cursor: pointer;" class="navegacao nave" data-toggle="modal" data-target="#myModal">Login</a></p>
                </div>    
                <%}%>
            </div>
        </section>
        
    </div>
    <div id="footer" class="row">
        Todas as imagens de filmes, séries e etc são marcas registradas dos seus respectivos proprietários
    </div>
   </div>
</body>
</html>	
