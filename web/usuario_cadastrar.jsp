<%--
  Created by IntelliJ IDEA.
  User: 98930
  Date: 12/09/2017
  Time: 15:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="menu_superior.jsp"/>

<form action="usuario_acao_cadastrar.jsp" method="POST">
    <div>
        <label for="usuario-nome">Nome</label>
        <input type="text" id="usuario-nome" name="usuario-nome">
    </div>
    <button type="submit">Cadastrar</button>
</form>
</body>
</html>
