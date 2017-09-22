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
    <title>Login de usuário</title>
    <link rel="stylesheet" type="text/css" href="css/tela_usuario_login.css">
</head>
<body>


    <div>
        <form action="_usuario_acao_login.jsp" method="post">
            <div>

                <label for="usuario-username" class="label-cadastro">Usuário</label>
                <input type="email" name="usuario-username" id="usuario-username">
            </div>

            <div>
                <label for="usuario-senha" class="label-cadastro">Senha</label>
                <input type="password" name="usuario-senha" id="usuario-senha">
            </div>
            <br>
            <button type="submit">Entrar</button>

        </form>
    </div>
    <a href="tela_usuario_cadastrar.jsp">Cidadão novo?Cadastre-se</a>


</body>
</html>
