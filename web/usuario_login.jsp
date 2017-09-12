<%--
  Created by IntelliJ IDEA.
  User: 98930
  Date: 12/09/2017
  Time: 16:39
  To change this template use File | Settings | File Templates.
--%>

<%
    if (session.getAttribute("email") != null) {
        response.sendRedirect("usuario_escolher_ocorrencia.jsp");
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
                <label for="usuario-email">E-Mail</label>
                <input type="usuario-email" name="usuario-email" id="usuario-email">
            </div>
            <div>
                <label for="usuario-senha">Senha</label>
                <input type="password" name="usuario-senha" id="usuario-senha">
            </div>
            <button type="submit">Entrar</button>
        </form>
    </div>

</body>
</html>
