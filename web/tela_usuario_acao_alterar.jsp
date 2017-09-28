
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.EmissorDAO" %>
<%@ page import="model.Emissor" %>
<%@ page import="java.util.ArrayList" %>
<html>
<head>
    <title>Alterar cadastro</title>
    <style type="text/css">
        body {
            width: 800px;
            height: 600px;
        }
    </style>
</head>
<body>
<% Emissor emissor = EmissorDAO.buscarEmissorPorID(Integer.parseInt(request.getParameter("id"))); %>
<h2 class = "titulo">Atualizar dados de usuário</h2>
<form method="post" action="usuario_acao_cadastrar.jsp?id=<%=emissor.getId()%>">
    <div>
        <label for="usuario-nome">Nome</label>
        <select name = "usuario-nome" id="usuario-nome">
            <option value=""></option>
        </select>
    </div>
</form>
</body>
</html>
