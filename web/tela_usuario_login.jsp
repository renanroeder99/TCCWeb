<%@ page import="model.Receptor" %><%--
  Created by IntelliJ IDEA.
  User: 98930
  Date: 12/09/2017
  Time: 16:39
  To change this template use File | Settings | File Templates.
--%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login do usuário</title>
    <link rel="stylesheet" type="text/css" href="css/tela_usuario_login.css">
    <link rel="stylesheet" type="text/css" href="css/menu_superior.css">
    <meta charset="UTF-8"/>


</head>
<body>

    <div>
        <form action="_usuario_acao_login.jsp" method="post"/>
            <div id="caixa-login">

                <div id="caixa-login-interno">
                    <div id="caixa-login-label">Faça seu Login</div>

                    <div class="input-div">
                        <input id="usuario-email" name="usuario-email" type="text" placeholder="Digite seu Email" />
                    </div>

                    <div class="input-div">
                        <input id="usuario-senha" name="usuario-senha" type="password" placeholder="Digite sua Senha"/>
                    </div>
                    <div class="input-div">
                        <a href="tela_usuario_cadastrar.jsp">Não é cadastrado? Cadastre-se.</a>
                    </div>

                    <div id="botoes">
                        <button id="botao" type="submit">Entrar</button>

                    </div>

                </div>

            </div>
    </div>
            <aside>
                <img id="imagem" src="css/imagens/bandeira.png" title="bandeira de blumenau">
            </aside>
</body>
</html>
