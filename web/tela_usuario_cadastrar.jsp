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
        <label for="usuario-nome">Nome completo</label>
        <input type="text" id="usuario-nome" name="usuario-nome">
    </div>
    <div>
        <label for="usuario-username">Nome de usuário</label>
        <input type="text" id="usuario-username" name="usuario-username">
    </div>
    <div>
        <label for="usuario-data-nascimento">Data de nascimento</label>
        <input type="date" id="usuario-data-nascimento" name="usuario-data-nascimento">
    </div>
    <div>
        <label for="usuario-email">Email</label>
        <input type="email" id="usuario-email" name="usuario-email">
    </div>
    <div>
        <label for="usuario-confirmar-email">Confirmar email</label>
        <input type="email" id="usuario-confirmar-email" name="usuario-confirmar-email">
    </div>
    <div>
        <label for="usuario-senha">Senha</label>
        <input type="password" id="usuario-senha" name="usuario-senha">
    </div>
    <div>
        <label for="usuario-confirmar-senha">Confirmar senha</label>
        <input type="password" id="usuario-confirmar-senha" name="usuario-confirmar-senha">
    </div>
    <div>
        <label for="usuario-rg">RG</label>
        <input type="number" id="usuario-rg" name="usuario-rg">
    </div>
    <div>
        <label for="usuario-cpf">CPF</label>
        <input type="text" id="usuario-cpf" name="usuario-cpf">
    </div>
    <div>
        <label for="usuario-cep">CEP</label>
        <input type="text" id="usuario-cep" name="usuario-cep">
    </div>
    <div>
        <label for="usuario-telefone">Telefone</label>
        <input type="text" id="usuario-telefone" name="usuario-telefone">
    </div>
    <div>
        <label for="usuario-endereco">Endereco</label>
        <input type="text" id="usuario-endereco" name="usuario-endereco">
    </div>
    <div>
        <label for="usuario-numero-residencia">Número de residência</label>
        <input type="number" id="usuario-numero-residencia" name="usuario-numero-residencia">
    </div>

    <button type="submit">Cadastrar</button>
</form>
</body>
</html>
