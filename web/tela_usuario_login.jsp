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

</head>
<body>
    <div>
        <form action="_usuario_acao_login.jsp" method="post">
            <div id="caixa-login">
                <div id="caixa-login-interno">
                    <div id="caixa-login-label">Faça seu Login</div>

                    <div class="input-div">
                        <input id="usuario-senha" type="text" value="Digite seu email" onfocus="this.value='';" />
                    </div>

                    <div class="input-div">
                        <input id="usuario-senha" type="password" value="Digite sua senha" onfocus="this.value='';"/>
                    </div>

                    <div id="botoes">
                        <div id="botao" title="Entrar">Entrar</div>



                    </div>

                </div>

            </div>
            <aside>
                <img id="imagem" src="bandeira.png" title="bandeira de blumenau">
            </aside>
</body>
</html>
