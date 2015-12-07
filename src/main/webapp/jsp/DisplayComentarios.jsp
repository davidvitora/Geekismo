<%-- 
    Document   : DisplayComentarios
    Created on : 15/11/2015, 20:43:18
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
        <script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
        <jsp:useBean id="usuario" class="br.com.geekismo.persistencia.entidade.Usuarios" scope="session">
        </jsp:useBean>
        <jsp:useBean id="artigo" class="br.com.geekismo.persistencia.entidade.Artigo" scope="session">
        </jsp:useBean>
        <%
            ArtigoDAO controlador = new ArtigoDAO();
            try{
                artigo = controlador.getArtigo(Integer.parseInt(request.getParameter("artigo")));
            }
            catch(Exception e){
                e.printStackTrace();
            }
        %>    
        <%
            if( usuario.getNome() != null){
                    usuario.setEstado(true);}
        %>
        <script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
        <script>
            $(document).ready( function(){
                $(".botaocomen").click( function(evt){
                    evt.preventDefault();
                    var comentario = $('#comment').val();
                    $.ajax({
                        type:"POST",
                        url:"/AdicionarComentario",
                        data: {comentario : comentario},
                        beforeSend: function(){
   
                        },
                        success: function(data){
   
                        }        
                                
                    });
                    $.ajax({
                        type:"POST",
                        url:"/jsp/DisplayComentarios.jsp",
                        data: { artigo : <%=artigo.getId()%>},
                        beforeSend: function(){
   
                        },
                        success: function(data){
                            $("#Atualiza").html(data);
   
                            
                        }        
                                
                    });
                });
                
            });
        </script>
    </head>
    <body>
        <div id="Atualiza">
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
                           
                                   <input class="esconder" name="id" value="<%=u.getId()%>"/>
                                   <script>
                                       $(document).ready( function(){
                                        $(".botaocomenex<%=u.getId()%>").click( function(evt){
                                            evt.preventDefault();
                                            var id = <%=u.getId()%>;
                                            $.ajax({
                                                type:"POST",
                                                url:"/ExcluirComentario",
                                                data: { id : id},
                                                beforeSend: function(){

                                                },
                                                success: function(data){

                                                }        

                                            });
                                            $.ajax({
                                                type:"POST",
                                                url:"/jsp/DisplayComentarios.jsp",
                                                data: { artigo : <%=artigo.getId()%> },
                                                beforeSend: function(){

                                                },
                                                success: function(data){
                                                    $("#Atualiza").html(data);


                                                }        

                                            });
                                        });

                                    });
                                   </script>
                                   <button class="botaocomenex<%=u.getId()%> btn btn-default">Excluir</button>
                           
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
            <% if( usuario.isEstado() == true){%>
                <div>
                    <br/>
                    <div style="padding: 20px;">
                            <div class="form-group">
                                <label for="comment">Comentário:</label>
                                <textarea name="comentario" class="form-control" rows="5" id="comment"></textarea>
                            </div>
                            <button class="botaocomen btn btn-default" type="submit">Enviar</button>
                    </div>
                </div>
            <%}else{%>
                <div class="enviarcomentario">
                    <p>Para enviar um comentário faça <a  style="cursor: pointer;" class="navegacao nave" data-toggle="modal" data-target="#myModal">Login</a></p>
                </div>    
            <%}%>
        </div> 
    </body>
</html>	

