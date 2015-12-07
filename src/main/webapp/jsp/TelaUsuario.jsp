<%-- 
    Document   : TelaUsuario
    Created on : 15/11/2015, 21:22:52
    Author     : Administrador
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" 
        %> 
<!DOCTYPE html>
<head>
    <script src="../js/TelaUsuarioj.js"></script>
</head>
<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
<!--Inicializa  o bean de usuario -->
        <jsp:useBean id="usuario" class="br.com.geekismo.persistencia.entidade.Usuarios" scope="session">
        </jsp:useBean>
        <h1>menu</h1>
        <ul id="lista">
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
               <button  class="navegacao" type="button" data-toggle="modal" data-target="#myModal">LOGAR</button>
           </li>
           <li>
               <div id="myModal" class="modal fade" role="dialog">
                    <div id="modaldousuario" class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Coloque seus dados para acessar</h4>
                            </div>
                            <div class="modal-body">
                                <form>
                                    <div class="form-group">
                                        <label for="login">Login:</label>
                                        <input name="login" type="text" class="form-control" id="login"/>
                                    </div>
                                    <div class="form-group">
                                        <label for="senha">senha:</label>
                                        <input name="senha" type="text" class="form-control" id="usr" />
                                    </div>
                                    <button id="logar" class="btn btn-default" data-dismiss="modal"><span style="color:Black;">Entrar</span></button>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <span>Não tem conta? <a href="/Formulario_de_registro.jsp" target="self" >Cadastre</a></span>
                                <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                            </div>
                        </div>
                    </div>
                </div>  
            </li>
           <%}%>
        </ul>
