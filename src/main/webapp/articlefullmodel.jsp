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
    </head>
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
        <body>
            <div id="Formatacao">     
            <div class="textocabecalho" align="center">
                
                    <button class="btitulo" onclick="submit" name="artigo" value="<%=artigo.getId()%>"><a class="titulo"><%=artigo.getTitulo()%></a></button>
                
                <div id="data"> <span class="data"> Criciuma, <%=artigo.getData()%></span> <span class="data">Autor(a): <%=artigo.getAutor()%></span></div>
            </div>  
            <div id="texto">
                <%=artigo.getCorpo()%>
            </div>
            <div class="rodapedivisao">
                <div class="Comentarios">
                </div>       
            </div>
       </div>
            <script>
                $(document).ready( function(){
                    $(".Comentarios").show( function(evt){
                            var a = $(this).attr("value");
                            $.ajax({
                                type:"POST",
                                url:"/jsp/DisplayComentarios.jsp",
                                data: "artigo="+ <%=artigo.getId()%>,
                                beforeSend: function(){
                                    $("#loader").show();
                                },
                                success: function(data){
                                    $(".Comentarios").html(data);
                                    $("#loader").hide();

                                }        

                            });
                        });
                });
            </script>
    </body>
</html>	
