<html>
    <head>
        <title>Geekismo - Cadastro de novo usuário</title>
        <meta charset="utf-8" />
        <link href="css/FormularioRegistro.css" rel="stylesheet">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
        <script src="js/jquery.validate.js" type="text/javascript"></script>
        <script src="js/ValidadorForm.js" type="text/javascript"></script>
    </head>
    <body>
        <div class="JanelaFormulario" align="center">     
            <div class="Cabecalho">
                <h1 class="Titulo ">NOVO CADASTRO</h1>
                <h5 class="Dica">Coloque seus dados para registrar uma nova conta</h5>
            </div>
            <div class="Corpo">
                <form id="form-signup" role="form" action="/AdicionarUsuario">
                    <div class="form-group">
                       <label>
                           Email:
                           <input id="email" class="form-control textopreto" type="text" name="email" />
                       </label><br/>
                    </div>
                    <div class="form-group">
                       <label>
                           Nome:
                           <input id="nome" class="form-control textopreto" type="text" name="nome" />
                       </label><br/>
                    </div>
                    <div class="form-group">
                       <label>
                           Login:
                           <input id="usuario" class="form-control textopreto" type="text" name="login" />
                       </label><br/>
                    </div>
                    <div class="form-group">
                       <label>
                           Senha:
                           <input id="senha" class="form-control textopreto" type="password" name="senha" />
                       </label><br/>
                    </div>
                    <div class="form-group">
                       <label>
                           Redigite a senha:
                           <input class="form-control textopreto" id="comfirmarsenha"  type="password" name="comfirmarsenha" />
                       </label><br/>
                    </div>
                    <input id="cadastra" type="submit" class="btn btn-default"  value="Cadastrar"/><br/>
                </form>
            </div>
        </div>
    </body>
</html>

