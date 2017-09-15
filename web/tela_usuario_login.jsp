<%--
  Created by IntelliJ IDEA.
  User: 98930
  Date: 12/09/2017
  Time: 16:39
  To change this template use File | Settings | File Templates.
--%>

<%
    if (session.getAttribute("email") != null) {
        response.sendRedirect("tela_usuario_escolher_ocorrencia.jsp");
    }%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login de usuário</title>
</head>
<body>
    <div>
        <form action="tela_acao_login.jsp" method="post">
            <div>
                <label for="usuario-username">Nome de usuário</label>
                <input type="usuario-username" name="usuario-username" id="usuario-username">
            </div>
            <div>
                <label for="usuario-senha">Senha</label>
                <input type="password" name="usuario-senha" id="usuario-senha">
            </div>
            <button type="submit">Entrar</button>
        </form>
    </div>
    <a href="tela_usuario_cadastrar.jsp">Cidadão novo? Cadastre-se</a>
    <a href="receptor_cadastrar.jsp">Agente novo? Cadastre-se</a>
</body>
</html>
